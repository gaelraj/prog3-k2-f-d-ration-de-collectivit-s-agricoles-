package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Activity;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;

@Repository
public class ActivityRepository {

    private final DataSource dataSource;

    public ActivityRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(Activity activity) {
        String sql = "INSERT INTO activity (id, collectivity_id, label, type, occupation_concerned, executive_date, recurrence_day_of_month) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, activity.getId());
            ps.setLong(2, activity.getCollectivityId());
            ps.setString(3, activity.getLabel());
            ps.setString(4, activity.getType());
            ps.setString(5, activity.getOccupationConcerned());
            ps.setObject(6, activity.getExecutiveDate());
            ps.setString(7, activity.getRecurrenceDayOfMonth());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error saving activity: " + e.getMessage(), e);
        }
    }

    public boolean existsById(Long collectivityId) {
        String sql = "SELECT COUNT(*) FROM collectivity WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, collectivityId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException("Error checking collectivity: " + e.getMessage(), e);
        }
    }
}