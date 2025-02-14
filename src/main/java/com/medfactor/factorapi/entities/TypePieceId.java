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
public class TypePieceId {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String code;
    private String dsg;
    private int taille;

    @Column(name = "pp_tun", nullable = true)
    private boolean ppTun;
    @Column(name = "pp_etr", nullable = true)
    private boolean ppEtr;

    @Column(name = "pp_res", nullable = true)
    private boolean ppRes;

    @Column(name = "pp_non_res", nullable = true)
    private boolean ppNonRes;
    @Column(name = "pm_tun", nullable = true)
    private boolean pmTun;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}
