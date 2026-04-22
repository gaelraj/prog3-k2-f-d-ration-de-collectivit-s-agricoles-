package com.federation.federationdecollectivitesagricoles.repository;

import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class SponsorshipRelationRepository {

    private final DataSource dataSource;

    public SponsorshipRelationRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(Long membershipId, Long sponsorMembershipId, String relationshipNature) {
        String sql = "INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature) VALUES (?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, membershipId);
            ps.setLong(2, sponsorMembershipId);
            ps.setString(3, relationshipNature);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error saving sponsorship relation: " + e.getMessage(), e);
        }
    }
}