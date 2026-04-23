package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Transaction;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TransactionRepository {

    private final DataSource dataSource;

    public TransactionRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Transaction> findByCollectivityIdAndDateRange(Long collectivityId, LocalDate from, LocalDate to) {
        String sql = "SELECT id, collectivity_id, member_id, amount, payment_mode, payment_date FROM transaction WHERE collectivity_id = ? AND payment_date BETWEEN ? AND ?";
        List<Transaction> transactions = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, collectivityId);
            ps.setObject(2, from);
            ps.setObject(3, to);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Transaction t = new Transaction();
                    t.setId(rs.getLong("id"));
                    t.setCollectivityId(rs.getLong("collectivity_id"));
                    t.setMemberId(rs.getLong("member_id"));
                    t.setAmount(rs.getDouble("amount"));
                    t.setPaymentMode(rs.getString("payment_mode"));
                    t.setCreationDate(rs.getObject("payment_date", LocalDate.class));
                    transactions.add(t);
                }
            }
            return transactions;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding transactions: " + e.getMessage(), e);
        }
    }

    public Transaction save(Transaction transaction) {
        String sql = "INSERT INTO transaction (collectivity_id, member_id, amount, payment_mode, payment_date) VALUES (?, ?, ?, ?, ?) RETURNING id";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, transaction.getCollectivityId());
            ps.setLong(2, transaction.getMemberId());
            ps.setDouble(3, transaction.getAmount());
            ps.setString(4, transaction.getPaymentMode());
            ps.setObject(5, transaction.getCreationDate());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    transaction.setId(rs.getLong(1));
                }
            }
            return transaction;

        } catch (SQLException e) {
            throw new RuntimeException("Error saving transaction: " + e.getMessage(), e);
        }
    }
}