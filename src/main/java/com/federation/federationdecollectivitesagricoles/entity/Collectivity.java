package com.federation.federationdecollectivitesagricoles.entity;

import java.time.LocalDate;

public class Collectivity {

    private Integer id;
    private String number;
    private String name;
    private String city;
    private String agriculturalSpecialty;
    private LocalDate creationDate;
    private Boolean authorizationStatus;

    public Collectivity() {
    }

    public Collectivity(Integer id, String number, String name, String city, String agriculturalSpecialty, LocalDate creationDate, Boolean authorizationStatus) {
        this.id = id;
        this.number = number;
        this.name = name;
        this.city = city;
        this.agriculturalSpecialty = agriculturalSpecialty;
        this.creationDate = creationDate;
        this.authorizationStatus = authorizationStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAgriculturalSpecialty() {
        return agriculturalSpecialty;
    }

    public void setAgriculturalSpecialty(String agriculturalSpecialty) {
        this.agriculturalSpecialty = agriculturalSpecialty;
    }

    public LocalDate getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(LocalDate creationDate) {
        this.creationDate = creationDate;
    }

    public Boolean getAuthorizationStatus() {
        return authorizationStatus;
    }

    public void setAuthorizationStatus(Boolean authorizationStatus) {
        this.authorizationStatus = authorizationStatus;
    }
}