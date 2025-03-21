package com.medfactor.factorapi.entities;

import com.medfactor.factorapi.enums.Genre;
import com.medfactor.factorapi.enums.IndviduRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;


@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="yPp" ,uniqueConstraints = @UniqueConstraint(columnNames = {"yPpPieceIdentNum","xTypePieceIdentIdFk"}))
public class PersonnePhysique{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    /* PIECE IDENTITE */
    @ManyToOne
    @JoinColumn(name = "xTypePieceIdentIdFk", nullable = false)
    private TypePieceId TypePieceIdentite;

    @Column(name = "yPpPieceIdentNum")
    private String numeroPieceIdentite;

    @Column(name="yPpPieceIdentDelivDate",nullable = true)
    private Date pieceIdentiteDelivDate;

    @Column(name="yPpPieceIdentDelivLieue",nullable = true)
    private String pieceIdentiteDelivLieu;

    @Column(name="yPpPieceIdentAutorite",nullable = true)
    private String pieceIdentiteAutorite;

    @Column(name="yPpPieceIdentExripeDate",nullable = true)
    private Date pieceIdentiteExpireDate;

    /* informations generales */
    @Column(name="yPpNom",nullable = false)
    private String nom;

    @Column(name="yPpPrenom",nullable = false)
    private String prenom;

    @Column(name="yPpAlias",nullable = true)
    private String alias;
    @Enumerated(EnumType.STRING)
    @Column(name="yPpGenree",nullable = true)
    private Genre genre;

    @Column(name="yPpNaissanceDate",nullable = true)
    private Date naissanceDate;

    @Column(name="yPpNaissanceLieu",nullable = true)
    private String naissanceLieu;

    @ManyToOne
    @JoinColumn(name = "xNationaliteIdFk", nullable = true)
    private Nationalite nationalite;

    @ManyToOne
    @JoinColumn(name = "xProfessionIdFk", nullable = true)
    private Profession profession;

    @Column(name="yPpTelMobileNo",nullable = true)
    private String telMobileNo;

    @Column(name="yPpAdresse",nullable = false)
    private String adresse;

    @Column(name="yPpEmail",nullable = true)
    private String Email;

    @Column(name="yPpBoolTun",nullable = true)
    private boolean tun;

    @Column(name="yPpBoolResident",nullable = true)
    private boolean resident;

    @Column(name="yPpBoolExemptTva",nullable = true)
    private boolean exemptTva;

    @Column(name="yPpExemptTvaDateDeb",nullable = true)
    private Date exemptTvaDateDeb;

    @Column(name="yPpExemptTvaDateFin",nullable = true)
    private Date exemptTvaDateFin;

    @Column(name="yPpBoolExemptRs",nullable = true)
    private String exemptRs;

    @Column(name="yPpExemptRsDateDeb",nullable = true)
    private Date exemptRsDateDeb;

    @Column(name="yPpExemptRsDateFin",nullable = true)
    private Date exemptRsDateFin;

    @Column(name="yPpBoolExemptFatca",nullable = true)
    private boolean exemptFatca;

    @Column(name="yPpDecesDate",nullable = true)
    private boolean decesDate;

    @Column(name="yPpInfoLibre",nullable = true)
    private String infoLibre;

    @Column(nullable = true)
    private boolean contact;

    @Column(nullable = true)
    private boolean acheteur;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate= new Date();

    @Column(nullable = true)
    private boolean archiver=false;


    // Allow multiple roles
    @ElementCollection(targetClass = IndviduRole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "personne_physique_roles", joinColumns = @JoinColumn(name = "personne_physique_id"))
    @Enumerated(EnumType.STRING)
    private Set<IndviduRole> indviduRoles;



}