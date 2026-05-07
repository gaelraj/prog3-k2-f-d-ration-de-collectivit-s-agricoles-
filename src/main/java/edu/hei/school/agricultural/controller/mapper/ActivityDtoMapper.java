package edu.hei.school.agricultural.controller.mapper;

import edu.hei.school.agricultural.controller.dto.CreateCollectivityActivity;
import edu.hei.school.agricultural.entity.ActivityType;
import edu.hei.school.agricultural.entity.CollectivityActivity;
import edu.hei.school.agricultural.entity.MemberOccupation;
import edu.hei.school.agricultural.entity.MonthlyRecurrenceRule;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ActivityDtoMapper {

    public CollectivityActivity mapToEntity(String collectivityId, CreateCollectivityActivity dto) {
        return CollectivityActivity.builder()
                .collectivityId(collectivityId)
                .label(dto.getLabel())
                .activityType(dto.getActivityType() == null ? null : ActivityType.valueOf(dto.getActivityType().name()))
                .memberOccupationConcerned(
                        dto.getMemberOccupationConcerned() == null
                                ? List.of()
                                : dto.getMemberOccupationConcerned()
                                .stream()
                                .map(occupation -> MemberOccupation.valueOf(occupation.name()))
                                .toList()
                )
                .recurrenceRule(dto.getRecurrenceRule() == null ? null :
                        MonthlyRecurrenceRule.builder()
                                .weekOrdinal(dto.getRecurrenceRule().getWeekOrdinal())
                                .dayOfWeek(dto.getRecurrenceRule().getDayOfWeek())
                                .build()
                )
                .executiveDate(dto.getExecutiveDate())
                .build();
    }

    public edu.hei.school.agricultural.controller.dto.CollectivityActivity mapToDto(
            CollectivityActivity activity
    ) {
        return edu.hei.school.agricultural.controller.dto.CollectivityActivity.builder()
                .id(activity.getId())
                .label(activity.getLabel())
                .activityType(activity.getActivityType() == null ? null :
                        edu.hei.school.agricultural.controller.dto.ActivityType.valueOf(activity.getActivityType().name())
                )
                .memberOccupationConcerned(
                        activity.getMemberOccupationConcerned() == null
                                ? List.of()
                                : activity.getMemberOccupationConcerned()
                                .stream()
                                .map(occupation -> edu.hei.school.agricultural.controller.dto.MemberOccupation.valueOf(occupation.name()))
                                .toList()
                )
                .recurrenceRule(activity.getRecurrenceRule() == null ? null :
                        edu.hei.school.agricultural.controller.dto.MonthlyRecurrenceRule.builder()
                                .weekOrdinal(activity.getRecurrenceRule().getWeekOrdinal())
                                .dayOfWeek(activity.getRecurrenceRule().getDayOfWeek())
                                .build()
                )
                .executiveDate(activity.getExecutiveDate())
                .build();
    }
}