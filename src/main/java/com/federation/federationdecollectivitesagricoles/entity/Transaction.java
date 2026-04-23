package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Transaction {
    private Long id;
    private Long collectivityId;
    private Long memberId;
    private Double amount;
    private String paymentMode;
    private LocalDate creationDate;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCollectivityId() { return collectivityId; }
    public void setCollectivityId(Long collectivityId) { this.collectivityId = collectivityId; }
    public Long getMemberId() { return memberId; }
    public void setMemberId(Long memberId) { this.memberId = memberId; }
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }
    public LocalDate getCreationDate() { return creationDate; }
    public void setCreationDate(LocalDate creationDate) { this.creationDate = creationDate; }
}