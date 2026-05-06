package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityStatisticResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberDescriptionResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberStatisticResponse;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StatisticRepository {

    private final DataSource dataSource;

    public StatisticRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<MemberStatisticResponse> findLocalStatistics(Long collectivityId, LocalDate from, LocalDate to) {
        String sql = """
            SELECT
                m.id,
                m.first_name,
                m.last_name,
                m.email,
                ms.rank AS occupation,
                COALESCE(SUM(p.amount), 0) AS earned_amount,
                GREATEST(
                    COALESCE((
                        SELECT SUM(mf.amount)
                        FROM membership_fee mf
                        WHERE mf.collectivity_id = ms.collectivity_id
                        AND mf.status = 'ACTIVE'
                        AND mf.eligible_since <= ?
                    ), 0) - COALESCE(SUM(p.amount), 0),
                    0
                ) AS unpaid_amount
            FROM member m
            JOIN membership ms ON ms.member_id = m.id
            LEFT JOIN payment p
                ON p.member_id = m.id
                AND p.collectivity_id = ms.collectivity_id
                AND p.payment_date BETWEEN ? AND ?
            WHERE ms.collectivity_id = ?
            AND ms.is_active = true
            GROUP BY m.id, m.first_name, m.last_name, m.email, ms.rank, ms.collectivity_id
            ORDER BY m.id
        """;

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, to);
            ps.setObject(2, from);
            ps.setObject(3, to);
            ps.setLong(4, collectivityId);

            List<MemberStatisticResponse> statistics = new ArrayList<>();

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MemberDescriptionResponse memberDescription = new MemberDescriptionResponse();
                    memberDescription.setId(String.valueOf(rs.getLong("id")));
                    memberDescription.setFirstName(rs.getString("first_name"));
                    memberDescription.setLastName(rs.getString("last_name"));
                    memberDescription.setEmail(rs.getString("email"));
                    memberDescription.setOccupation(rs.getString("occupation"));

                    MemberStatisticResponse response = new MemberStatisticResponse();
                    response.setMemberDescription(memberDescription);
                    response.setEarnedAmount(rs.getDouble("earned_amount"));
                    response.setUnpaidAmount(rs.getDouble("unpaid_amount"));

                    statistics.add(response);
                }
            }

            return statistics;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding local statistics: " + e.getMessage(), e);
        }
    }

    public List<CollectivityStatisticResponse> findOverallStatistics(LocalDate from, LocalDate to) {
        String sql = """
            SELECT
                c.id,
                c.name,
                COUNT(ms.id) AS total_members,
                COUNT(
                    CASE
                        WHEN COALESCE(pay.total_paid, 0) >= COALESCE(fee.total_fee, 0)
                        THEN 1
                    END
                ) AS up_to_date_members,
                COUNT(
                    CASE
                        WHEN ms.membership_date BETWEEN ? AND ?
                        THEN 1
                    END
                ) AS new_members_count
            FROM collectivity c
            LEFT JOIN membership ms
                ON ms.collectivity_id = c.id
                AND ms.is_active = true
            LEFT JOIN (
                SELECT collectivity_id, SUM(amount) AS total_fee
                FROM membership_fee
                WHERE status = 'ACTIVE'
                AND eligible_since <= ?
                GROUP BY collectivity_id
            ) fee ON fee.collectivity_id = c.id
            LEFT JOIN (
                SELECT member_id, collectivity_id, SUM(amount) AS total_paid
                FROM payment
                WHERE payment_date BETWEEN ? AND ?
                GROUP BY member_id, collectivity_id
            ) pay ON pay.member_id = ms.member_id
                AND pay.collectivity_id = ms.collectivity_id
            GROUP BY c.id, c.name
            ORDER BY c.id
        """;

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, from);
            ps.setObject(2, to);
            ps.setObject(3, to);
            ps.setObject(4, from);
            ps.setObject(5, to);

            List<CollectivityStatisticResponse> statistics = new ArrayList<>();

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int totalMembers = rs.getInt("total_members");
                    int upToDateMembers = rs.getInt("up_to_date_members");

                    double percentage = 0.0;
                    if (totalMembers > 0) {
                        percentage = (upToDateMembers * 100.0) / totalMembers;
                    }

                    CollectivityStatisticResponse response = new CollectivityStatisticResponse();
                    response.setCollectivityId(String.valueOf(rs.getLong("id")));
                    response.setCollectivityName(rs.getString("name"));
                    response.setPaymentUpToDatePercentage(percentage);
                    response.setNewMembersCount(rs.getInt("new_members_count"));

                    statistics.add(response);
                }
            }

            return statistics;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding overall statistics: " + e.getMessage(), e);
        }
    }
}