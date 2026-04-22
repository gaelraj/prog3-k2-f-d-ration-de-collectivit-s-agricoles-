package com.federation.federationdecollectivitesagricoles.config;

import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Component
public class db_connection {

    private final String url = "jdbc:postgresql://localhost:5432/federation_db";
    private final String username = "postgres";
    private final String password = "123456";

    public Connection getConnection() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}