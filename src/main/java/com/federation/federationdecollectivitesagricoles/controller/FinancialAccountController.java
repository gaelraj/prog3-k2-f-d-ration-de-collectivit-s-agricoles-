package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.FinancialAccountResponse;
import com.federation.federationdecollectivitesagricoles.service.FinancialAccountService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
public class FinancialAccountController {

    private final FinancialAccountService financialAccountService;

    public FinancialAccountController(FinancialAccountService financialAccountService) {
        this.financialAccountService = financialAccountService;
    }

    @GetMapping("/collectivities/{id}/financialAccounts")
    public ResponseEntity<?> getFinancialAccounts(@PathVariable Long id,
                                                  @RequestParam("at") String at) {
        try {
            LocalDate date = LocalDate.parse(at);
            List<FinancialAccountResponse> response =
                    financialAccountService.getAccountsByCollectivityIdAtDate(id, date);

            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}