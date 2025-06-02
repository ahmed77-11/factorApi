package com.medfactor.factorapi.service;

import com.medfactor.factorapi.dtos.RelAdhAcheReq;
import com.medfactor.factorapi.dtos.TopAdherentDTO;
import com.medfactor.factorapi.entities.AdherentAcheteurId;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.PersonnePhysiqueRepository;
import com.medfactor.factorapi.repos.RelationAdherentAcheteurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RolesServiceImpl implements RolesService{

    @Autowired
    private PersonneMoraleRepository personneMoraleRepository;
    @Autowired
    private PersonnePhysiqueRepository personnePhysiqueRepository;

    @Autowired
    private RelationAdherentAcheteurRepository relationAdherentAcheteurRepository;
    @Override
    public Map<String, Object> getAllAcheteurs() {
        Map<String,Object> acheteurs=new HashMap<>();
        List<PersonneMorale> acheteursPm=personneMoraleRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.ACHETEUR,false);
        List<PersonnePhysique> acheteursPp=personnePhysiqueRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.ACHETEUR,false);

        acheteurs.put("pms", acheteursPm);
        acheteurs.put("pps", acheteursPp);
        return acheteurs;

    }

    @Override
    public List<PersonneMorale> getAllAdherants() {
        return personneMoraleRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.ADHERENT,false);
    }

    @Override
    public List<RelationAdherentAcheteur> getAllAcheteursByAdherantId(Long adherentId) {
        // Find the adherent (always a PersonneMorale)
        PersonneMorale adherent = personneMoraleRepository.findByIdAndArchiver(adherentId, false)
                .orElseThrow(() -> new RuntimeException("Adhérent non trouvé"));

        // Fetch all relations for the given adherent
        return relationAdherentAcheteurRepository.findAllByAdherentId(adherent.getId());
    }

    @Override
    public void addAcheteurToAdherant(Long adherentId, Long acheteurPhysiqueId, Long acheteurMoraleId, RelAdhAcheReq req) {
        // Find the adherent (always a PersonneMorale)
        PersonneMorale adherent = personneMoraleRepository.findByIdAndArchiver(adherentId, false)
                .orElseThrow(() -> new RuntimeException("Adhérent non trouvé"));

        // Create a new instance of the embedded ID and the relation entity


        RelationAdherentAcheteur relation = new RelationAdherentAcheteur();
        relation.setAdherent(adherent);

        // Validate and assign the acheteur based on which one is provided
        if (acheteurMoraleId != null && acheteurPhysiqueId == null) {
            PersonneMorale acheteurMorale = personneMoraleRepository.findByIdAndArchiver(acheteurMoraleId, false)
                    .orElseThrow(() -> new RuntimeException("Acheteur morale non trouvé"));

            relation.setAcheteurMorale(acheteurMorale);
            relation.setAcheteurPhysique(null);


        } else if (acheteurPhysiqueId != null && acheteurMoraleId == null) {
            PersonnePhysique acheteurPhysique = personnePhysiqueRepository.findByIdAndArchiver(acheteurPhysiqueId, false)
                    .orElseThrow(() -> new RuntimeException("Acheteur physique non trouvé"));

            relation.setAcheteurPhysique(acheteurPhysique);
            relation.setAcheteurMorale(null);


        } else {
            throw new RuntimeException("Veuillez choisir un seul acheteur : physique ou morale.");
        }

        relation.setDelaiMaxPai(req.getDelaiMaxPai());
        relation.setLimiteAchat(req.getLimiteAchat());
        relation.setLimiteCouverture(req.getLimiteCouverture());
        relation.setComiteRisqueTexte(req.getComiteRisqueTexte());
        relation.setComiteDerogTexte(req.getComiteDerogTexte());
        relation.setEffetDate(req.getEffetDate());
        relation.setInfoLibre(req.getInfoLibre());
        relationAdherentAcheteurRepository.save(relation);

    }

    @Override
    public Map<String, Object> findPersonneAcheteurById(Long AcheteurId) {
        Map<String,Object> acheteur=new HashMap<>();
        PersonnePhysique acheteurPhysique=personnePhysiqueRepository.findByIdAndArchiver(AcheteurId,false).orElse(null);
        if(acheteurPhysique!=null){
            acheteur.put("acheteurPhysique",acheteurPhysique);
            return acheteur;

        }else if(acheteurPhysique==null){
            PersonneMorale acheteurMorale=personneMoraleRepository.findByIdAndArchiver(AcheteurId,false).orElse(null);
            acheteur.put("acheteurMorale",acheteurMorale);
            return acheteur;

        }else{
            throw new RuntimeException("Acheteur non trouvé");
        }
    }

    @Override
    public List<TopAdherentDTO> getTopAdherents() {
        return relationAdherentAcheteurRepository.findTopAdherents();
    }

    @Override
    public Map<String, Long> getCountRoles() {
        Map<String, Long> roleCounts = new HashMap<>();
        Long nbAdherents = personneMoraleRepository.countByIndviduRolesContaining(IndviduRole.ADHERENT);
        Long nbAcheteurs = personneMoraleRepository.countByIndviduRolesContaining(IndviduRole.ACHETEUR) +
                personnePhysiqueRepository.countByIndviduRolesContaining(IndviduRole.ACHETEUR);
        roleCounts.put("nbAdherents", nbAdherents);
        roleCounts.put("nbAcheteurs", nbAcheteurs);
        return roleCounts;

    }
}
