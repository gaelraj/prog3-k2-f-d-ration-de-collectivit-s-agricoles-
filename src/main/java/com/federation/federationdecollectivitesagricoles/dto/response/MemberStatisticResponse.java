package com.federation.federationdecollectivitesagricoles.dto.response;

public class MemberStatisticResponse {
    private String memberId;
    private String firstName;
    private String lastName;
    private Double totalPaid;
    private Double unpaidAmount;

    public String getMemberId() { return memberId; }
    public void setMemberId(String memberId) { this.memberId = memberId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public Double getTotalPaid() { return totalPaid; }
    public void setTotalPaid(Double totalPaid) { this.totalPaid = totalPaid; }

    public Double getUnpaidAmount() { return unpaidAmount; }
    public void setUnpaidAmount(Double unpaidAmount) { this.unpaidAmount = unpaidAmount; }
}