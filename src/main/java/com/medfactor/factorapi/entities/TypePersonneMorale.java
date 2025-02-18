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
@Table(name = "xTypePersonneMorale")
public class TypePersonneMorale {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xTypePmId", nullable = true)
    private Long id;

    @Column(name = "xTypePmCode", nullable = true)
    private String code;

    @Column(name = "xTypePmDsg", nullable = true)
    private String dsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}