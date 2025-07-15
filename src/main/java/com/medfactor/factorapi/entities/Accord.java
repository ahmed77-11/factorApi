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

    @Column(name = "yAccordRisqueRef", length = 20, nullable = true)
    private String risqueRef;

    @Column(name = "yAccordRisqueDate", nullable = true)
    private Date risqueDate;

    @Column(name = "yAccordFactorRef", length = 20, nullable = true)
    private String factorRef;

    @Column(name = "yAccordFactorDate", nullable = true)
    private Date factorDate;

    @Column(name = "yAccordRevisionRisqueRef", length = 20, nullable = true)
    private String revisionRisqueRef;

    @ManyToOne
    @JoinColumn(name = "yPmFactorAdherCode", nullable = true)
    private PersonneMorale pmFactorAdher;

    @ManyToOne
    @JoinColumn(name = "yPpFactorAdherCode", nullable = true)
    private PersonnePhysique ppFactorAdher;

    @ManyToOne
    @JoinColumn(name = "yPmFactorAchetCode", nullable = true)
    private PersonneMorale pmFactorAchet;

    @ManyToOne
    @JoinColumn(name = "yPpFactorAchetCode", nullable = true)
    private PersonnePhysique ppFactorAchet;

    @Column(name = "yAccordDebDate", nullable = true)
    private Date debDate;

    @Column(name = "yAccordFinDate", nullable = true)
    private Date finDate;

    @Column(name = "yAccordNbrJourPreavis", nullable = true)
    private Integer nbrJourPreavis;

    @Column(name = "yAccordMontant", nullable = true, precision = 19, scale = 0)
    private BigDecimal montant;

    @Column(name="yAccordArchiver", nullable = true)
    private Boolean archiver= false;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdrIp;
    private Date sysDate;
}