package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Membership {
    private Long id;
    private Long memberId;
    private Long collectivityId;
    private LocalDate membershipDate;
    private String rank;
    private Boolean isActive;
    private Boolean admissionFeePaid;
    private Boolean membershipDuesPaid;

    public Membership() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getMemberId() { return memberId; }
    public void setMemberId(Long memberId) { this.memberId = memberId; }
    public Long getCollectivityId() { return collectivityId; }
    public void setCollectivityId(Long collectivityId) { this.collectivityId = collectivityId; }
    public LocalDate getMembershipDate() { return membershipDate; }
    public void setMembershipDate(LocalDate membershipDate) { this.membershipDate = membershipDate; }
    public String getRank() { return rank; }
    public void setRank(String rank) { this.rank = rank; }
    public Boolean getIsActive() { return isActive; }
    public void setIsActive(Boolean isActive) { this.isActive = isActive; }
    public Boolean getAdmissionFeePaid() { return admissionFeePaid; }
    public void setAdmissionFeePaid(Boolean admissionFeePaid) { this.admissionFeePaid = admissionFeePaid; }
    public Boolean getMembershipDuesPaid() { return membershipDuesPaid; }
    public void setMembershipDuesPaid(Boolean membershipDuesPaid) { this.membershipDuesPaid = membershipDuesPaid; }
}