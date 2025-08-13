package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.RelationAdherentFournisseur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RelationAdherentFournisseurRepository extends JpaRepository<RelationAdherentFournisseur, Long>{
    List<RelationAdherentFournisseur> findAllByContratId(Long contratId);

    Optional<RelationAdherentFournisseur> findById(Long id);


}
