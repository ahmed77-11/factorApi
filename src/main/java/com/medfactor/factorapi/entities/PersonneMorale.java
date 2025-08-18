package com.medfactor.factorapi.entities;

import com.medfactor.factorapi.dtos.Adherent;
import com.medfactor.factorapi.enums.IndviduRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ManyToAny;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="yPm" ,uniqueConstraints = @UniqueConstraint(columnNames = {"yPmPieceIdentNum","xTypePieceIdentIdFk"}))
public class PersonneMorale implements Adherent {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /* PIECE IDENTITE */
    @ManyToOne
    @JoinColumn(name = "xTypePieceIdentIdFk", nullable = false)
    private TypePieceId TypePieceIdentite;

    @Column(name = "yPmPieceIdentNum")
    private String numeroPieceIdentite;

    @Column(name = "yPmPieceIdentDelivDate",nullable = true)
    private Date pieceIdentiteDelivDate;

    @Column(name="yPmPieceIdentDelivLieu",nullable = true)
    private String pieceIdentiteDelivLieu;

    @Column(name="yPmPieceIdentAutorite",nullable = true)
    private String pieceIdentiteAutorite;

    @Column(name="yPmPieceIdentExripeDate",nullable = true)
    private Date pieceIdentiteExpireDate;

    /*  JURIDIQUE */
    @Column(name="yPmRaisonSociale",nullable = false)
    private String raisonSocial;

    @Column(name="yPmSigle",nullable = false)
    private String sigle;

    @Column(name="yPmMatriculeFiscal",nullable = true)
    private String matriculeFiscal;

    @Column(name="yPpCreationDate",nullable = true)
    private Date ppCreationDate;

    @Column(name="yPpCreationLieu",nullable = true)
    private String ppCreationLieu;

    @ManyToOne
    @JoinColumn(name = "xNationaliteIdFk", nullable = true)
    private Nationalite nationalite;

    @ManyToOne
    @JoinColumn(name = "xFormeJuridiqueIdFk", nullable = true)
    private FormeJuridique formeJuridique;

    @ManyToOne
    @JoinColumn(name = "xActiviteIdFk", nullable = true)
    private Activite activite;

    /* general Information */
    @Column(name = "yPmAdresse", nullable = false)
    private String adresse;


    @Column(name = "yPmAdherBoolAccord", nullable = true)
    private Boolean pmAdherBoolAccord= false;
    @Column(name = "yPmAdherEnqueteEnCours", nullable = true)
    private Boolean pmAdherEnqueteEnCours= false;
    @Column(name = "yPmAchetBoolAccord", nullable = true)
    private Boolean pmAchetBoolAccord= false;
    @Column(name = "yPmAchetEnqueteEnCours", nullable = true)
    private Boolean pmAchetEnqueteEnCours= false;


    @Column(name = "yPmVille", nullable = false)
    private String ville;

    @Column(name = "yPmSiteWeb", nullable = true)
    private String siteWeb ;

    @Column(name = "yPmEmail", nullable = false)
    private String email;

    @Column(name = "yPmTelNo", nullable = false)
    private String telNo;

    @Column(name="yPmBoolCommerce",nullable = true)
    private boolean commerce;

    @Column(name="yPpBoolTun",nullable = true)
    private boolean ppTun;

    @Column(name="yPpBoolResident",nullable = true)
    private boolean ppResident;

    @Column(name="yPmBoolAssureur",nullable = true)
    private boolean assureur;

    @ManyToOne
    @JoinColumn(name = "xGroupeIdFk", nullable = true)
    private Groupe groupe;

    @ManyToOne
    @JoinColumn(name = "xTypePmIdFk", nullable = true)
    private TypePersonneMorale typePm;

    @ManyToOne
    @JoinColumn(name = "xSituationJudiciaireIdFk", nullable = true)
    private SituationJudiciaire situationJudiciaire;

    @Column(name="yPmPub",nullable = true)
    private boolean pub;

    @Column(name="yPmBoolExemptTva",nullable = true)
    private boolean exemptTva;

    @Column(name="yPmExemptTvaDateDeb",nullable = true)
    private Date exemptTvaDateDeb;

    @Column(name="yPmExemptTvaDateFin",nullable = true)
    private Date exemptTvaDateFin;

    @Column(name="yPmBoolExemptRs",nullable = true)
    private String exemptRs;

    @Column(name="yPmExemptRsDateDeb",nullable = true)
    private Date exemptRsDateDeb;

    @Column(name="yPmExemptRsDateFin",nullable = true)
    private Date exemptRsDateFin;

    @Column(name="yPmBoolExemptFatca",nullable = true)
    private boolean exemptFatca;

    @Column(name="yPmFactorAdherCode", nullable = true)
        private String factorAdherCode;
    @Column(name="yPmFactorAchetCode", nullable = true)
    private String factorAchetCode;
    @Column(name = "yPmFactorFournCode",nullable = true)
    private String factorFournCode;
    @Column(name = "yPmMfgAdherCode", nullable = true)
    private String PmMfgAdherCode;
    @Column(name ="yPmMfgAchetCode" ,nullable = true)
    private String PmMfgAchetCode;
    @Column(name = "yPmMfgFournCode", nullable = true)
    private String PmMfgFournCode;

    @Column(name="yPmActiviteDateDeb",nullable = true)
    private Date activiteDateDeb;
    @Column(name="yPmActiviteDateFin",nullable = true)
    private Date activiteDateFin;


    @Column(name="yPmInfoLibre",nullable = true)
    private String infoLibre;


    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate=new Date();

    @Column(nullable = true)
    private boolean archiver=false;

    // Allow multiple roles
    @ElementCollection(targetClass = IndviduRole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "personne_morale_roles", joinColumns = @JoinColumn(name = "personne_morale_id"))
    @Enumerated(EnumType.STRING)
    private Set<IndviduRole> indviduRoles;



    @ManyToMany
    @JoinTable(
            name = "adherent_contact",
            joinColumns = @JoinColumn(name = "adherent_id"),
            inverseJoinColumns = @JoinColumn(name = "contact_id")
    )
    private List<PersonnePhysique> contact;
    // Self-referential Many-to-Many: Adhérent -> Acheteurs
//    @ManyToMany
//    @JoinTable(
//            name = "adherent_acheteurPersonnePhysique",
//            joinColumns = @JoinColumn(name = "adherent_id"),
//            inverseJoinColumns = @JoinColumn(name = "acheteur_id")
//    )
//    private List<PersonnePhysique> acheteursPersonnePhysique;
//
//    @ManyToMany
//    @JoinTable(
//            name = "adherent_acheteurPersonneMorale",
//            joinColumns = @JoinColumn(name = "adherent_id"),
//            inverseJoinColumns = @JoinColumn(name = "acheteur_id")
//    )
//    private List<PersonneMorale> acheteursPersonneMorale;


}