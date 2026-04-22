package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.CollectivityIdentificationResponse;
import com.federation.federationdecollectivitesagricoles.dto.CollectivityResponse;
import com.federation.federationdecollectivitesagricoles.dto.CreateCollectivityRequest;
import com.federation.federationdecollectivitesagricoles.dto.IdentificationRequest;
import com.federation.federationdecollectivitesagricoles.service.CollectivityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class CollectivityController {

    private final CollectivityService collectivityService;

    public CollectivityController(CollectivityService collectivityService) {
        this.collectivityService = collectivityService;
    }

    @PostMapping("/collectivities")
    public ResponseEntity<?> createCollectivity(@RequestBody CreateCollectivityRequest request) {
        try {
            CollectivityResponse response = collectivityService.createCollectivity(request);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PutMapping("/collectivities/{id}/identification")
    public ResponseEntity<?> updateIdentification(
            @PathVariable Long id,
            @RequestBody IdentificationRequest request) {

        if (request.getNumber() == null || request.getNumber().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Number is required");
        }
        if (request.getName() == null || request.getName().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Name is required");
        }

        try {
            CollectivityIdentificationResponse response = collectivityService.updateIdentification(id, request);
            return ResponseEntity.status(HttpStatus.OK).body(response);
        } catch (RuntimeException e) {
            String message = e.getMessage();
            if (message.contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(message);
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(message);
        }
    }

}