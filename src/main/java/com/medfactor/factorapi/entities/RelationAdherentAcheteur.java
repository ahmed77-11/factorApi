package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "_adherent_acheteur", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"adherent_id", "acheteur_physique_id", "acheteur_morale_id"})
})
public class RelationAdherentAcheteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Surrogate primary key

    @ManyToOne
    @JoinColumn(name = "adherent_id", nullable = false)
    private PersonneMorale adherent;

    @ManyToOne
    @JoinColumn(name = "acheteur_physique_id",nullable = true)
    private PersonnePhysique acheteurPhysique;

    @ManyToOne
    @JoinColumn(name = "acheteur_morale_id",nullable = true)
    private PersonneMorale acheteurMorale;

    @PrePersist
    @PreUpdate
    private void validateAcheteur() {
        boolean hasPhysique = acheteurPhysique != null;
        boolean hasMorale = acheteurMorale != null;
        if (hasPhysique == hasMorale) { // either both are set or both are null
            throw new IllegalStateException("Exactly one of acheteurPhysique or acheteurMorale must be set.");
        }
    }
}