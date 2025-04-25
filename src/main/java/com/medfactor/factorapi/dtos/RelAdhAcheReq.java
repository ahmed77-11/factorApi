package com.medfactor.factorapi.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RelAdhAcheReq {
    private int delaiMaxPai;
    private Double limiteAchat;
    private Double limiteCouverture;
    private String comiteRisqueTexte;
    private String comiteDerogTexte;
    private Date effetDate;
    private String infoLibre;
}
