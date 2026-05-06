package com.federation.federationdecollectivitesagricoles.controller;

import com.federation.federationdecollectivitesagricoles.dto.response.CollectivityStatisticResponse;
import com.federation.federationdecollectivitesagricoles.dto.response.MemberStatisticResponse;
import com.federation.federationdecollectivitesagricoles.service.StatisticService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
public class StatisticController {

    private final StatisticService statisticService;

    public StatisticController(StatisticService statisticService) {
        this.statisticService = statisticService;
    }

    @GetMapping("/collectivities/{id}/statistics")
    public ResponseEntity<?> getLocalStatistics(@PathVariable String id,
                                                @RequestParam LocalDate from,
                                                @RequestParam LocalDate to) {
        try {
            List<MemberStatisticResponse> response =
                    statisticService.getLocalStatistics(id, from, to);

            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            if (e.getMessage().contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/collectivities/statistics")
    public ResponseEntity<?> getOverallStatistics(@RequestParam LocalDate from,
                                                  @RequestParam LocalDate to) {
        try {
            List<CollectivityStatisticResponse> response =
                    statisticService.getOverallStatistics(from, to);

            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}