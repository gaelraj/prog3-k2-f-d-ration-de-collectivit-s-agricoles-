package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityStatisticResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberStatisticResponse;
import com.federation.federationdecollectivitesagricoles.entity.Collectivity;
import com.federation.federationdecollectivitesagricoles.repository.CollectivityRepository;
import com.federation.federationdecollectivitesagricoles.repository.StatisticRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class StatisticService {

    private final StatisticRepository statisticRepository;
    private final CollectivityRepository collectivityRepository;

    public StatisticService(StatisticRepository statisticRepository,
                            CollectivityRepository collectivityRepository) {
        this.statisticRepository = statisticRepository;
        this.collectivityRepository = collectivityRepository;
    }

    public List<MemberStatisticResponse> getLocalStatistics(String collectivityId, LocalDate from, LocalDate to) {
        Collectivity collectivity = collectivityRepository.findByCode(collectivityId);

        if (collectivity == null) {
            try {
                Long idLong = Long.parseLong(collectivityId);
                collectivity = collectivityRepository.findById(idLong);
            } catch (NumberFormatException e) {
                throw new RuntimeException("Collectivity not found");
            }
        }

        if (collectivity == null) {
            throw new RuntimeException("Collectivity not found");
        }

        return statisticRepository.findLocalStatistics(collectivity.getId(), from, to);
    }

    public List<CollectivityStatisticResponse> getOverallStatistics(LocalDate from, LocalDate to) {
        return statisticRepository.findOverallStatistics(from, to);
    }
}