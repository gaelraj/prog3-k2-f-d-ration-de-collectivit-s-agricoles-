package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.CollectivityResponse;
import com.federation.federationdecollectivitesagricoles.dto.CreateCollectivityRequest;
import com.federation.federationdecollectivitesagricoles.service.CollectivityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
}