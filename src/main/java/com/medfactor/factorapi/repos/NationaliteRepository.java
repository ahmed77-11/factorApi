package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.Nationalite;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NationaliteRepository extends JpaRepository<Nationalite,Long> {
}
