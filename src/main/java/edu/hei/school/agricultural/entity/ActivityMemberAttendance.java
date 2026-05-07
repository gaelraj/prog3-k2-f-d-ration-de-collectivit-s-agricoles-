package edu.hei.school.agricultural.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class ActivityMemberAttendance {
    private String id;
    private String activityId;
    private String memberId;
    private MemberDescription memberDescription;
    private AttendanceStatus attendanceStatus;
}