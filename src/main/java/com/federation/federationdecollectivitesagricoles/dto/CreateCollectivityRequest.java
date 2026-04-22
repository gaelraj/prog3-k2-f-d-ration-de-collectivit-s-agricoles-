package com.federation.federationdecollectivitesagricoles.dto;

import java.util.List;

public class CreateCollectivityRequest {
    private String location;
    private List<String> members;
    private Boolean federationApproval;
    private CreateCollectivityStructure structure;

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public List<String> getMembers() { return members; }
    public void setMembers(List<String> members) { this.members = members; }
    public Boolean getFederationApproval() { return federationApproval; }
    public void setFederationApproval(Boolean federationApproval) { this.federationApproval = federationApproval; }
    public CreateCollectivityStructure getStructure() { return structure; }
    public void setStructure(CreateCollectivityStructure structure) { this.structure = structure; }

    public static class CreateCollectivityStructure {
        private String president;
        private String vicePresident;
        private String treasurer;
        private String secretary;

        public String getPresident() { return president; }
        public void setPresident(String president) { this.president = president; }
        public String getVicePresident() { return vicePresident; }
        public void setVicePresident(String vicePresident) { this.vicePresident = vicePresident; }
        public String getTreasurer() { return treasurer; }
        public void setTreasurer(String treasurer) { this.treasurer = treasurer; }
        public String getSecretary() { return secretary; }
        public void setSecretary(String secretary) { this.secretary = secretary; }
    }
}