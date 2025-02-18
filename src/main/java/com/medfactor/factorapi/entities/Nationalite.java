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
@Table(name = "xNationalite")
public class Nationalite {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xNationaliteId", nullable = true)
    private Long id;

    @Column(name = "xNationaliteCodeNum", nullable = true)
    private String codeNum;

    @Column(name = "xNationaliteCodeAlpha", nullable = true)
    private String codeAlpha;

    @Column(name = "xNationaliteDsg", nullable = true)
    private String codeDsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}