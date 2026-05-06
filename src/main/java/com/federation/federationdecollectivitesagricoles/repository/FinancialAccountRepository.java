package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.dto.response.FinancialAccountResponse;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class FinancialAccountRepository {

    private final DataSource dataSource;

    public FinancialAccountRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<FinancialAccountResponse> findAllByCollectivityIdAtDate(Long collectivityId, LocalDate at) {
        String sql = """
    SELECT
        fa.id,
        fa.holder_name,
        fa.mobile_banking_service,
        fa.mobile_number,
        fa.bank_name,
        fa.bank_code,
        fa.bank_branch_code,
        fa.bank_account_number,
        fa.bank_account_key,
        COALESCE(SUM(
            CASE
                WHEN t.transaction_date <= ? THEN t.amount
                ELSE 0
            END
        ), 0) AS amount
    FROM financial_account fa
    LEFT JOIN transaction t ON t.financial_account_id = fa.id
    WHERE fa.collectivity_id = ?
    GROUP BY
        fa.id,
        fa.holder_name,
        fa.mobile_banking_service,
        fa.mobile_number,
        fa.bank_name,
        fa.bank_code,
        fa.bank_branch_code,
        fa.bank_account_number,
        fa.bank_account_key
    ORDER BY fa.id
""";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, at);
            ps.setLong(2, collectivityId);

            List<FinancialAccountResponse> accounts = new ArrayList<>();

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FinancialAccountResponse response = new FinancialAccountResponse();

                    response.setId(String.valueOf(rs.getLong("id")));
                    response.setHolderName(rs.getString("holder_name"));
                    response.setMobileBankingService(rs.getString("mobile_banking_service"));

                    long mobileNumber = rs.getLong("mobile_number");
                    if (!rs.wasNull()) {
                        response.setMobileNumber(mobileNumber);
                    }

                    response.setBankName(rs.getString("bank_name"));

                    int bankCode = rs.getInt("bank_code");
                    if (!rs.wasNull()) {
                        response.setBankCode(bankCode);
                    }

                    int bankBranchCode = rs.getInt("bank_branch_code");
                    if (!rs.wasNull()) {
                        response.setBankBranchCode(bankBranchCode);
                    }

                    int bankAccountNumber = rs.getInt("bank_account_number");
                    if (!rs.wasNull()) {
                        response.setBankAccountNumber(bankAccountNumber);
                    }

                    int bankAccountKey = rs.getInt("bank_account_key");
                    if (!rs.wasNull()) {
                        response.setBankAccountKey(bankAccountKey);
                    }

                    double amount = rs.getDouble("amount");
                    if (!rs.wasNull()) {
                        response.setAmount(amount);
                    }

                    accounts.add(response);
                }
            }

            return accounts;

        } catch (SQLException e) {
            throw new RuntimeException("Error finding financial accounts: " + e.getMessage(), e);
        }
    }
}