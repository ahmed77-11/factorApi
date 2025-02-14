package com.medfactor.factorapi.entities;

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
@Table(name="personne_morale" ,uniqueConstraints = @UniqueConstraint(columnNames = {"numero_piece_identite","type_piece_identite"}))
public class PersonneMorale   {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

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

    /*  JURIDIQUE */
    private String raisonSocial;
    private String sigle;

    @Column(nullable = true)
    private String matriculeFiscal;

    @Column(nullable = true)
    private Date ppCreationDate;

    @Column(nullable = true)
    private String ppCreationLieu;

    @ManyToOne
    @JoinColumn(name = "nationalite", nullable = true)
    private Nationalite nationalite;

    @ManyToOne
    @JoinColumn(name = "forme_juridique", nullable = true)
    private FormeJuridique formeJuridique;

    @ManyToOne
    @JoinColumn(name = "activite", nullable = true)
    private Activite activite;

    /* general Information */
    private String adresse;
    private String ville;
    private String siteWeb;
    private String email;
    private String telNo;

    @Column(nullable = true)
    private boolean commerce;

    @Column(nullable = true)
    private boolean ppTun;

    @Column(nullable = true)
    private boolean ppResident;

    @Column(nullable = true)
    private boolean assureur;

    @ManyToOne
    @JoinColumn(name = "groupe", nullable = true)
    private Groupe groupe;

    @ManyToOne
    @JoinColumn(name = "type_pm", nullable = true)
    private TypePersonneMorale typePm;

    @ManyToOne
    @JoinColumn(name = "situation_judiciaire", nullable = true)
    private SituationJudiciaire situationJudiciaire;

    @Column(nullable = true)
    private boolean pub;

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
    private Date finActiviteDate;

    @Column(nullable = true)
    private String infoLibre;


    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;

    // Allow multiple roles
    @ElementCollection(targetClass = IndviduRole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "personne_morale_roles", joinColumns = @JoinColumn(name = "personne_morale_id"))
    @Enumerated(EnumType.STRING)
    private Set<IndviduRole> indviduRoles;

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
