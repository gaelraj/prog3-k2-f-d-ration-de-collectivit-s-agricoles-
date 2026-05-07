package edu.hei.school.agricultural.datasource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Configuration
public class DBConnection {

    @Bean
    public Connection getConnection() {
        try {
            String jdbcURl = "jdbc:postgresql://localhost:5432/federations_corrections_db";
            String user = "postgres";
            String password = "fanevaloic";
            return DriverManager.getConnection(jdbcURl, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
