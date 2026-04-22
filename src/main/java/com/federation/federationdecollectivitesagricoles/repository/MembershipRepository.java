package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Membership;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;

@Repository
public class MembershipRepository {

    private final DataSource dataSource;

    public MembershipRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(Membership membership) {
        String sql = "INSERT INTO membership (member_id, collectivity_id, membership_date, rank, is_active, admission_fee_paid, membership_dues_paid) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setLong(1, membership.getMemberId());
            ps.setLong(2, membership.getCollectivityId());
            ps.setObject(3, membership.getMembershipDate());
            ps.setString(4, membership.getRank());
            ps.setBoolean(5, membership.getIsActive());
            ps.setBoolean(6, membership.getAdmissionFeePaid());
            ps.setBoolean(7, membership.getMembershipDuesPaid());

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    membership.setId(rs.getLong(1));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error saving membership: " + e.getMessage(), e);
        }
    }

    public int countMembersByCollectivityId(Long collectivityId) {
        String sql = "SELECT COUNT(*) FROM membership WHERE collectivity_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, collectivityId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            return 0;

        } catch (SQLException e) {
            throw new RuntimeException("Error counting members: " + e.getMessage(), e);
        }
    }

    public int countSeniorMembersByCollectivityId(Long collectivityId, LocalDate sixMonthsAgo) {
        String sql = "SELECT COUNT(*) FROM membership WHERE collectivity_id = ? AND membership_date <= ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, collectivityId);
            ps.setObject(2, sixMonthsAgo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            return 0;

        } catch (SQLException e) {
            throw new RuntimeException("Error counting senior members: " + e.getMessage(), e);
        }
    }

    public Long getMembershipIdByMemberAndCollectivity(Long memberId, Long collectivityId) {
        String sql = "SELECT id FROM membership WHERE member_id = ? AND collectivity_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, memberId);
            ps.setLong(2, collectivityId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getLong(1);
                }
            }
            return null;

        } catch (SQLException e) {
            throw new RuntimeException("Error getting membership id: " + e.getMessage(), e);
        }
    }
}