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
@Table(name = "yPmMereFiliale")
public class PmMereFiliale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "yPmMereFilialeId", nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "yPmMereIdFk", nullable = false)
    private PersonneMorale mere;
    @ManyToOne
    @JoinColumn(name = "yPmFilialeIdFk", nullable = false)
    private PersonneMorale filiale;

    @Column(name = "yPmMereFilialeEntryDate", nullable = true)
    private Date entryDate;

    @Column(name = "yPmMereFilialeExpireDate", nullable = true)
    private Date expireDate;

    @Column(name = "yPmMereFilialeInfoLibre", nullable = true)
    private String infoLibre;

    @Column(name="yPmMereFilialeFactorTauxFin" , nullable = true)
    private Double factorTauxFin;

    @Column(name = "yPmMereFilialeBoolArchvier", nullable = true)
    private Boolean archvier=false;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdresseIp;
    private Date sysDate= new Date();

}
