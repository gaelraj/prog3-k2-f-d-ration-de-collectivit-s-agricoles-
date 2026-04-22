package com.federation.federationdecollectivitesagricoles.dto;

import java.util.List;

public class CollectivityResponse {
    private String id;
    private String location;
    private StructureInfo structure;
    private List<MemberInfo> members;

    public CollectivityResponse() {}

    public CollectivityResponse(String id, String location, StructureInfo structure, List<MemberInfo> members) {
        this.id = id;
        this.location = location;
        this.structure = structure;
        this.members = members;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public StructureInfo getStructure() { return structure; }
    public void setStructure(StructureInfo structure) { this.structure = structure; }
    public List<MemberInfo> getMembers() { return members; }
    public void setMembers(List<MemberInfo> members) { this.members = members; }
}