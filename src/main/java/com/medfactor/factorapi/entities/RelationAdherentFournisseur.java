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
@Table(name = "y_adher_fourn",uniqueConstraints = {
        @UniqueConstraint(columnNames = {"yContratIdFk", "yFournPpIdFk", "yFournPmIdFk"})
})
public class RelationAdherentFournisseur {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name = "yAdherFournId", nullable = false)
   private Long id;  // Surrogate primary key


    @Column(name = "yContratIdFk", nullable = true)
    private Long contratId;  // Foreign key to the contract

    // Acheteur as PersonnePhysique (Can be NULL)

    @ManyToOne
    @JoinColumn(name = "yFournPpIdFk", nullable = true)
    private PersonnePhysique FournisseurPhysique;

    // Acheteur as PersonneMorale (Can be NULL)
    @ManyToOne
    @JoinColumn(name = "yFournPmIdFk", nullable = true)
    private PersonneMorale FournisseurMorale;

    @Column(name = "yFournLimiteFinAuto", nullable = true)
    private Double limiteFinAuto;

    @Column(name = "yFournComiteRisqueTexte",nullable = true)
    private String comiteRisqueTexte;

    @Column(name = "yFournComiteDerogTexte",nullable = true)
    private String comiteDerogTexte;

    @Column(name="yFournEffetDate",nullable = true)
    private Date effetDate;

    @Column(name="yFournInfoLibre",nullable = true)
    private String infoLibre;


    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdresseIp;
    private Date sysDate= new Date();

    @PrePersist
    @PreUpdate
    private void validateAcheteur() {
        if ((FournisseurPhysique == null && FournisseurMorale == null) ||
                (FournisseurPhysique != null && FournisseurMorale != null)) {
            throw new IllegalStateException("L’un des paramètres FournisseurPhysique ou FournisseurMorale doit être défini.");
        }
    }

}
