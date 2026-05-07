package com.federation.federationdecollectivitesagricoles.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class ApiKeyFilter extends OncePerRequestFilter {

    private final String validApiKey = "agri-secure-key";
    private final String apiKeyHeader = "x-api-key";

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String apiKey = request.getHeader(apiKeyHeader);

        if (apiKey == null) {
            response.setStatus(401);
            response.getWriter().write("Bad credentials");
            return;
        }

        if (!validApiKey.equals(apiKey)) {
            response.setStatus(401);
            response.getWriter().write("Bad credentials");
            return;
        }

        filterChain.doFilter(request, response);
    }
}