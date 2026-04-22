
package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Mandate {
    private Long id;
    private String number;  // Nouveau
    private String name;
    private Long membershipId;
    private Long positionId;
    private LocalDate startDate;
    private LocalDate endDate;
    private Integer mandateCount;

    public Mandate() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNumber() { return number; }
    public void setNumber(String number) { this.number = number; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Long getMembershipId() { return membershipId; }
    public void setMembershipId(Long membershipId) { this.membershipId = membershipId; }
    public Long getPositionId() { return positionId; }
    public void setPositionId(Long positionId) { this.positionId = positionId; }
    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }
    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }
    public Integer getMandateCount() { return mandateCount; }
    public void setMandateCount(Integer mandateCount) { this.mandateCount = mandateCount; }
}