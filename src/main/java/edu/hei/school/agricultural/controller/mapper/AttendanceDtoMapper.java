package edu.hei.school.agricultural.controller.mapper;

import edu.hei.school.agricultural.controller.dto.CreateActivityMemberAttendance;
import edu.hei.school.agricultural.entity.ActivityMemberAttendance;
import edu.hei.school.agricultural.entity.AttendanceStatus;
import edu.hei.school.agricultural.entity.MemberDescription;
import org.springframework.stereotype.Component;

@Component
public class AttendanceDtoMapper {

    public ActivityMemberAttendance mapToEntity(
            String activityId,
            CreateActivityMemberAttendance dto
    ) {
        return ActivityMemberAttendance.builder()
                .activityId(activityId)
                .memberId(dto.getMemberIdentifier())
                .attendanceStatus(dto.getAttendanceStatus() == null ? null :
                        AttendanceStatus.valueOf(dto.getAttendanceStatus().name())
                )
                .build();
    }

    public edu.hei.school.agricultural.controller.dto.ActivityMemberAttendance mapToDto(
            ActivityMemberAttendance attendance
    ) {
        MemberDescription memberDescription = attendance.getMemberDescription();

        return edu.hei.school.agricultural.controller.dto.ActivityMemberAttendance.builder()
                .id(attendance.getId())
                .memberDescription(memberDescription == null ? null :
                        edu.hei.school.agricultural.controller.dto.MemberDescription.builder()
                                .id(memberDescription.getId())
                                .firstName(memberDescription.getFirstName())
                                .lastName(memberDescription.getLastName())
                                .email(memberDescription.getEmail())
                                .occupation(memberDescription.getOccupation())
                                .build()
                )
                .attendanceStatus(attendance.getAttendanceStatus() == null ? null :
                        edu.hei.school.agricultural.controller.dto.AttendanceStatus.valueOf(
                                attendance.getAttendanceStatus().name()
                        )
                )
                .build();
    }
}