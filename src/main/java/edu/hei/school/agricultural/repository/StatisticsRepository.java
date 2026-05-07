package edu.hei.school.agricultural.repository;

import edu.hei.school.agricultural.entity.CollectivityLocalStatistics;
import edu.hei.school.agricultural.entity.CollectivityOverallStatistics;
import edu.hei.school.agricultural.entity.MemberDescription;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class StatisticsRepository {

    private final Connection connection;

    public List<CollectivityLocalStatistics> findLocalStatistics(
            String collectivityId,
            LocalDate from,
            LocalDate to
    ) {
        List<CollectivityLocalStatistics> statistics = new ArrayList<>();

        String sql = """
                select
                    m.id as member_id,
                    m.first_name,
                    m.last_name,
                    m.email,
                    m.occupation,
                    coalesce(payment_summary.earned_amount, 0) as earned_amount,
                    greatest(
                        coalesce(fee_summary.expected_amount, 0) - coalesce(payment_summary.earned_amount, 0),
                        0
                    ) as unpaid_amount
                from collectivity_member cm
                join "member" m on m.id = cm.member_id
                left join (
                    select
                        mp.collectivity_id,
                        mp.member_id,
                        sum(mp.amount) as earned_amount
                    from member_payment mp
                    where mp.creation_date between ? and ?
                    group by mp.collectivity_id, mp.member_id
                ) payment_summary
                    on payment_summary.collectivity_id = cm.collectivity_id
                    and payment_summary.member_id = cm.member_id
                left join (
                    select
                        mf.collectivity_id,
                        sum(mf.amount) as expected_amount
                    from membership_fee mf
                    where mf.status::text = 'ACTIVE'
                    and mf.eligible_from between ? and ?
                    group by mf.collectivity_id
                ) fee_summary
                    on fee_summary.collectivity_id = cm.collectivity_id
                where cm.collectivity_id = ?
                order by m.id
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, Date.valueOf(from));
            ps.setDate(2, Date.valueOf(to));
            ps.setDate(3, Date.valueOf(from));
            ps.setDate(4, Date.valueOf(to));
            ps.setString(5, collectivityId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MemberDescription memberDescription = MemberDescription.builder()
                        .id(rs.getString("member_id"))
                        .firstName(rs.getString("first_name"))
                        .lastName(rs.getString("last_name"))
                        .email(rs.getString("email"))
                        .occupation(rs.getString("occupation"))
                        .build();

                CollectivityLocalStatistics localStatistics = CollectivityLocalStatistics.builder()
                        .memberDescription(memberDescription)
                        .earnedAmount(rs.getDouble("earned_amount"))
                        .unpaidAmount(rs.getDouble("unpaid_amount"))
                        .build();

                statistics.add(localStatistics);
            }

            return statistics;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding local statistics: " + e.getMessage(), e);
        }
    }

    public List<CollectivityOverallStatistics> findOverallStatistics(
            LocalDate from,
            LocalDate to
    ) {
        List<CollectivityOverallStatistics> statistics = new ArrayList<>();

        String sql = """
                select
                    c.id as collectivity_id,
                    c.name as collectivity_name,
                    c.number as collectivity_number,
                    count(
                        case
                            when cm.adhesion_date between ? and ? then cm.member_id
                        end
                    ) as new_members_number,
                    case
                        when count(cm.member_id) = 0 then 0
                        else round(
                            (
                                sum(
                                    case
                                        when coalesce(payment_summary.earned_amount, 0) >= coalesce(fee_summary.expected_amount, 0)
                                        then 1
                                        else 0
                                    end
                                ) * 100.0
                            ) / count(cm.member_id),
                            2
                        )
                    end as overall_member_current_due_percentage
                from collectivity c
                left join collectivity_member cm
                    on cm.collectivity_id = c.id
                left join (
                    select
                        mp.collectivity_id,
                        mp.member_id,
                        sum(mp.amount) as earned_amount
                    from member_payment mp
                    where mp.creation_date between ? and ?
                    group by mp.collectivity_id, mp.member_id
                ) payment_summary
                    on payment_summary.collectivity_id = cm.collectivity_id
                    and payment_summary.member_id = cm.member_id
                left join (
                    select
                        mf.collectivity_id,
                        sum(mf.amount) as expected_amount
                    from membership_fee mf
                    where mf.status::text = 'ACTIVE'
                    and mf.eligible_from between ? and ?
                    group by mf.collectivity_id
                ) fee_summary
                    on fee_summary.collectivity_id = c.id
                group by c.id, c.name, c.number
                order by c.number
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, Date.valueOf(from));
            ps.setDate(2, Date.valueOf(to));
            ps.setDate(3, Date.valueOf(from));
            ps.setDate(4, Date.valueOf(to));
            ps.setDate(5, Date.valueOf(from));
            ps.setDate(6, Date.valueOf(to));

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CollectivityOverallStatistics overallStatistics = CollectivityOverallStatistics.builder()
                        .collectivityId(rs.getString("collectivity_id"))
                        .collectivityName(rs.getString("collectivity_name"))
                        .collectivityNumber(rs.getInt("collectivity_number"))
                        .newMembersNumber(rs.getInt("new_members_number"))
                        .overallMemberCurrentDuePercentage(rs.getDouble("overall_member_current_due_percentage"))
                        .build();

                statistics.add(overallStatistics);
            }

            return statistics;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding overall statistics: " + e.getMessage(), e);
        }
    }
}