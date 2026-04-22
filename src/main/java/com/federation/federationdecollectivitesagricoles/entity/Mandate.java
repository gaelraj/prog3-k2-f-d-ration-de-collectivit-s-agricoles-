package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Mandate {

    private Integer id;
    private Integer membershipId;
    private Integer positionId;
    private LocalDate startDate;
    private LocalDate endDate;
    private Integer mandateCount;

    public Mandate() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMembershipId() {
        return membershipId;
    }

    public void setMembershipId(Integer membershipId) {
        this.membershipId = membershipId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public Integer getMandateCount() {
        return mandateCount;
    }

    public void setMandateCount(Integer mandateCount) {
        this.mandateCount = mandateCount;
    }
}