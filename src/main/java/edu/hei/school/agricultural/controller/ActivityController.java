package edu.hei.school.agricultural.controller;

import edu.hei.school.agricultural.controller.dto.CreateActivityMemberAttendance;
import edu.hei.school.agricultural.controller.dto.CreateCollectivityActivity;
import edu.hei.school.agricultural.controller.mapper.ActivityDtoMapper;
import edu.hei.school.agricultural.controller.mapper.AttendanceDtoMapper;
import edu.hei.school.agricultural.exception.BadRequestException;
import edu.hei.school.agricultural.exception.NotFoundException;
import edu.hei.school.agricultural.service.ActivityService;
import edu.hei.school.agricultural.service.AttendanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.http.HttpStatus.*;

@RestController
@RequiredArgsConstructor
public class ActivityController {

    private final ActivityService activityService;
    private final AttendanceService attendanceService;
    private final ActivityDtoMapper activityDtoMapper;
    private final AttendanceDtoMapper attendanceDtoMapper;

    @PostMapping("/collectivities/{id}/activities")
    public ResponseEntity<?> createCollectivityActivities(
            @PathVariable String id,
            @RequestBody List<CreateCollectivityActivity> createCollectivityActivities
    ) {
        try {
            var activities = createCollectivityActivities.stream()
                    .map(activityDto -> activityDtoMapper.mapToEntity(id, activityDto))
                    .toList();

            return ResponseEntity.status(OK)
                    .body(activityService.createActivities(id, activities)
                            .stream()
                            .map(activityDtoMapper::mapToDto)
                            .toList());

        } catch (BadRequestException e) {
            return ResponseEntity.status(BAD_REQUEST).body(e.getMessage());
        } catch (NotFoundException e) {
            return ResponseEntity.status(NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @GetMapping("/collectivities/{id}/activities")
    public ResponseEntity<?> getCollectivityActivities(
            @PathVariable String id
    ) {
        try {
            return ResponseEntity.status(OK)
                    .body(activityService.getActivities(id)
                            .stream()
                            .map(activityDtoMapper::mapToDto)
                            .toList());

        } catch (BadRequestException e) {
            return ResponseEntity.status(BAD_REQUEST).body(e.getMessage());
        } catch (NotFoundException e) {
            return ResponseEntity.status(NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @PostMapping("/collectivities/{id}/activities/{activityId}/attendance")
    public ResponseEntity<?> createActivityAttendance(
            @PathVariable String id,
            @PathVariable String activityId,
            @RequestBody List<CreateActivityMemberAttendance> createActivityMemberAttendances
    ) {
        try {
            var attendances = createActivityMemberAttendances.stream()
                    .map(attendanceDto -> attendanceDtoMapper.mapToEntity(activityId, attendanceDto))
                    .toList();

            return ResponseEntity.status(OK)
                    .body(attendanceService.createAttendances(id, activityId, attendances)
                            .stream()
                            .map(attendanceDtoMapper::mapToDto)
                            .toList());

        } catch (BadRequestException e) {
            return ResponseEntity.status(BAD_REQUEST).body(e.getMessage());
        } catch (NotFoundException e) {
            return ResponseEntity.status(NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    @GetMapping("/collectivities/{id}/activities/{activityId}/attendance")
    public ResponseEntity<?> getActivityAttendance(
            @PathVariable String id,
            @PathVariable String activityId
    ) {
        try {
            return ResponseEntity.status(OK)
                    .body(attendanceService.getAttendances(id, activityId)
                            .stream()
                            .map(attendanceDtoMapper::mapToDto)
                            .toList());

        } catch (BadRequestException e) {
            return ResponseEntity.status(BAD_REQUEST).body(e.getMessage());
        } catch (NotFoundException e) {
            return ResponseEntity.status(NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }
}