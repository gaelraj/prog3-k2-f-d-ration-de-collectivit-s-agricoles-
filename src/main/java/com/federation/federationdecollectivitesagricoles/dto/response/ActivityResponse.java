package com.federation.federationdecollectivitesagricoles.dto.response;

import java.time.LocalDate;
import java.util.List;

public class ActivityResponse {
    private String id;
    private String label;
    private String activityType;
    private List<String> memberOccupationConcerned;
    private LocalDate executiveDate;
    private String recurrenceDayOfMonth;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getLabel() { return label; }
    public void setLabel(String label) { this.label = label; }

    public String getActivityType() { return activityType; }
    public void setActivityType(String activityType) { this.activityType = activityType; }

    public List<String> getMemberOccupationConcerned() { return memberOccupationConcerned; }
    public void setMemberOccupationConcerned(List<String> memberOccupationConcerned) { this.memberOccupationConcerned = memberOccupationConcerned; }

    public LocalDate getExecutiveDate() { return executiveDate; }
    public void setExecutiveDate(LocalDate executiveDate) { this.executiveDate = executiveDate; }

    public String getRecurrenceDayOfMonth() { return recurrenceDayOfMonth; }
    public void setRecurrenceDayOfMonth(String recurrenceDayOfMonth) { this.recurrenceDayOfMonth = recurrenceDayOfMonth; }
}