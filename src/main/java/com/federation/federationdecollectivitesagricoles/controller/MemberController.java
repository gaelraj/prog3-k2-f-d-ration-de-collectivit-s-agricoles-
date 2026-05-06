package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.request.CreateMemberPaymentRequest;
import com.federation.federationdecollectivitesagricoles.dto.request.CreateMemberRequest;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberPaymentResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberResponse;
import com.federation.federationdecollectivitesagricoles.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @PostMapping("/members")
    public ResponseEntity<?> createMember(@RequestBody CreateMemberRequest request) {
        try {
            MemberResponse response = memberService.createMember(request);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/members/{id}/payments")
    public ResponseEntity<?> createPayments(@PathVariable Long id, @RequestBody List<CreateMemberPaymentRequest> requests) {
        try {
            List<MemberPaymentResponse> payments = memberService.createPayments(id, requests);
            return ResponseEntity.status(HttpStatus.CREATED).body(payments);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}