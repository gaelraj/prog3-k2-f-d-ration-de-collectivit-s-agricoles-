package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Member;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MemberRepository {

    private final DataSource dataSource;

    public MemberRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Member findById(Long id) {
        String sql = "SELECT id, first_name, last_name, birth_date, gender, address, profession, phone, email FROM member WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRowToMember(rs);
                }
            }
            return null;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding member by id: " + e.getMessage(), e);
        }
    }

    public List<Member> findAllByIds(List<Long> ids) {
        if (ids == null || ids.isEmpty()) return new ArrayList<>();

        String sql = "SELECT id, first_name, last_name, birth_date, gender, address, profession, phone, email FROM member WHERE id = ANY(?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            Array array = conn.createArrayOf("bigint", ids.toArray());
            ps.setArray(1, array);

            List<Member> members = new ArrayList<>();
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    members.add(mapRowToMember(rs));
                }
            }
            return members;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding members by ids: " + e.getMessage(), e);
        }
    }

    private Member mapRowToMember(ResultSet rs) throws SQLException {
        Member m = new Member();
        m.setId(rs.getLong("id"));
        m.setFirstName(rs.getString("first_name"));
        m.setLastName(rs.getString("last_name"));
        m.setBirthDate(rs.getObject("birth_date", LocalDate.class));
        m.setGender(rs.getString("gender"));
        m.setAddress(rs.getString("address"));
        m.setProfession(rs.getString("profession"));
        m.setPhoneNumber(rs.getString("phone"));
        m.setEmail(rs.getString("email"));
        return m;
    }

    public Member save(Member member) {
        String sql = "INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING id";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, member.getFirstName());
            ps.setString(2, member.getLastName());
            ps.setObject(3, member.getBirthDate());
            ps.setString(4, member.getGender());
            ps.setString(5, member.getAddress());
            ps.setString(6, member.getProfession());
            ps.setString(7, member.getPhoneNumber());
            ps.setString(8, member.getEmail());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    member.setId(rs.getLong(1));
                }
            }
            return member;

        } catch (SQLException e) {
            throw new RuntimeException("Error saving member: " + e.getMessage(), e);
        }
    }
}