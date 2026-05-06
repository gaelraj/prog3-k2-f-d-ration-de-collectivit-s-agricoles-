package com.federation.federationdecollectivitesagricoles.dto.response;

public class MemberStatisticResponse {

    private MemberDescriptionResponse memberDescription;
    private Double earnedAmount;
    private Double unpaidAmount;

    public MemberDescriptionResponse getMemberDescription() {
        return memberDescription;
    }

    public void setMemberDescription(MemberDescriptionResponse memberDescription) {
        this.memberDescription = memberDescription;
    }

    public Double getEarnedAmount() {
        return earnedAmount;
    }

    public void setEarnedAmount(Double earnedAmount) {
        this.earnedAmount = earnedAmount;
    }

    public Double getUnpaidAmount() {
        return unpaidAmount;
    }

    public void setUnpaidAmount(Double unpaidAmount) {
        this.unpaidAmount = unpaidAmount;
    }
}