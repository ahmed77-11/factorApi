package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RelationAdherentAcheteurRepository extends JpaRepository<RelationAdherentAcheteur, Long> {
    List<RelationAdherentAcheteur> findAllByAdherentId(Long adherent_id);

    @Query("SELECT r FROM RelationAdherentAcheteur r WHERE r.adherent.id = :adherentId")
    List<RelationAdherentAcheteur> findByAdherentId(@Param("adherentId") Long adherentId);
}
