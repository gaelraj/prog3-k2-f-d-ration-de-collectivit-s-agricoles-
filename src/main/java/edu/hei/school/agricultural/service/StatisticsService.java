package edu.hei.school.agricultural.service;

import edu.hei.school.agricultural.entity.CollectivityLocalStatistics;
import edu.hei.school.agricultural.entity.CollectivityOverallStatistics;
import edu.hei.school.agricultural.exception.BadRequestException;
import edu.hei.school.agricultural.exception.NotFoundException;
import edu.hei.school.agricultural.repository.CollectivityRepository;
import edu.hei.school.agricultural.repository.StatisticsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class StatisticsService {

    private final StatisticsRepository statisticsRepository;
    private final CollectivityRepository collectivityRepository;

    public List<CollectivityLocalStatistics> getLocalStatistics(
            String collectivityId,
            LocalDate from,
            LocalDate to
    ) {
        verifyPeriod(from, to);

        collectivityRepository.findById(collectivityId)
                .orElseThrow(() -> new NotFoundException("Collectivity.id=" + collectivityId + " not found"));

        return statisticsRepository.findLocalStatistics(collectivityId, from, to);
    }

    public List<CollectivityOverallStatistics> getOverallStatistics(
            LocalDate from,
            LocalDate to
    ) {
        verifyPeriod(from, to);

        return statisticsRepository.findOverallStatistics(from, to);
    }

    private void verifyPeriod(LocalDate from, LocalDate to) {
        if (from == null) {
            throw new BadRequestException("Query parameter from is required");
        }

        if (to == null) {
            throw new BadRequestException("Query parameter to is required");
        }

        if (from.isAfter(to)) {
            throw new BadRequestException("Query parameter from must be before or equal to to");
        }
    }
}