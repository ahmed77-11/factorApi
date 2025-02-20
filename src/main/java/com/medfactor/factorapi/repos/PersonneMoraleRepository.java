package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonneMorale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PersonneMoraleRepository extends JpaRepository<PersonneMorale, Long> {
    Optional<PersonneMorale> findByNumeroPieceIdentite(String numPieceIdentite);
}