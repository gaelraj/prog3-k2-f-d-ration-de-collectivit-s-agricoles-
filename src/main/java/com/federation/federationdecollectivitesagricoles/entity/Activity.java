package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Activity {
    private String id;
    private Long collectivityId;
    private String label;
    private String type;
    private String occupationConcerned;
    private LocalDate executiveDate;
    private String recurrenceDayOfMonth;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Long getCollectivityId() { return collectivityId; }
    public void setCollectivityId(Long collectivityId) { this.collectivityId = collectivityId; }

    public String getLabel() { return label; }
    public void setLabel(String label) { this.label = label; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getOccupationConcerned() { return occupationConcerned; }
    public void setOccupationConcerned(String occupationConcerned) { this.occupationConcerned = occupationConcerned; }

    public LocalDate getExecutiveDate() { return executiveDate; }
    public void setExecutiveDate(LocalDate executiveDate) { this.executiveDate = executiveDate; }

    public String getRecurrenceDayOfMonth() { return recurrenceDayOfMonth; }
    public void setRecurrenceDayOfMonth(String recurrenceDayOfMonth) { this.recurrenceDayOfMonth = recurrenceDayOfMonth; }
}