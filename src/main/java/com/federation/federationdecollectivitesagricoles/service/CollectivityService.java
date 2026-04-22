package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.*;
import com.federation.federationdecollectivitesagricoles.entity.*;
import com.federation.federationdecollectivitesagricoles.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CollectivityService {

    private final CollectivityRepository collectivityRepository;
    private final MemberRepository memberRepository;
    private final MembershipRepository membershipRepository;
    private final MandateRepository mandateRepository;

    public CollectivityService(CollectivityRepository collectivityRepository,
                               MemberRepository memberRepository,
                               MembershipRepository membershipRepository,
                               MandateRepository mandateRepository) {
        this.collectivityRepository = collectivityRepository;
        this.memberRepository = memberRepository;
        this.membershipRepository = membershipRepository;
        this.mandateRepository = mandateRepository;
    }

    @Transactional
    public CollectivityResponse createCollectivity(CreateCollectivityRequest request) {
        if (request.getMembers() == null || request.getMembers().size() < 10) {
            throw new RuntimeException("Collectivity must have at least 10 members");
        }

        List<Long> memberIds = request.getMembers().stream()
                .map(Long::parseLong)
                .collect(Collectors.toList());

        List<Member> members = memberRepository.findAllByIds(memberIds);
        if (members.size() != memberIds.size()) {
            throw new RuntimeException("Some members do not exist");
        }

        if (request.getFederationApproval() == null || !request.getFederationApproval()) {
            throw new RuntimeException("Federation approval is required");
        }

        Collectivity collectivity = new Collectivity();
        collectivity.setLocation(request.getLocation());
        collectivity.setCreationDate(LocalDate.now());
        collectivity.setFederationApproval(true);
        collectivity.setAnnualContributionAmount(0L);
        collectivity = collectivityRepository.save(collectivity);

        for (Long memberId : memberIds) {
            Membership membership = new Membership();
            membership.setMemberId(memberId);
            membership.setCollectivityId(collectivity.getId());
            membership.setMembershipDate(LocalDate.now());
            membership.setRank("JUNIOR");
            membership.setIsActive(true);
            membership.setAdmissionFeePaid(false);
            membership.setMembershipDuesPaid(false);
            membershipRepository.save(membership);
        }

        CreateCollectivityRequest.CreateCollectivityStructure structure = request.getStructure();

        createMandate(Long.parseLong(structure.getPresident()), collectivity.getId(), "PRESIDENT");
        createMandate(Long.parseLong(structure.getVicePresident()), collectivity.getId(), "VICE_PRESIDENT");
        createMandate(Long.parseLong(structure.getTreasurer()), collectivity.getId(), "TREASURER");
        createMandate(Long.parseLong(structure.getSecretary()), collectivity.getId(), "SECRETARY");

        return buildResponse(collectivity, members, structure);
    }

    private void createMandate(Long memberId, Long collectivityId, String positionName) {
        Long membershipId = membershipRepository.getMembershipIdByMemberAndCollectivity(memberId, collectivityId);
        if (membershipId == null) {
            throw new RuntimeException("Member " + memberId + " is not a member of collectivity " + collectivityId);
        }

        Long positionId = mandateRepository.getPositionIdByName(positionName);

        Mandate mandate = new Mandate();
        mandate.setMembershipId(membershipId);
        mandate.setPositionId(positionId);
        mandate.setStartDate(LocalDate.now());
        mandate.setEndDate(LocalDate.now().plusYears(1));
        mandate.setMandateCount(1);
        mandateRepository.save(mandate);
    }

    private CollectivityResponse buildResponse(Collectivity collectivity, List<Member> members,
                                               CreateCollectivityRequest.CreateCollectivityStructure structure) {
        CollectivityResponse response = new CollectivityResponse();
        response.setId(String.valueOf(collectivity.getId()));
        response.setLocation(collectivity.getLocation());

        StructureInfo structureInfo = new StructureInfo();
        structureInfo.setPresident(findMemberInfoById(members, Long.parseLong(structure.getPresident())));
        structureInfo.setVicePresident(findMemberInfoById(members, Long.parseLong(structure.getVicePresident())));
        structureInfo.setTreasurer(findMemberInfoById(members, Long.parseLong(structure.getTreasurer())));
        structureInfo.setSecretary(findMemberInfoById(members, Long.parseLong(structure.getSecretary())));
        response.setStructure(structureInfo);

        List<MemberInfo> memberInfos = members.stream()
                .map(this::convertToMemberInfo)
                .collect(Collectors.toList());
        response.setMembers(memberInfos);

        return response;
    }

    private MemberInfo findMemberInfoById(List<Member> members, Long id) {
        Member member = members.stream()
                .filter(m -> m.getId().equals(id))
                .findFirst()
                .orElse(null);
        return member != null ? convertToMemberInfo(member) : null;
    }

    private MemberInfo convertToMemberInfo(Member member) {
        if (member == null) return null;
        MemberInfo info = new MemberInfo();
        info.setId(String.valueOf(member.getId()));
        info.setFirstName(member.getFirstName());
        info.setLastName(member.getLastName());
        info.setBirthDate(member.getBirthDate().toString());
        info.setGender(member.getGender());
        info.setAddress(member.getAddress());
        info.setProfession(member.getProfession());
        info.setPhoneNumber(Long.parseLong(member.getPhoneNumber()));
        info.setEmail(member.getEmail());
        info.setOccupation(member.getOccupation());
        return info;
    }
}