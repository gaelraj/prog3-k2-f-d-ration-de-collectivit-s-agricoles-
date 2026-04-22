package com.federation.federationdecollectivitesagricoles.dto;

public class StructureInfo {
    private MemberInfo president;
    private MemberInfo vicePresident;
    private MemberInfo treasurer;
    private MemberInfo secretary;

    public MemberInfo getPresident() { return president; }
    public void setPresident(MemberInfo president) { this.president = president; }
    public MemberInfo getVicePresident() { return vicePresident; }
    public void setVicePresident(MemberInfo vicePresident) { this.vicePresident = vicePresident; }
    public MemberInfo getTreasurer() { return treasurer; }
    public void setTreasurer(MemberInfo treasurer) { this.treasurer = treasurer; }
    public MemberInfo getSecretary() { return secretary; }
    public void setSecretary(MemberInfo secretary) { this.secretary = secretary; }
}