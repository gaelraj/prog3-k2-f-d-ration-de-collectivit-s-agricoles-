package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Membership {

    private Integer id;
    private Integer memberId;
    private Integer collectivityId;
    private LocalDate membershipDate;
    private Integer sponsor1Id;
    private Integer sponsor2Id;
    private Boolean isActive;
    private Boolean admissionFeePaid;
    private Boolean annualContributionPaid;
    private String status;

    public Membership() {
    }

    public Membership(Integer id, Integer memberId, Integer collectivityId, LocalDate membershipDate, Integer sponsor1Id, Integer sponsor2Id, Boolean isActive, Boolean admissionFeePaid, Boolean annualContributionPaid, String status) {
        this.id = id;
        this.memberId = memberId;
        this.collectivityId = collectivityId;
        this.membershipDate = membershipDate;
        this.sponsor1Id = sponsor1Id;
        this.sponsor2Id = sponsor2Id;
        this.isActive = isActive;
        this.admissionFeePaid = admissionFeePaid;
        this.annualContributionPaid = annualContributionPaid;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getCollectivityId() {
        return collectivityId;
    }

    public void setCollectivityId(Integer collectivityId) {
        this.collectivityId = collectivityId;
    }

    public LocalDate getMembershipDate() {
        return membershipDate;
    }

    public void setMembershipDate(LocalDate membershipDate) {
        this.membershipDate = membershipDate;
    }

    public Integer getSponsor1Id() {
        return sponsor1Id;
    }

    public void setSponsor1Id(Integer sponsor1Id) {
        this.sponsor1Id = sponsor1Id;
    }

    public Integer getSponsor2Id() {
        return sponsor2Id;
    }

    public void setSponsor2Id(Integer sponsor2Id) {
        this.sponsor2Id = sponsor2Id;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean active) {
        isActive = active;
    }

    public Boolean getAdmissionFeePaid() {
        return admissionFeePaid;
    }

    public void setAdmissionFeePaid(Boolean admissionFeePaid) {
        this.admissionFeePaid = admissionFeePaid;
    }

    public Boolean getAnnualContributionPaid() {
        return annualContributionPaid;
    }

    public void setAnnualContributionPaid(Boolean annualContributionPaid) {
        this.annualContributionPaid = annualContributionPaid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}