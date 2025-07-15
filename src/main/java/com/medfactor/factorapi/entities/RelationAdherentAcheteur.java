package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "_adherent_acheteur", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"contrat_id", "acheteur_physique_id", "acheteur_morale_id"})
})
public class RelationAdherentAcheteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Surrogate primary key


    @Column(name ="contrat_id", nullable = true)
    private Long contratId;

//    @ManyToOne
//    @JoinColumn(name = "adherent_id", nullable = false)
//    private PersonneMorale adherent;

    @ManyToOne
    @JoinColumn(name = "acheteur_physique_id",nullable = true)
    private PersonnePhysique acheteurPhysique;

    @ManyToOne
    @JoinColumn(name = "acheteur_morale_id",nullable = true)
    private PersonneMorale acheteurMorale;

    @Column(name = "yAchatDelaiMaxPai",nullable = true)
    private Integer delaiMaxPai;
    @Column(name="yAchetLimiteAchat",nullable = true)
    private Double limiteAchat;

    @Column(name = "yAchetResteAchat",nullable = true)
    private Double resteAchat;

    @Column(name="yAchetAssurLimiteCouverture" ,nullable = true)
    private Double limiteCouverture;
    @Column(name = "yAchetComiteRisqueTexte",nullable = true)
    private String comiteRisqueTexte;

    @Column(name = "yAchetComiteDerogTexte",nullable = true)
    private String comiteDerogTexte;

    @Column(name="yAchetEffetDate",nullable = true)
    private Date effetDate;

    @Column(name="yAchetInfoLibre",nullable = true)
    private String infoLibre;
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