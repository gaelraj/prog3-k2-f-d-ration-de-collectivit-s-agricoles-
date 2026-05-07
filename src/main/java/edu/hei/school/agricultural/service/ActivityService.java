package edu.hei.school.agricultural.service;

import edu.hei.school.agricultural.entity.CollectivityActivity;
import edu.hei.school.agricultural.entity.MonthlyRecurrenceRule;
import edu.hei.school.agricultural.exception.BadRequestException;
import edu.hei.school.agricultural.exception.NotFoundException;
import edu.hei.school.agricultural.repository.ActivityRepository;
import edu.hei.school.agricultural.repository.CollectivityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

import static java.util.UUID.randomUUID;

@Service
@RequiredArgsConstructor
public class ActivityService {

    private final ActivityRepository activityRepository;
    private final CollectivityRepository collectivityRepository;

    public List<CollectivityActivity> createActivities(
            String collectivityId,
            List<CollectivityActivity> activities
    ) {
        collectivityRepository.findById(collectivityId)
                .orElseThrow(() -> new NotFoundException("Collectivity.id=" + collectivityId + " not found"));

        for (CollectivityActivity activity : activities) {
            validateActivity(activity);

            activity.setId(randomUUID().toString());
            activity.setCollectivityId(collectivityId);
        }

        return activityRepository.saveAll(activities);
    }

    public List<CollectivityActivity> getActivities(String collectivityId) {
        collectivityRepository.findById(collectivityId)
                .orElseThrow(() -> new NotFoundException("Collectivity.id=" + collectivityId + " not found"));

        return activityRepository.findAllByCollectivityId(collectivityId);
    }

    private void validateActivity(CollectivityActivity activity) {
        if (activity == null) {
            throw new BadRequestException("Activity payload is required");
        }

        if (activity.getLabel() == null || activity.getLabel().isBlank()) {
            throw new BadRequestException("Activity label is required");
        }

        if (activity.getActivityType() == null) {
            throw new BadRequestException("Activity type is required");
        }

        boolean hasExecutiveDate = activity.getExecutiveDate() != null;
        boolean hasRecurrenceRule = activity.getRecurrenceRule() != null;

        if (hasExecutiveDate && hasRecurrenceRule) {
            throw new BadRequestException("Either executiveDate or recurrenceRule must be provided, not both");
        }

        if (!hasExecutiveDate && !hasRecurrenceRule) {
            throw new BadRequestException("Either executiveDate or recurrenceRule must be provided");
        }

        if (hasRecurrenceRule) {
            validateRecurrenceRule(activity.getRecurrenceRule());
        }
    }

    private void validateRecurrenceRule(MonthlyRecurrenceRule recurrenceRule) {
        if (recurrenceRule.getWeekOrdinal() == null) {
            throw new BadRequestException("Recurrence weekOrdinal is required");
        }

        if (recurrenceRule.getWeekOrdinal() < 1 || recurrenceRule.getWeekOrdinal() > 5) {
            throw new BadRequestException("Recurrence weekOrdinal must be between 1 and 5");
        }

        if (recurrenceRule.getDayOfWeek() == null || recurrenceRule.getDayOfWeek().isBlank()) {
            throw new BadRequestException("Recurrence dayOfWeek is required");
        }

        Set<String> allowedDays = Set.of("MO", "TU", "WE", "TH", "FR", "SA", "SU");

        if (!allowedDays.contains(recurrenceRule.getDayOfWeek())) {
            throw new BadRequestException("Recurrence dayOfWeek must be MO, TU, WE, TH, FR, SA or SU");
        }
    }
}