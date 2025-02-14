package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "_adherent_acheteur")
public class RelationAdherentAcheteur {

    @EmbeddedId
    private AdherentAcheteurId id;  // Composite primary key

    // Adherent (always a PersonneMorale)
    @ManyToOne
    @MapsId("adherentId")  // Links the foreign key
    @JoinColumn(name = "adherent_id", nullable = false)
    private PersonneMorale adherent;

    // Acheteur as PersonnePhysique (Can be NULL)
    @ManyToOne
    @MapsId("acheteurPhysiqueId")  // Links the foreign key
    @JoinColumn(name = "acheteur_physique_id", nullable = true)
    private PersonnePhysique acheteurPhysique;

    // Acheteur as PersonneMorale (Can be NULL)
    @ManyToOne
    @MapsId("acheteurMoraleId")  // Links the foreign key
    @JoinColumn(name = "acheteur_morale_id", nullable = true)
    private PersonneMorale acheteurMorale;


@PrePersist
    @PreUpdate
    private void validateAcheteur() {
        if ((acheteurPhysique == null && acheteurMorale == null) ||
                (acheteurPhysique != null && acheteurMorale != null)) {
            throw new IllegalStateException("Exactly one of acheteurPhysique or acheteurMorale must be set.");
        }
    }

}
