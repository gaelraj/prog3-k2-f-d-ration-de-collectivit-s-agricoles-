package com.federation.federationdecollectivitesagricoles.service;

import com.federation.federationdecollectivitesagricoles.dto.*;
import com.federation.federationdecollectivitesagricoles.entity.*;
import com.federation.federationdecollectivitesagricoles.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class MemberService {

    private final MemberRepository memberRepository;
    private final MembershipRepository membershipRepository;
    private final CollectivityRepository collectivityRepository;
    private final SponsorshipRelationRepository sponsorshipRelationRepository;
    private final TransactionRepository transactionRepository;

    public MemberService(MemberRepository memberRepository,
                         MembershipRepository membershipRepository,
                         CollectivityRepository collectivityRepository,
                         SponsorshipRelationRepository sponsorshipRelationRepository,
                         TransactionRepository transactionRepository) {
        this.memberRepository = memberRepository;
        this.membershipRepository = membershipRepository;
        this.collectivityRepository = collectivityRepository;
        this.sponsorshipRelationRepository = sponsorshipRelationRepository;
        this.transactionRepository = transactionRepository;
    }

    @Transactional
    public MemberResponse createMember(CreateMemberRequest request) {
        Long collectivityId = Long.parseLong(request.getCollectivityIdentifier());

        Collectivity collectivity = collectivityRepository.findById(collectivityId);
        if (collectivity == null) {
            throw new RuntimeException("Collectivity not found");
        }

        List<String> refereeIds = request.getReferees();
        if (refereeIds == null || refereeIds.size() < 2) {
            throw new RuntimeException("At least 2 referees are required");
        }

        List<Membership> refereeMemberships = new ArrayList<>();
        for (String refereeId : refereeIds) {
            Membership refereeMembership = membershipRepository.findMembershipByMemberAndCollectivity(
                    Long.parseLong(refereeId), collectivityId);
            if (refereeMembership == null) {
                throw new RuntimeException("Referee " + refereeId + " is not a member of this collectivity");
            }
            if (!"CONFIRMED".equals(refereeMembership.getRank())) {
                throw new RuntimeException("Referee " + refereeId + " must be CONFIRMED");
            }
            refereeMemberships.add(refereeMembership);
        }

        long localCount = refereeMemberships.stream()
                .filter(m -> m.getCollectivityId().equals(collectivityId))
                .count();
        long otherCount = refereeMemberships.size() - localCount;

        if (localCount < otherCount) {
            throw new RuntimeException("Local referees count must be at least equal to other referees count");
        }

        if (request.getRegistrationFeePaid() == null || !request.getRegistrationFeePaid()) {
            throw new RuntimeException("Registration fee of 50,000 Ar must be paid");
        }

        if (request.getMembershipDuesPaid() == null || !request.getMembershipDuesPaid()) {
            throw new RuntimeException("Annual membership dues must be paid");
        }

        Member member = new Member();
        member.setFirstName(request.getFirstName());
        member.setLastName(request.getLastName());
        member.setBirthDate(LocalDate.parse(request.getBirthDate()));
        member.setGender(request.getGender());
        member.setAddress(request.getAddress());
        member.setProfession(request.getProfession());
        member.setPhoneNumber(String.valueOf(request.getPhoneNumber()));
        member.setEmail(request.getEmail());
        member = memberRepository.save(member);

        Membership membership = new Membership();
        membership.setMemberId(member.getId());
        membership.setCollectivityId(collectivityId);
        membership.setMembershipDate(LocalDate.now());
        membership.setRank("JUNIOR");
        membership.setIsActive(true);
        membership.setAdmissionFeePaid(request.getRegistrationFeePaid());
        membership.setMembershipDuesPaid(request.getMembershipDuesPaid());
        membershipRepository.save(membership);

        for (int i = 0; i < refereeIds.size(); i++) {
            Long refereeMemberId = Long.parseLong(refereeIds.get(i));
            Membership refereeMembership = refereeMemberships.get(i);
            sponsorshipRelationRepository.save(membership.getId(), refereeMembership.getId(), "friend");
        }

        return buildResponse(member, membership, refereeMemberships);
    }

    private MemberResponse buildResponse(Member member, Membership membership, List<Membership> refereeMemberships) {
        MemberResponse response = new MemberResponse();
        response.setId(String.valueOf(member.getId()));
        response.setFirstName(member.getFirstName());
        response.setLastName(member.getLastName());
        response.setBirthDate(member.getBirthDate().toString());
        response.setGender(member.getGender());
        response.setAddress(member.getAddress());
        response.setProfession(member.getProfession());
        response.setPhoneNumber(Long.parseLong(member.getPhoneNumber()));
        response.setEmail(member.getEmail());
        response.setOccupation(membership.getRank());

        List<RefereeInfo> referees = new ArrayList<>();
        for (Membership rm : refereeMemberships) {
            Member referee = memberRepository.findById(rm.getMemberId());
            RefereeInfo info = new RefereeInfo();
            info.setId(String.valueOf(referee.getId()));
            info.setFirstName(referee.getFirstName());
            info.setLastName(referee.getLastName());
            info.setOccupation(rm.getRank());
            referees.add(info);
        }
        response.setReferees(referees);

        return response;
    }

    @Transactional
    public List<MemberPaymentResponse> createPayments(Long memberId, List<CreateMemberPaymentRequest> requests) {
        Member member = memberRepository.findById(memberId);
        if (member == null) {
            throw new RuntimeException("Member not found");
        }

        Membership membership = membershipRepository.findMembershipByMemberAndCollectivity(memberId, null);
        if (membership == null) {
            throw new RuntimeException("Member not associated with any collectivity");
        }

        List<MemberPaymentResponse> responses = new ArrayList<>();

        for (CreateMemberPaymentRequest request : requests) {
            if (request.getAmount() == null || request.getAmount() <= 0) {
                throw new RuntimeException("Amount must be greater than 0");
            }

            Transaction transaction = new Transaction();
            transaction.setCollectivityId(membership.getCollectivityId());
            transaction.setMemberId(memberId);
            transaction.setAmount(Double.valueOf(request.getAmount()));
            transaction.setPaymentMode(request.getPaymentMode());
            transaction.setCreationDate(LocalDate.now());
            transaction = transactionRepository.save(transaction);

            MemberPaymentResponse response = new MemberPaymentResponse();
            response.setId(String.valueOf(transaction.getId()));
            response.setAmount(request.getAmount());
            response.setPaymentMode(request.getPaymentMode());
            response.setCreationDate(transaction.getCreationDate());
            responses.add(response);
        }
        return responses;
    }
}