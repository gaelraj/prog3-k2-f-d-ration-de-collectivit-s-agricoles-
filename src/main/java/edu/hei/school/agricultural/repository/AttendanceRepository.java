package edu.hei.school.agricultural.repository;

import edu.hei.school.agricultural.entity.ActivityMemberAttendance;
import edu.hei.school.agricultural.entity.AttendanceStatus;
import edu.hei.school.agricultural.entity.MemberDescription;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static java.util.UUID.randomUUID;

@Repository
@RequiredArgsConstructor
public class AttendanceRepository {

    private final Connection connection;

    public List<ActivityMemberAttendance> saveAll(List<ActivityMemberAttendance> attendances) {
        List<ActivityMemberAttendance> savedAttendances = new ArrayList<>();

        for (ActivityMemberAttendance attendance : attendances) {
            Optional<ActivityMemberAttendance> existingAttendance =
                    findByActivityIdAndMemberId(attendance.getActivityId(), attendance.getMemberId());

            if (existingAttendance.isPresent()) {
                updateAttendance(existingAttendance.get().getId(), attendance.getAttendanceStatus());
            } else {
                insertAttendance(attendance);
            }

            ActivityMemberAttendance savedAttendance =
                    findByActivityIdAndMemberId(attendance.getActivityId(), attendance.getMemberId()).orElseThrow();

            savedAttendances.add(savedAttendance);
        }

        return savedAttendances;
    }

    private void insertAttendance(ActivityMemberAttendance attendance) {
        String sql = """
                insert into activity_member_attendance (
                    id,
                    activity_id,
                    member_id,
                    attendance_status
                )
                values (?, ?, ?, ?)
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (attendance.getId() == null) {
                attendance.setId(randomUUID().toString());
            }

            ps.setString(1, attendance.getId());
            ps.setString(2, attendance.getActivityId());
            ps.setString(3, attendance.getMemberId());
            ps.setString(4, attendance.getAttendanceStatus().name());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting attendance: " + e.getMessage(), e);
        }
    }

    private void updateAttendance(String attendanceId, AttendanceStatus attendanceStatus) {
        String sql = """
                update activity_member_attendance
                set attendance_status = ?
                where id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, attendanceStatus.name());
            ps.setString(2, attendanceId);

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating attendance: " + e.getMessage(), e);
        }
    }

    public Optional<ActivityMemberAttendance> findByActivityIdAndMemberId(
            String activityId,
            String memberId
    ) {
        String sql = """
                select
                    ama.id as attendance_id,
                    ama.activity_id,
                    ama.member_id,
                    ama.attendance_status,
                    m.first_name,
                    m.last_name,
                    m.email,
                    m.occupation
                from activity_member_attendance ama
                join "member" m on m.id = ama.member_id
                where ama.activity_id = ?
                and ama.member_id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, activityId);
            ps.setString(2, memberId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Optional.of(mapFromResultSet(rs));
            }

            return Optional.empty();
        } catch (SQLException e) {
            throw new RuntimeException("Error finding attendance by member: " + e.getMessage(), e);
        }
    }

    public List<ActivityMemberAttendance> findAllByCollectivityIdAndActivityIdIncludingUndefined(
            String collectivityId,
            String activityId
    ) {
        List<ActivityMemberAttendance> attendances = new ArrayList<>();

        String sql = """
                select
                    ama.id as attendance_id,
                    ama.activity_id,
                    ama.member_id,
                    ama.attendance_status,
                    m.first_name,
                    m.last_name,
                    m.email,
                    m.occupation
                from activity_member_attendance ama
                join "member" m on m.id = ama.member_id
                where ama.activity_id = ?
                
                union all
                
                select
                    null as attendance_id,
                    ? as activity_id,
                    m.id as member_id,
                    'UNDEFINED' as attendance_status,
                    m.first_name,
                    m.last_name,
                    m.email,
                    m.occupation::text as occupation
                from collectivity_member cm
                join "member" m on m.id = cm.member_id
                join collectivity_activity_occupation cao
                    on cao.member_occupation = m.occupation::text
                where cm.collectivity_id = ?
                and cao.activity_id = ?
                and not exists (
                    select 1
                    from activity_member_attendance ama2
                    where ama2.activity_id = ?
                    and ama2.member_id = m.id
                )
                order by member_id
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, activityId);
            ps.setString(2, activityId);
            ps.setString(3, collectivityId);
            ps.setString(4, activityId);
            ps.setString(5, activityId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                attendances.add(mapFromResultSet(rs));
            }

            return attendances;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding activity attendances: " + e.getMessage(), e);
        }
    }

    private ActivityMemberAttendance mapFromResultSet(ResultSet rs) throws SQLException {
        String attendanceStatusValue = rs.getString("attendance_status");

        MemberDescription memberDescription = MemberDescription.builder()
                .id(rs.getString("member_id"))
                .firstName(rs.getString("first_name"))
                .lastName(rs.getString("last_name"))
                .email(rs.getString("email"))
                .occupation(rs.getString("occupation"))
                .build();

        return ActivityMemberAttendance.builder()
                .id(rs.getString("attendance_id"))
                .activityId(rs.getString("activity_id"))
                .memberId(rs.getString("member_id"))
                .attendanceStatus(attendanceStatusValue == null ? null : AttendanceStatus.valueOf(attendanceStatusValue))
                .memberDescription(memberDescription)
                .build();
    }
}