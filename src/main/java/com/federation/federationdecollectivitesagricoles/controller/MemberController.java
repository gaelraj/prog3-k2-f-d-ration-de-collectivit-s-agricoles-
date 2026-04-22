package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.CreateMemberRequest;
import com.federation.federationdecollectivitesagricoles.dto.MemberResponse;
import com.federation.federationdecollectivitesagricoles.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
}