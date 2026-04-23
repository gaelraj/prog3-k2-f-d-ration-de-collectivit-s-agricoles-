package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Mandate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;

@Repository
public class MandateRepository {

    private final DataSource dataSource;

    public MandateRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Long getPositionIdByName(String name) {
        String sql = "SELECT id FROM position WHERE name = ?::position_type";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getLong(1);
                }
            }
            throw new RuntimeException("Position not found: " + name);

        } catch (SQLException e) {
            throw new RuntimeException("Error getting position id: " + e.getMessage(), e);
        }
    }

    public void save(Mandate mandate) {
        String sql = "INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setLong(1, mandate.getMembershipId());
            ps.setLong(2, mandate.getPositionId());
            ps.setObject(3, mandate.getStartDate());
            ps.setObject(4, mandate.getEndDate());
            ps.setInt(5, mandate.getMandateCount());

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    mandate.setId(rs.getLong(1));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error saving mandate: " + e.getMessage(), e);
        }
    }
}