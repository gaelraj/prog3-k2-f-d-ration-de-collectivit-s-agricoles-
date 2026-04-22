package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.MembershipFee;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MembershipFeeRepository {

    private final DataSource dataSource;

    public MembershipFeeRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<MembershipFee> findByCollectivityId(Long collectivityId) {
        String sql = "SELECT id, collectivity_id, eligible_from, frequency, amount, label, status FROM membership_fee WHERE collectivity_id = ?";
        List<MembershipFee> fees = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, collectivityId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MembershipFee fee = new MembershipFee();
                    fee.setId(rs.getLong("id"));
                    fee.setCollectivityId(rs.getLong("collectivity_id"));
                    fee.setEligibleFrom(rs.getObject("eligible_from", LocalDate.class));
                    fee.setFrequency(rs.getString("frequency"));
                    fee.setAmount(rs.getDouble("amount"));
                    fee.setLabel(rs.getString("label"));
                    fee.setStatus(rs.getString("status"));
                    fees.add(fee);
                }
            }
            return fees;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding membership fees: " + e.getMessage(), e);
        }
    }

    public MembershipFee save(MembershipFee fee) {
        String sql = "INSERT INTO membership_fee (collectivity_id, eligible_from, frequency, amount, label, status) VALUES (?, ?, ?, ?, ?, ?) RETURNING id";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, fee.getCollectivityId());
            ps.setObject(2, fee.getEligibleFrom());
            ps.setString(3, fee.getFrequency());
            ps.setDouble(4, fee.getAmount());
            ps.setString(5, fee.getLabel());
            ps.setString(6, fee.getStatus());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    fee.setId(rs.getLong(1));
                }
            }
            return fee;

        } catch (SQLException e) {
            throw new RuntimeException("Error saving membership fee: " + e.getMessage(), e);
        }
    }
}