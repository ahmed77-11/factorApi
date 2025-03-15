package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonneMoraleRepository extends JpaRepository<PersonneMorale, Long> {
    Optional<PersonneMorale> findByNumeroPieceIdentite(String numPieceIdentite);
    List<PersonneMorale> findAllByArchiver(boolean archiver);
    Optional<PersonneMorale> findByIdAndArchiver(Long id, boolean archiver);
}