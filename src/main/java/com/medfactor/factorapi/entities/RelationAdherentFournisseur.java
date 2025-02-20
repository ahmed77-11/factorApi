package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "_adherent_fournisseur")
public class RelationAdherentFournisseur {

    @EmbeddedId
    private AdherentFournisseurId id;  // Composite primary key

    // Adherent (always a PersonneMorale)
    @ManyToOne
    @MapsId("adherentId")  // Links the foreign key
    @JoinColumn(name = "adherent_id", nullable = false)
    private PersonneMorale adherent;

    // Acheteur as PersonnePhysique (Can be NULL)
    @ManyToOne
    @MapsId("FournisseurPhysiqueId")  // Links the foreign key
    @JoinColumn(name = "Fournisseur_physique_id", nullable = true)
    private PersonnePhysique FournisseurPhysique;

    // Acheteur as PersonneMorale (Can be NULL)
    @ManyToOne
    @MapsId("FournisseurMoraleId")  // Links the foreign key
    @JoinColumn(name = "Fournisseur_morale_id", nullable = true)
    private PersonneMorale FournisseurMorale;


    @PrePersist
    @PreUpdate
    private void validateAcheteur() {
        if ((FournisseurPhysique == null && FournisseurMorale == null) ||
                (FournisseurPhysique != null && FournisseurMorale != null)) {
            throw new IllegalStateException("L’un des paramètres FournisseurPhysique ou FournisseurMorale doit être défini.");
        }
    }

}
