package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Collectivity {
    private Long id;
    private String code;
    private String number;
    private String name;
    private String location;
    private LocalDate creationDate;
    private Boolean federationApproval;
    private Long annualContributionAmount;

    public Collectivity() {}

    public Collectivity(Long id, String location, LocalDate creationDate, Boolean federationApproval, Long annualContributionAmount) {
        this.id = id;
        this.location = location;
        this.creationDate = creationDate;
        this.federationApproval = federationApproval;
        this.annualContributionAmount = annualContributionAmount;
    }

    public Long getId() { return id; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code;}
    public void setId(Long id) { this.id = id; }
    public String getNumber() { return number; }
    public void setNumber(String number) { this.number = number; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public LocalDate getCreationDate() { return creationDate; }
    public void setCreationDate(LocalDate creationDate) { this.creationDate = creationDate; }
    public Boolean getFederationApproval() { return federationApproval; }
    public void setFederationApproval(Boolean federationApproval) { this.federationApproval = federationApproval; }
    public Long getAnnualContributionAmount() { return annualContributionAmount; }
    public void setAnnualContributionAmount(Long annualContributionAmount) { this.annualContributionAmount = annualContributionAmount; }
}