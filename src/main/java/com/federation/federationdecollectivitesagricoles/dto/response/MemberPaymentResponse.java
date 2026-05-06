package com.federation.federationdecollectivitesagricoles.dto.response;

import java.time.LocalDate;

public class MemberPaymentResponse {
    private String id;
    private Integer amount;
    private String paymentMode;
    private FinancialAccountResponse accountCredited;
    private LocalDate creationDate;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public Integer getAmount() { return amount; }
    public void setAmount(Integer amount) { this.amount = amount; }
    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }
    public FinancialAccountResponse getAccountCredited() { return accountCredited; }
    public void setAccountCredited(FinancialAccountResponse accountCredited) { this.accountCredited = accountCredited; }
    public LocalDate getCreationDate() { return creationDate; }
    public void setCreationDate(LocalDate creationDate) { this.creationDate = creationDate; }
}