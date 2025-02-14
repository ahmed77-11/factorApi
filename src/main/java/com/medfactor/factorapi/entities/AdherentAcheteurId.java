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
public class AdherentAcheteurId implements Serializable {

    private Long adherentId;
    private Long acheteurPhysiqueId;  // Can be NULL
    private Long acheteurMoraleId;    // Can be NULL
}
