package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.*;
import com.federation.federationdecollectivitesagricoles.dto.request.CreateCollectivityRequest;
import com.federation.federationdecollectivitesagricoles.dto.request.CreateMembershipFeeRequest;
import com.federation.federationdecollectivitesagricoles.dto.request.IdentificationRequest;
import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityIdentificationResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityTransactionResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MembershipFeeResponse;
import com.federation.federationdecollectivitesagricoles.entity.*;
import com.federation.federationdecollectivitesagricoles.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CollectivityService {

    private final CollectivityRepository collectivityRepository;
    private final MemberRepository memberRepository;
    private final MembershipRepository membershipRepository;
    private final MandateRepository mandateRepository;
    private final MembershipFeeRepository membershipFeeRepository;
    private final TransactionRepository transactionRepository;
    private final StatisticRepository statisticRepository;

    public CollectivityService(CollectivityRepository collectivityRepository,
                               MemberRepository memberRepository,
                               MembershipRepository membershipRepository,
                               MandateRepository mandateRepository,
                               MembershipFeeRepository membershipFeeRepository,
                               TransactionRepository transactionRepository,
                               StatisticRepository statisticRepository) {
        this.collectivityRepository = collectivityRepository;
        this.memberRepository = memberRepository;
        this.membershipRepository = membershipRepository;
        this.mandateRepository = mandateRepository;
        this.membershipFeeRepository = membershipFeeRepository;
        this.transactionRepository = transactionRepository;
        this.statisticRepository = statisticRepository;
    }

    public List<CollectivityResponse> createCollectivities(List<CreateCollectivityRequest> requests) {
        List<CollectivityResponse> responses = new ArrayList<>();

        for (CreateCollectivityRequest request : requests) {
            CollectivityResponse response = createCollectivity(request);
            responses.add(response);
        }

        return responses;
    }

    public List<CollectivityLocalStatistics> getLocalStatistics(String collectivityId, LocalDate from, LocalDate to) {

        try {
            Long id = Long.parseLong(collectivityId);
            return statisticRepository.getLocalStatisticsById(id, from, to);
        } catch (NumberFormatException e) {

        }

        try {
            return statisticRepository.getLocalStatisticsByCode(collectivityId, from, to);
        } catch (Exception e) {
            throw new RuntimeException("Collectivity not found: " + collectivityId);
        }
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

        CreateCollectivityStructure structure = request.getStructure();

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

    private CollectivityResponse buildResponse(Collectivity collectivity, List<Member> members, CreateCollectivityStructure structure) {
        CollectivityResponse response = new CollectivityResponse();
        response.setId(String.valueOf(collectivity.getId()));
        response.setNumber(collectivity.getNumber() != null ? String.valueOf(collectivity.getNumber()) : null);
        response.setName(collectivity.getName());
        response.setLocation(collectivity.getLocation());

        StructureInfo structureInfo = new StructureInfo();
        structureInfo.setPresident(findMemberInfoById(members, Long.parseLong(structure.getPresident()), collectivity.getId()));
        structureInfo.setVicePresident(findMemberInfoById(members, Long.parseLong(structure.getVicePresident()), collectivity.getId()));
        structureInfo.setTreasurer(findMemberInfoById(members, Long.parseLong(structure.getTreasurer()), collectivity.getId()));
        structureInfo.setSecretary(findMemberInfoById(members, Long.parseLong(structure.getSecretary()), collectivity.getId()));
        response.setStructure(structureInfo);

        List<MemberInfo> memberInfos = members.stream()
                .map(m -> convertToMemberInfo(m, collectivity.getId()))
                .collect(Collectors.toList());
        response.setMembers(memberInfos);

        return response;
    }

    private MemberInfo findMemberInfoById(List<Member> members, Long id, Long collectivityId) {
        Member member = members.stream()
                .filter(m -> m.getId().equals(id))
                .findFirst()
                .orElse(null);
        return member != null ? convertToMemberInfo(member, collectivityId) : null;
    }

    private MemberInfo convertToMemberInfo(Member member, Long collectivityId) {
        if (member == null) return null;

        Membership membership = membershipRepository.findMembershipByMemberAndCollectivity(member.getId(), collectivityId);
        String occupation = membership != null ? membership.getRank() : "JUNIOR";

        MemberInfo info = new MemberInfo();
        info.setId(String.valueOf(member.getId()));
        info.setFirstName(member.getFirstName());
        info.setLastName(member.getLastName());
        info.setBirthDate(member.getBirthDate().toString());
        info.setGender(member.getGender());
        info.setAddress(member.getAddress());
        info.setProfession(member.getProfession());
        info.setPhoneNumber(member.getPhoneNumber());
        info.setEmail(member.getEmail());
        info.setOccupation(occupation);

        return info;
    }

    @Transactional
    public CollectivityIdentificationResponse updateIdentification(Long id, IdentificationRequest request) {
        Collectivity collectivity = collectivityRepository.findById(id);
        if (collectivity == null) {
            throw new RuntimeException("Collectivity not found");
        }

        if (collectivity.getNumber() != null && !collectivity.getNumber().isEmpty()) {
            throw new RuntimeException("Number cannot be changed once assigned");
        }
        if (collectivity.getName() != null && !collectivity.getName().isEmpty()) {
            throw new RuntimeException("Name cannot be changed once assigned");
        }

        if (collectivityRepository.existsByNumber(request.getNumber())) {
            throw new RuntimeException("Number already exists");
        }
        if (collectivityRepository.existsByName(request.getName())) {
            throw new RuntimeException("Name already exists");
        }

        collectivity.setNumber(request.getNumber());
        collectivity.setName(request.getName());
        collectivity = collectivityRepository.update(collectivity);

        CollectivityIdentificationResponse response = new CollectivityIdentificationResponse();
        response.setId(String.valueOf(collectivity.getId()));
        response.setNumber(collectivity.getNumber());
        response.setName(collectivity.getName());
        response.setLocation(collectivity.getLocation());
        response.setCreationDate(collectivity.getCreationDate());
        response.setAuthorizationStatus(collectivity.getFederationApproval());

        return response;
    }

    public List<MembershipFeeResponse> getMembershipFees(Long collectivityId) {
        if (!collectivityRepository.existsById(collectivityId)) {
            throw new RuntimeException("Collectivity not found");
        }

        List<MembershipFee> fees = membershipFeeRepository.findByCollectivityId(collectivityId);
        List<MembershipFeeResponse> responses = new ArrayList<>();

        for (MembershipFee fee : fees) {
            MembershipFeeResponse response = new MembershipFeeResponse();
            response.setId(String.valueOf(fee.getId()));
            response.setEligibleFrom(fee.getEligibleFrom());
            response.setFrequency(fee.getFrequency());
            response.setAmount(fee.getAmount());
            response.setLabel(fee.getLabel());
            response.setStatus(fee.getStatus());
            responses.add(response);
        }
        return responses;
    }

    public List<MembershipFeeResponse> createMembershipFees(Long collectivityId, List<CreateMembershipFeeRequest> requests) {
        if (!collectivityRepository.existsById(collectivityId)) {
            throw new RuntimeException("Collectivity not found");
        }

        List<MembershipFeeResponse> responses = new ArrayList<>();

        for (CreateMembershipFeeRequest request : requests) {
            if (request.getAmount() == null || request.getAmount() <= 0) {
                throw new RuntimeException("Amount must be greater than 0");
            }
            if (request.getFrequency() == null || request.getFrequency().isEmpty()) {
                throw new RuntimeException("Frequency is required");
            }

            MembershipFee fee = new MembershipFee();
            fee.setCollectivityId(collectivityId);
            fee.setEligibleFrom(request.getEligibleFrom());
            fee.setFrequency(request.getFrequency());
            fee.setAmount(request.getAmount());
            fee.setLabel(request.getLabel());
            fee.setStatus("ACTIVE");
            fee = membershipFeeRepository.save(fee);

            MembershipFeeResponse response = new MembershipFeeResponse();
            response.setId(String.valueOf(fee.getId()));
            response.setEligibleFrom(fee.getEligibleFrom());
            response.setFrequency(fee.getFrequency());
            response.setAmount(fee.getAmount());
            response.setLabel(fee.getLabel());
            response.setStatus(fee.getStatus());
            responses.add(response);
        }
        return responses;
    }

    public List<CollectivityTransactionResponse> getTransactions(Long collectivityId, LocalDate from, LocalDate to) {
        if (!collectivityRepository.existsById(collectivityId)) {
            throw new RuntimeException("Collectivity not found");
        }

        List<Transaction> transactions = transactionRepository.findByCollectivityIdAndDateRange(collectivityId, from, to);
        List<CollectivityTransactionResponse> responses = new ArrayList<>();

        for (Transaction t : transactions) {
            Member member = memberRepository.findById(t.getMemberId());
            CollectivityTransactionResponse response = new CollectivityTransactionResponse();
            response.setId(String.valueOf(t.getId()));
            response.setCreationDate(t.getCreationDate());
            response.setAmount(t.getAmount());
            response.setPaymentMode(t.getPaymentMode());
            if (member != null) {
                response.setMemberId(String.valueOf(member.getId()));
                response.setMemberFirstName(member.getFirstName());
                response.setMemberLastName(member.getLastName());
            }
            responses.add(response);
        }
        return responses;
    }

    public CollectivityResponse getCollectivityById(String id) {
        Collectivity collectivity = collectivityRepository.findByCode(id);

        if (collectivity == null) {
            try {
                Long idLong = Long.parseLong(id);
                collectivity = collectivityRepository.findById(idLong);
                if (collectivity == null) {
                    throw new RuntimeException("Collectivity not found");
                }
            } catch (NumberFormatException e) {
                throw new RuntimeException("Collectivity not found");
            }
        }

        List<Member> members = memberRepository.findAllByCollectivityId(collectivity.getId());
        CreateCollectivityStructure structure = getStructureFromCollectivity(collectivity.getId());

        return buildResponse(collectivity, members, structure);
    }

    private CreateCollectivityStructure getStructureFromCollectivity(Long collectivityId) {
        CreateCollectivityStructure structure = new CreateCollectivityStructure();

        Long presidentId = membershipRepository.findMemberIdByPosition(collectivityId, "PRESIDENT");
        if (presidentId != null) {
            structure.setPresident(String.valueOf(presidentId));
        }

        Long vicePresidentId = membershipRepository.findMemberIdByPosition(collectivityId, "VICE_PRESIDENT");
        if (vicePresidentId != null) {
            structure.setVicePresident(String.valueOf(vicePresidentId));
        }

        Long treasurerId = membershipRepository.findMemberIdByPosition(collectivityId, "TREASURER");
        if (treasurerId != null) {
            structure.setTreasurer(String.valueOf(treasurerId));
        }

        Long secretaryId = membershipRepository.findMemberIdByPosition(collectivityId, "SECRETARY");
        if (secretaryId != null) {
            structure.setSecretary(String.valueOf(secretaryId));
        }

        return structure;
    }

}