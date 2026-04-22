package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Collectivity;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

@Repository
public class CollectivityRepository {

    private final DataSource dataSource;

    public CollectivityRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Collectivity save(Collectivity collectivity) {
        String sql = "INSERT INTO collectivity (number, name, location, creation_date, authorization_status, annual_contribution_amount) VALUES (?, ?, ?, ?, ?, ?) RETURNING id";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, collectivity.getNumber());
            ps.setString(2, collectivity.getName());
            ps.setString(3, collectivity.getLocation());
            ps.setObject(4, collectivity.getCreationDate());
            ps.setBoolean(5, collectivity.getFederationApproval());
            ps.setBigDecimal(6, java.math.BigDecimal.valueOf(collectivity.getAnnualContributionAmount()));

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    collectivity.setId(rs.getLong(1));
                }
            }
            return collectivity;

        } catch (SQLException e) {
            throw new RuntimeException("Error saving collectivity: " + e.getMessage(), e);
        }
    }

    public boolean existsById(Long id) {
        String sql = "SELECT COUNT(*) FROM collectivity WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;

        } catch (SQLException e) {
            throw new RuntimeException("Error checking collectivity existence: " + e.getMessage(), e);
        }
    }

    public Collectivity findById(Long id) {
        String sql = "SELECT id, number, name, location, creation_date, authorization_status, annual_contribution_amount FROM collectivity WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Collectivity c = new Collectivity();
                    c.setId(rs.getLong("id"));
                    c.setNumber(rs.getString("number"));
                    c.setName(rs.getString("name"));
                    c.setLocation(rs.getString("location"));
                    c.setCreationDate(rs.getObject("creation_date", LocalDate.class));
                    c.setFederationApproval(rs.getBoolean("authorization_status"));
                    c.setAnnualContributionAmount(rs.getBigDecimal("annual_contribution_amount").longValue());
                    return c;
                }
            }
            return null;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding collectivity: " + e.getMessage(), e);
        }
    }

    public boolean existsByNumber(String number) {
        String sql = "SELECT COUNT(*) FROM collectivity WHERE number = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, number);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;

        } catch (SQLException e) {
            throw new RuntimeException("Error checking number existence: " + e.getMessage(), e);
        }
    }

    public boolean existsByName(String name) {
        String sql = "SELECT COUNT(*) FROM collectivity WHERE name = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;

        } catch (SQLException e) {
            throw new RuntimeException("Error checking name existence: " + e.getMessage(), e);
        }
    }

    public Collectivity update(Collectivity collectivity) {
        String sql = "UPDATE collectivity SET number = ?, name = ?, location = ?, creation_date = ?, authorization_status = ?, annual_contribution_amount = ? WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, collectivity.getNumber());
            ps.setString(2, collectivity.getName());
            ps.setString(3, collectivity.getLocation());
            ps.setObject(4, collectivity.getCreationDate());
            ps.setBoolean(5, collectivity.getFederationApproval());
            ps.setBigDecimal(6, java.math.BigDecimal.valueOf(collectivity.getAnnualContributionAmount()));
            ps.setLong(7, collectivity.getId());

            ps.executeUpdate();
            return collectivity;

        } catch (SQLException e) {
            throw new RuntimeException("Error updating collectivity: " + e.getMessage(), e);
        }
    }

}