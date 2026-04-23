package com.federation.federationdecollectivitesagricoles.dto;

import java.util.List;

public class CreateMemberRequest {
    private String firstName;
    private String lastName;
    private String birthDate;
    private String gender;
    private String address;
    private String profession;
    private String phoneNumber;
    private String email;
    private String collectivityIdentifier;
    private List<String> referees;
    private Boolean registrationFeePaid;
    private Boolean membershipDuesPaid;

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getBirthDate() { return birthDate; }
    public void setBirthDate(String birthDate) { this.birthDate = birthDate; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getProfession() { return profession; }
    public void setProfession(String profession) { this.profession = profession; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getCollectivityIdentifier() { return collectivityIdentifier; }
    public void setCollectivityIdentifier(String collectivityIdentifier) { this.collectivityIdentifier = collectivityIdentifier; }
    public List<String> getReferees() { return referees; }
    public void setReferees(List<String> referees) { this.referees = referees; }
    public Boolean getRegistrationFeePaid() { return registrationFeePaid; }
    public void setRegistrationFeePaid(Boolean registrationFeePaid) { this.registrationFeePaid = registrationFeePaid; }
    public Boolean getMembershipDuesPaid() { return membershipDuesPaid; }
    public void setMembershipDuesPaid(Boolean membershipDuesPaid) { this.membershipDuesPaid = membershipDuesPaid; }
}