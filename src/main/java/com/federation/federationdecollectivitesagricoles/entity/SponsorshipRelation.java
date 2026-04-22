package com.federation.federationdecollectivitesagricoles.entity;

public class SponsorshipRelation {

    private Integer id;
    private Integer membershipId;
    private Integer sponsorId;
    private String relationshipNature;

    public SponsorshipRelation() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMembershipId() {
        return membershipId;
    }

    public void setMembershipId(Integer membershipId) {
        this.membershipId = membershipId;
    }

    public Integer getSponsorId() {
        return sponsorId;
    }

    public void setSponsorId(Integer sponsorId) {
        this.sponsorId = sponsorId;
    }

    public String getRelationshipNature() {
        return relationshipNature;
    }

    public void setRelationshipNature(String relationshipNature) {
        this.relationshipNature = relationshipNature;
    }
}