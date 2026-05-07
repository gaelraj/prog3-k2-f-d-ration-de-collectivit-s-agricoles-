package edu.hei.school.agricultural.controller.mapper;

import edu.hei.school.agricultural.controller.dto.CollectivityLocalStatistics;
import edu.hei.school.agricultural.controller.dto.CollectivityOverallStatistics;
import org.springframework.stereotype.Component;

@Component
public class StatisticsDtoMapper {

    public CollectivityLocalStatistics mapToDto(
            edu.hei.school.agricultural.entity.CollectivityLocalStatistics statistics
    ) {
        return CollectivityLocalStatistics.builder()
                .memberDescription(
                        edu.hei.school.agricultural.controller.dto.MemberDescription.builder()
                                .id(statistics.getMemberDescription().getId())
                                .firstName(statistics.getMemberDescription().getFirstName())
                                .lastName(statistics.getMemberDescription().getLastName())
                                .email(statistics.getMemberDescription().getEmail())
                                .occupation(statistics.getMemberDescription().getOccupation())
                                .build()
                )
                .earnedAmount(statistics.getEarnedAmount())
                .unpaidAmount(statistics.getUnpaidAmount())
                .build();
    }

    public CollectivityOverallStatistics mapToDto(
            edu.hei.school.agricultural.entity.CollectivityOverallStatistics statistics
    ) {
        return CollectivityOverallStatistics.builder()
                .collectivityInformation(
                        edu.hei.school.agricultural.controller.dto.CollectivityInformation.builder()
                                .name(statistics.getCollectivityName())
                                .number(statistics.getCollectivityNumber())
                                .build()
                )
                .newMembersNumber(statistics.getNewMembersNumber())
                .overallMemberCurrentDuePercentage(statistics.getOverallMemberCurrentDuePercentage())
                .build();
    }
}