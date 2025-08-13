package com.medfactor.factorapi.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "yBlackList")
public class BlackList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "yBlackListId", nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name ="xTypePieceIdentIdFk", nullable = false)
    private TypePieceId typePieceId;

    @Column(name = "yBlackListPieceIdentiteNo", nullable = false)
    private String pieceIdentiteNo;

    @Column(name ="yBlackListNom", nullable = true)
    private String nom;
    @Column(name = "yBlackListPrenom", nullable = true)
    private String prenom;

    @Column(name = "yBlackListNaissanceDate", nullable = true)
    private Date naissanceDate;

    @Column(name = "yBlackListNaissanceLieu", nullable = true)
    private String naissanceLieu;

    @Column(name="yBlackListAdresse",nullable = true)
    private String adresse;

    @ManyToOne
    @JoinColumn(name = "xNationaliteIdFk", nullable = true)
    private Nationalite nationalite;

    @Column(name = "yBlackListJustif", nullable = true)
    private String justif;

    @Column(name = "yBlackListDate", nullable = true)
    private Date date;
    @Column(name = "yBlackListDecision", nullable = true)
    private String decision;
    @Column(name = "yBlackListPubWebDate", nullable = true)
    private Date pubWebDate;
    @Column(name = "yBlackListMajDate", nullable = true)
    private Date majDate;
    @Column(name = "yBlackListImportDate", nullable = true)
    private Date importDate;

    @Column(name = "yBlackListBoolArchvier", nullable = true)
    private Boolean archvier = false;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdresseIp;
    private Date sysDate= new Date();

}
