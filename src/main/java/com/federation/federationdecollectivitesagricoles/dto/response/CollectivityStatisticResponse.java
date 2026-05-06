package com.federation.federationdecollectivitesagricoles.dto.response;

public class CollectivityStatisticResponse {
    private String collectivityId;
    private String collectivityName;
    private Double paymentUpToDatePercentage;
    private Integer newMembersCount;

    public String getCollectivityId() { return collectivityId; }
    public void setCollectivityId(String collectivityId) { this.collectivityId = collectivityId; }

    public String getCollectivityName() { return collectivityName; }
    public void setCollectivityName(String collectivityName) { this.collectivityName = collectivityName; }

    public Double getPaymentUpToDatePercentage() { return paymentUpToDatePercentage; }
    public void setPaymentUpToDatePercentage(Double paymentUpToDatePercentage) { this.paymentUpToDatePercentage = paymentUpToDatePercentage; }

    public Integer getNewMembersCount() { return newMembersCount; }
    public void setNewMembersCount(Integer newMembersCount) { this.newMembersCount = newMembersCount; }
}