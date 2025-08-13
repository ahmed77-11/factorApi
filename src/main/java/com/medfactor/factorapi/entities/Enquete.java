package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "yEnquete")
public class Enquete {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    @Column(name = "yEnqueteId", nullable = true)
    private Long id;

    @Column(name = "yEnqueteAdherRef", nullable = true, length = 20)
    private String adherRef;
    @Column(name = "yEnqueteAdherDate", nullable = true)
    private Date adherDate;

    @ManyToOne
    @JoinColumn(name = "yEnquetePmAdherIdFk",  nullable = true)
    private PersonneMorale pmAdher;

    @ManyToOne
    @JoinColumn(name = "yEnquetePpAdherIdFk", nullable = true)
    private PersonnePhysique ppAdher;

    @ManyToOne
    @JoinColumn(name = "yEnquetePmAchetIdFk", nullable = true)
    private PersonneMorale pmAchet;

    @ManyToOne
    @JoinColumn(name = "yEnquetePpAchetIdFk",  nullable = true)
    private PersonnePhysique ppAchet;

    @Column(name = "yEnqueteAdherMontant", nullable = true, precision = 19, scale = 0)
    private BigDecimal adherMontant;
    @Column(name="xDeviseIdFk", nullable = true)
    private Long deviseId;

    @Column(name = "yEnqueteAdherNbrJourReglem", nullable = true)
    private Integer adherNbrJourReglem;

    @Column(name = "yEnqueteAdherModeReglem", length = 20, nullable = true)
    private String adherModeReglem;

    @Column(name = "yEnqueteAdherTexte", nullable = true, length = 255)
    private String adherTexte;



    @Column(name ="yIsEnqueteActive", nullable = true)
    private Boolean isEnqueteActive = true;

    @Column(name="yEnqueteArchiver", nullable = true)
    private Boolean archiver = false;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdrIp;
    private Date sysDate;


}
