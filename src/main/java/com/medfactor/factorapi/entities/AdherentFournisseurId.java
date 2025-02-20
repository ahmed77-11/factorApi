package com.medfactor.factorapi.entities;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Embeddable
public class AdherentFournisseurId implements Serializable {

    private Long adherentId;
    private Long FournisseurPhysiqueId;  // Can be NULL
    private Long FournisseurMoraleId;    // Can be NULL
}
