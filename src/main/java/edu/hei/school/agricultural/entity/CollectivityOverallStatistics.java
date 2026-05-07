package edu.hei.school.agricultural.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CollectivityOverallStatistics {
    private String collectivityId;
    private String collectivityName;
    private Integer collectivityNumber;
    private Integer newMembersNumber;
    private Double overallMemberCurrentDuePercentage;
}