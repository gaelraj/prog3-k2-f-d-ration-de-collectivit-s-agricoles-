package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.*;
import com.federation.federationdecollectivitesagricoles.service.CollectivityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
public class CollectivityController {

    private final CollectivityService collectivityService;

    public CollectivityController(CollectivityService collectivityService) {
        this.collectivityService = collectivityService;
    }

    @PostMapping("/collectivities")
    public ResponseEntity<?> createCollectivities(@RequestBody List<CreateCollectivityRequest> requests) {
        try {
            List<CollectivityResponse> responses = collectivityService.createCollectivities(requests);
            return ResponseEntity.status(HttpStatus.CREATED).body(responses);
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

    @GetMapping("/collectivities/{id}/membershipFees")
    public ResponseEntity<?> getMembershipFees(@PathVariable Long id) {
        try {
            List<MembershipFeeResponse> fees = collectivityService.getMembershipFees(id);
            return ResponseEntity.ok(fees);
        } catch (RuntimeException e) {
            if (e.getMessage().contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/collectivities/{id}/membershipFees")
    public ResponseEntity<?> createMembershipFees(@PathVariable Long id, @RequestBody List<CreateMembershipFeeRequest> requests) {
        try {
            List<MembershipFeeResponse> fees = collectivityService.createMembershipFees(id, requests);
            return ResponseEntity.status(HttpStatus.OK).body(fees);
        } catch (RuntimeException e) {
            if (e.getMessage().contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/collectivities/{id}/transactions")
    public ResponseEntity<?> getTransactions(@PathVariable Long id,
                                             @RequestParam LocalDate from,
                                             @RequestParam LocalDate to) {
        try {
            List<CollectivityTransactionResponse> transactions = collectivityService.getTransactions(id, from, to);
            return ResponseEntity.ok(transactions);
        } catch (RuntimeException e) {
            if (e.getMessage().contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

}