package com.federation.federationdecollectivitesagricoles.entity;

import java.util.ArrayList;
import java.util.List;

public class CreateCollectivityRequest {

    private String location;
    private List<String> members = new ArrayList<>();
    private Boolean federationApproval;
    private CreateCollectivityStructure structure;

    public CreateCollectivityRequest() {
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<String> getMembers() {
        return members;
    }

    public void setMembers(List<String> members) {
        this.members = members;
    }

    public Boolean getFederationApproval() {
        return federationApproval;
    }

    public void setFederationApproval(Boolean federationApproval) {
        this.federationApproval = federationApproval;
    }

    public CreateCollectivityStructure getStructure() {
        return structure;
    }

    public void setStructure(CreateCollectivityStructure structure) {
        this.structure = structure;
    }
}