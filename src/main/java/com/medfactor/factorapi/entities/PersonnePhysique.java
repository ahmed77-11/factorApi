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
@Table(name="personne_physique" ,uniqueConstraints = @UniqueConstraint(columnNames = {"numero_piece_identite","type_piece_identite"}))
public class PersonnePhysique{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    /* PIECE IDENTITE */
    @ManyToOne
    @JoinColumn(name = "type_piece_identite", nullable = false)
    private TypePieceId TypePieceIdentite;

    @Column(name = "numero_piece_identite")
    private String numeroPieceIdentite;

    @Column(nullable = true)
    private Date pieceIdentiteDelivDate;

    @Column(nullable = true)
    private String pieceIdentiteDelivLieu;

    @Column(nullable = true)
    private String pieceIdentiteAutorite;

    @Column(nullable = true)
    private Date pieceIdentiteExpireDate;

    /* informations generales */

    private String nom;
    private String prenom;

    @Column(nullable = true)
    private String alias;
    @Enumerated(EnumType.STRING)
    @Column(nullable = true)
    private Genre genre;

    @Column(nullable = true)
    private Date naissanceDate;

    @Column(nullable = true)
    private String naissanceLieu;

    @ManyToOne
    @JoinColumn(name = "nationalite", nullable = true)
    private Nationalite nationalite;

    @ManyToOne
    @JoinColumn(name = "profession", nullable = true)
    private Profession profession;

    @Column(nullable = true)
    private String telMobileNo;

    private String adresse;

    @Column(nullable = true)
    private String Email;

    @Column(nullable = true)
    private boolean tun;

    @Column(nullable = true)
    private boolean resident;
    @Column(nullable = true)
    private boolean exemptTva;

    @Column(nullable = true)
    private Date exemptTvaDateDeb;

    @Column(nullable = true)
    private Date exemptTvaDateFin;

    @Column(nullable = true)
    private String exemptRs;

    @Column(nullable = true)
    private Date exemptRsDateDeb;

    @Column(nullable = true)
    private Date exemptRsDateFin;

    @Column(nullable = true)
    private boolean exemptFatca;

    @Column(nullable = true)
    private boolean decesDate;

    @Column(nullable = true)
    private String infoLibre;

    @Column(nullable = true)
    private boolean contact;

    @Column(nullable = true)
    private boolean acheteur;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;

    // Allow multiple roles
    @ElementCollection(targetClass = IndviduRole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "personne_physique_roles", joinColumns = @JoinColumn(name = "personne_physique_id"))
    @Enumerated(EnumType.STRING)
    private Set<IndviduRole> indviduRoles;



}