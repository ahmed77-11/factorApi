package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonnePhysique;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PersonnePhysiqueRepository extends JpaRepository<PersonnePhysique, Long> {
    Optional<PersonnePhysique> findByNumeroPieceIdentite(String numeroPieceIdentite);
}
