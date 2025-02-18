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
@Table(name = "xGroupe")
public class Groupe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xGroupeId", nullable = true)
    private Long id;

    @Column(name = "xGroupeCodeInterne", nullable = true)
    private String codeInterne;

    @Column(name = "xGroupeCodeBct", nullable = true)
    private String codeBct;

    @Column(name = "xGroupeDsg", nullable = true)
    private String dsg;

    private Long sysUserId;

    @Column(name = "sysUser", nullable = true)
    private String sysUser;

    @Column(name = "sysAdresseIp", nullable = true)
    private String sysAdrIp;

    @Column(name = "sysDate", nullable = true)
    private Date sysDate;


}