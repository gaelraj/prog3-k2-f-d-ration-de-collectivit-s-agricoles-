package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.request.CreateActivityRequest;
import com.federation.federationdecollectivitesagricoles.dto.response.ActivityResponse;
import com.federation.federationdecollectivitesagricoles.service.ActivityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ActivityController {

    private final ActivityService activityService;

    public ActivityController(ActivityService activityService) {
        this.activityService = activityService;
    }

    @PostMapping("/collectivities/{id}/activities")
    public ResponseEntity<?> createActivities(
            @PathVariable Long id,
            @RequestBody List<CreateActivityRequest> requests) {

        try {
            List<ActivityResponse> responses = activityService.createActivities(id, requests);
            return ResponseEntity.status(HttpStatus.OK).body(responses);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}