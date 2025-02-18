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
@Table(name = "xFormeJuridique")
public class FormeJuridique {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xFormeJuridiqueId", nullable = true)
    private Long id;

    @Column(name = "xFormeJuridiqueCode", nullable = true)
    private String code;

    @Column(name = "xFormeJuridiqueDsg", nullable = true)
    private String dsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;


}