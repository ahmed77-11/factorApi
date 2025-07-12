package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.dtos.TopAdherentDTO;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface RelationAdherentAcheteurRepository extends JpaRepository<RelationAdherentAcheteur, Long> {
    List<RelationAdherentAcheteur> findAllByAdherentId(Long adherent_id);

    Optional<RelationAdherentAcheteur> findById(Long id);

    @Query("SELECT r FROM RelationAdherentAcheteur r WHERE r.adherent.id = :adherentId")
    List<RelationAdherentAcheteur> findByAdherentId(@Param("adherentId") Long adherentId);


    @Query(value = """
        SELECT r.adherent_id AS adherentId,
            a.y_pm_raison_sociale AS adherentName,
            COUNT(DISTINCT CASE 
                WHEN r.acheteur_physique_id IS NOT NULL THEN r.acheteur_physique_id
                ELSE r.acheteur_morale_id
            END) AS totalAcheteurs
        FROM _adherent_acheteur r
        JOIN y_pm a ON a.id = r.adherent_id
        GROUP BY r.adherent_id, a.y_pm_raison_sociale
        ORDER BY totalAcheteurs DESC
        """, nativeQuery = true)
    List<TopAdherentDTO> findTopAdherents();




}
