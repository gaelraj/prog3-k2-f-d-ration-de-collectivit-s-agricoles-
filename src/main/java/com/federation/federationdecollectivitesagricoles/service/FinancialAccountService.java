package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.response.FinancialAccountResponse;
import com.federation.federationdecollectivitesagricoles.entity.Collectivity;
import com.federation.federationdecollectivitesagricoles.repository.CollectivityRepository;
import com.federation.federationdecollectivitesagricoles.repository.FinancialAccountRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class FinancialAccountService {

    private final FinancialAccountRepository financialAccountRepository;
    private final CollectivityRepository collectivityRepository;

    public FinancialAccountService(FinancialAccountRepository financialAccountRepository,
                                   CollectivityRepository collectivityRepository) {
        this.financialAccountRepository = financialAccountRepository;
        this.collectivityRepository = collectivityRepository;
    }

    public List<FinancialAccountResponse> getAccountsByCollectivityIdAtDate(Long collectivityId, LocalDate at) {
        Collectivity collectivity = collectivityRepository.findById(collectivityId);

        if (collectivity == null) {
            throw new RuntimeException("Collectivity not found");
        }

        return financialAccountRepository.findAllByCollectivityIdAtDate(collectivityId, at);
    }
}