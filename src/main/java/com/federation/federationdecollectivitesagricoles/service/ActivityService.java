package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.request.CreateActivityRequest;
import com.federation.federationdecollectivitesagricoles.dto.response.ActivityResponse;
import com.federation.federationdecollectivitesagricoles.entity.Activity;
import com.federation.federationdecollectivitesagricoles.repository.ActivityRepository;
import com.federation.federationdecollectivitesagricoles.repository.CollectivityRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ActivityService {

    private final ActivityRepository activityRepository;
    private final CollectivityRepository collectivityRepository;

    public ActivityService(ActivityRepository activityRepository, CollectivityRepository collectivityRepository) {
        this.activityRepository = activityRepository;
        this.collectivityRepository = collectivityRepository;
    }

    public List<ActivityResponse> createActivities(Long collectivityId, List<CreateActivityRequest> requests) {
        if (!collectivityRepository.existsById(collectivityId)) {
            throw new RuntimeException("Collectivity not found");
        }

        List<ActivityResponse> responses = new ArrayList<>();

        for (CreateActivityRequest request : requests) {
            Activity activity = new Activity();
            activity.setId(request.getId());
            activity.setCollectivityId(collectivityId);
            activity.setLabel(request.getLabel());
            activity.setType(request.getActivityType());

            if (request.getMemberOccupationConcerned() != null) {
                activity.setOccupationConcerned(String.join(",", request.getMemberOccupationConcerned()));
            }

            activity.setExecutiveDate(request.getExecutiveDate());
            activity.setRecurrenceDayOfMonth(request.getRecurrenceDayOfMonth());

            activityRepository.save(activity);

            ActivityResponse response = new ActivityResponse();
            response.setId(activity.getId());
            response.setLabel(activity.getLabel());
            response.setActivityType(activity.getType());

            if (activity.getOccupationConcerned() != null) {
                response.setMemberOccupationConcerned(List.of(activity.getOccupationConcerned().split(",")));
            }

            response.setExecutiveDate(activity.getExecutiveDate());
            response.setRecurrenceDayOfMonth(activity.getRecurrenceDayOfMonth());

            responses.add(response);
        }

        return responses;
    }
}