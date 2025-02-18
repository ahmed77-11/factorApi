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
@Table(name = "xTypePieceIdentité")
public class TypePieceId {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xTypePieceIdentId", nullable = true)
    private Long id;

    @Column(name = "xTypePieceIdentCode", nullable = false)
    private String code;

    @Column(name = "xTypePieceIdentDsg", nullable = false)
    private String dsg;

    @Column(name = "xTypePieceIdentTaille", nullable = false)
    private int taille;

    @Column(name = "xTypePieceIdentBoolPpTun", nullable = false)
    private boolean ppTun;
    @Column(name = "xTypePieceIdentBoolPpEtr", nullable = false)
    private boolean ppEtr;

    @Column(name = "xTypePieceIdentBoolPpEtrRes", nullable = false)
    private boolean ppRes;

    @Column(name = "xTypePieceIdentBoolPpEtrNonRes", nullable = false)
    private boolean ppNonRes;
    @Column(name = "xTypePieceIdentBoolPmTun", nullable = false)
    private boolean pmTun;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}