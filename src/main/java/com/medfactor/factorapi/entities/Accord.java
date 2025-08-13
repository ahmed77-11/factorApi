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
@Table(name = "yAccord")
public class Accord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "yAccordId", nullable = true)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "yEnqueteIdFk", nullable = true)
    private Enquete enquete;

    @Column(name = "yEnqueteRef", length = 20, nullable = true)
    private String enqueteRef;

    @Column(name = "yAccordRisqueRef", length = 20, nullable = true)
    private String risqueRef;

    @Column(name = "yAccordRisqueDate", nullable = true)
    private Date risqueDate;

    @Column(name="xAssurCode",nullable = true)
    private String assurCode;
    @Column(name="xAccordAssurDate", nullable = true)
    private Date accordAssurDate;
    @Column(name = "xAccordAssurRef", length = 20, nullable = true)
    private String accordAssurRef;

    @Column(name = "yAccordFactorRef", length = 20, nullable = true)
    private String factorRef;

    @Column(name = "yAccordFactorDate", nullable = true)
    private Date factorDate;



    @Column(name = "yPmFactorAdherCode", nullable = true)
    private String pmFactorAdher;

    @Column(name = "yPpFactorAdherCode", nullable = true)
    private String ppFactorAdher;

    @Column(name = "yPmFactorAchetCode", nullable = true)
    private String pmFactorAchet;

    @Column(name = "yPpFactorAchetCode", nullable = true)
    private String ppFactorAchet;

    @Column(name = "yAccordValiditeDebDate", nullable = true)
    private Date debDate;

    @Column(name = "yAccordValiditeFinDate", nullable = true)
    private Date finDate;

    @Column(name = "yAccordNbrJourPreavis", nullable = true)
    private Integer nbrJourPreavis;

    @Column(name = "yAccordRisqueMontant", nullable = true, precision = 19, scale = 0)
    private BigDecimal risqueMontant;
    @Column(name = "yAccordFactorMontant", nullable = true, precision = 19, scale = 0)
    private BigDecimal factorMontant;
    @Column(name = "yAccordAssurMontant", nullable = true, precision = 19, scale = 0)
    private BigDecimal assurMontant;

    @Column(name="xDeviseIdFk", nullable = true)
    private Long deviseId;

    @Column(name="yAccordArchiver", nullable = true)
    private Boolean archiver= false;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdrIp;
    private Date sysDate;
}