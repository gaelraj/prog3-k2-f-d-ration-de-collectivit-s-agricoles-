package com.federation.federationdecollectivitesagricoles.repository;

import com.federation.federationdecollectivitesagricoles.entity.Collectivity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CollectivityRepository extends JpaRepository<Collectivity, Integer> {
}