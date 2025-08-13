package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Table(name = "xAssur")
public class Assur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "xAssurId", nullable = false)
    private Long id;

    @Column(name = "xAssurCode", nullable = false, length = 8)
    private String code;

    @Column(name = "xAssurDsg", nullable = false, length = 64)
    private String dsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdresseIp;
    private Date sysDate= new Date();

}
