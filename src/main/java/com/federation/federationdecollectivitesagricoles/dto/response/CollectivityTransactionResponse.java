package com.federation.federationdecollectivitesagricoles.dto.response;

import java.time.LocalDate;

public class CollectivityTransactionResponse {
    private String id;
    private LocalDate creationDate;
    private Double amount;
    private String paymentMode;
    private String memberId;
    private String memberFirstName;
    private String memberLastName;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public LocalDate getCreationDate() { return creationDate; }
    public void setCreationDate(LocalDate creationDate) { this.creationDate = creationDate; }
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }
    public String getMemberId() { return memberId; }
    public void setMemberId(String memberId) { this.memberId = memberId; }
    public String getMemberFirstName() { return memberFirstName; }
    public void setMemberFirstName(String memberFirstName) { this.memberFirstName = memberFirstName; }
    public String getMemberLastName() { return memberLastName; }
    public void setMemberLastName(String memberLastName) { this.memberLastName = memberLastName; }
}