package edu.hei.school.agricultural.service;

import edu.hei.school.agricultural.entity.*;
import edu.hei.school.agricultural.exception.BadRequestException;
import edu.hei.school.agricultural.exception.NotFoundException;
import edu.hei.school.agricultural.repository.ActivityRepository;
import edu.hei.school.agricultural.repository.AttendanceRepository;
import edu.hei.school.agricultural.repository.CollectivityRepository;
import edu.hei.school.agricultural.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import static edu.hei.school.agricultural.entity.AttendanceStatus.ATTENDED;
import static edu.hei.school.agricultural.entity.AttendanceStatus.UNDEFINED;
import static java.util.UUID.randomUUID;

@Service
@RequiredArgsConstructor
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;
    private final ActivityRepository activityRepository;
    private final CollectivityRepository collectivityRepository;
    private final MemberRepository memberRepository;

    public List<ActivityMemberAttendance> createAttendances(
            String collectivityId,
            String activityId,
            List<ActivityMemberAttendance> attendances
    ) {
        Collectivity collectivity = collectivityRepository.findById(collectivityId)
                .orElseThrow(() -> new NotFoundException("Collectivity.id=" + collectivityId + " not found"));

        CollectivityActivity activity = activityRepository.findByCollectivityIdAndActivityId(collectivityId, activityId)
                .orElseThrow(() -> new NotFoundException("Activity.id=" + activityId + " not found"));

        for (ActivityMemberAttendance attendance : attendances) {
            validateAttendance(collectivity, activity, attendance);

            attendance.setId(randomUUID().toString());
            attendance.setActivityId(activityId);
        }

        return attendanceRepository.saveAll(attendances);
    }

    public List<ActivityMemberAttendance> getAttendances(
            String collectivityId,
            String activityId
    ) {
        collectivityRepository.findById(collectivityId)
                .orElseThrow(() -> new NotFoundException("Collectivity.id=" + collectivityId + " not found"));

        activityRepository.findByCollectivityIdAndActivityId(collectivityId, activityId)
                .orElseThrow(() -> new NotFoundException("Activity.id=" + activityId + " not found"));

        return attendanceRepository.findAllByCollectivityIdAndActivityIdIncludingUndefined(
                collectivityId,
                activityId
        );
    }

    private void validateAttendance(
            Collectivity collectivity,
            CollectivityActivity activity,
            ActivityMemberAttendance attendance
    ) {
        if (attendance == null) {
            throw new BadRequestException("Attendance payload is required");
        }

        if (attendance.getMemberId() == null || attendance.getMemberId().isBlank()) {
            throw new BadRequestException("Member identifier is required");
        }

        if (attendance.getAttendanceStatus() == null) {
            throw new BadRequestException("Attendance status is required");
        }

        Member member = memberRepository.findById(attendance.getMemberId())
                .orElseThrow(() -> new NotFoundException("Member.id=" + attendance.getMemberId() + " not found"));

        boolean memberIsInCollectivity = collectivity.getMembers() != null
                && collectivity.getMembers()
                .stream()
                .anyMatch(collectivityMember -> collectivityMember.getId().equals(member.getId()));

        boolean memberIsConcernedByActivity = isMemberConcernedByActivity(
                member,
                memberIsInCollectivity,
                activity
        );

        if (!memberIsConcernedByActivity && !ATTENDED.equals(attendance.getAttendanceStatus())) {
            throw new BadRequestException(
                    "Member.id=" + member.getId() + " is not concerned by activity and can only be ATTENDED"
            );
        }

        Optional<ActivityMemberAttendance> existingAttendance =
                attendanceRepository.findByActivityIdAndMemberId(activity.getId(), member.getId());

        if (existingAttendance.isPresent()
                && !UNDEFINED.equals(existingAttendance.get().getAttendanceStatus())) {
            throw new BadRequestException(
                    "Attendance for Member.id=" + member.getId() + " is already confirmed"
            );
        }
    }

    private boolean isMemberConcernedByActivity(
            Member member,
            boolean memberIsInCollectivity,
            CollectivityActivity activity
    ) {
        if (!memberIsInCollectivity) {
            return false;
        }

        if (activity.getMemberOccupationConcerned() == null
                || activity.getMemberOccupationConcerned().isEmpty()) {
            return true;
        }

        return activity.getMemberOccupationConcerned().contains(member.getOccupation());
    }
}