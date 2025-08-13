package com.medfactor.factorapi.service;

import com.medfactor.factorapi.dtos.Adherent;
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
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.validation.ObjectError;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
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


    @Autowired
    private RestTemplate restTemplate;
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
    public List<Adherent> getAllAdherants() {
        List<Adherent> adherents = new ArrayList<>();
        adherents.addAll(getAdherentsPhysique());
        adherents.addAll(getAdherentsMorale());
        return adherents;
    }


    public List<PersonneMorale> getAdherentsMorale(){
        return personneMoraleRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.ADHERENT, false);
    }
    public List<PersonnePhysique> getAdherentsPhysique(){
        return personnePhysiqueRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.ADHERENT, false);
    }
    @Override
    public void updateRelationAdherentAcheteur(RelationAdherentAcheteur relation) {
        // Validate the relation before saving
        if (relation.getContratId() == null || (relation.getAcheteurPhysique() == null && relation.getAcheteurMorale() == null)) {
            throw new RuntimeException("Relation invalide : l'acheteur ou l'adhérent est manquant.");
        }

        // Save the relation
        relationAdherentAcheteurRepository.save(relation);
    }

    @Override
    public List<RelationAdherentAcheteur> getAllAcheteursByAdherantId(
            Long adherentId,
            String token
    ) {

//        PersonneMorale adherent = personneMoraleRepository
//                .findByIdAndArchiver(adherentId, false)
//                .orElseThrow(() -> new RuntimeException("Adhérent non trouvé"));
//
//
//        if (!adherent.getIndviduRoles().contains(IndviduRole.ADHERENT)) {
//            throw new RuntimeException("L'adhérent n'a pas le rôle ADHERENT.");
//        }

        String url = "http://localhost:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
//        String url = "http://contract:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
        HttpHeaders headers = new HttpHeaders();
        // If your API expects the JWT in a Cookie:
        headers.add(HttpHeaders.COOKIE, "JWT_TOKEN=" + token);
        // Or if it expects a Bearer header:
        // headers.setBearerAuth(token);

        HttpEntity<Void> entity = new HttpEntity<>(headers);

        // Use exchange so headers get sent
        ResponseEntity<Map> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                entity,
                Map.class
        );

        Map contrat = response.getBody();
        if (contrat == null || contrat.get("id") == null) {
            throw new RuntimeException("Contrat non trouvé pour l'adhérent avec ID: " + adherentId);
        }
        Long contratId = ((Number) contrat.get("id")).longValue();

        return relationAdherentAcheteurRepository.findAllByContratId(contratId);
    }


    @Override
    public void addAcheteurToAdherant(
            Long adherentId,
            Long acheteurPhysiqueId,
            Long acheteurMoraleId,
            RelAdhAcheReq req,
            HttpServletRequest httpRequest
    ) {
        // 1) Load and validate adherent

        // 2) Pull JWT token
        String token = (String) httpRequest.getAttribute("JWT_TOKEN");

        // 3) Call contrat service WITH your JWT COOKIE or Bearer header
        String url = "http://localhost:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
//        String url = "http://contract:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
        HttpHeaders headers = new HttpHeaders();
        // If your service reads the token from a cookie:
        headers.add(HttpHeaders.COOKIE, "JWT_TOKEN=" + token);
        // Or if it expects Authorization header instead:
        // headers.setBearerAuth(token);

        HttpEntity<Void> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> resp = restTemplate.exchange(
                url,
                HttpMethod.GET,
                entity,
                Map.class
        );

        if (resp.getStatusCode() != HttpStatus.OK || resp.getBody() == null) {
            throw new RuntimeException("Contrat non trouvé pour l'adhérent ID: " + adherentId);
        }
        Map<?,?> contratMap = resp.getBody();
        Number rawId = (Number) contratMap.get("id");
        if (rawId == null) {
            throw new RuntimeException("Réponse du contrat ne contient pas d’ID");
        }
        Long contratId = rawId.longValue();

        // 4) Build the relation
        RelationAdherentAcheteur relation = new RelationAdherentAcheteur();
        relation.setContratId(contratId);

        if (acheteurMoraleId != null ^ acheteurPhysiqueId != null) {
            if (acheteurMoraleId != null) {
                PersonneMorale pm = personneMoraleRepository
                        .findByIdAndArchiver(acheteurMoraleId, false)
                        .orElseThrow(() -> new RuntimeException("Acheteur morale non trouvé"));
                relation.setAcheteurMorale(pm);
            } else {
                PersonnePhysique pp = personnePhysiqueRepository
                        .findByIdAndArchiver(acheteurPhysiqueId, false)
                        .orElseThrow(() -> new RuntimeException("Acheteur physique non trouvé"));
                relation.setAcheteurPhysique(pp);
            }
        } else {
            throw new RuntimeException("Veuillez choisir un seul acheteur : physique ou morale.");
        }

        // 5) Fill in the rest from your request DTO
        relation.setDelaiMaxPai(req.getDelaiMaxPai());
        relation.setLimiteAchat(req.getLimiteAchat());
        relation.setLimiteCouverture(req.getLimiteCouverture());
        relation.setComiteRisqueTexte(req.getComiteRisqueTexte());
        relation.setComiteDerogTexte(req.getComiteDerogTexte());
        relation.setEffetDate(req.getEffetDate());
        relation.setInfoLibre(req.getInfoLibre());

        // 6) Persist
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
    public RelationAdherentAcheteur findPersonneAcheteurByIdRelation(Long id) {
        RelationAdherentAcheteur relation = relationAdherentAcheteurRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Relation non trouvée pour l'acheteur avec ID: " + id));
        return relation;
    }

    @Override
    public List<TopAdherentDTO> getTopAdherents() {
//        return relationAdherentAcheteurRepository.findTopAdherents();
        return null;
    }

    @Override
    public Map<String, Long> getCountRoles() {
        Map<String, Long> roleCounts = new HashMap<>();
        Long nbAdherents = personneMoraleRepository.countByIndviduRolesContaining(IndviduRole.ADHERENT) +
                personnePhysiqueRepository.countByIndviduRolesContaining(IndviduRole.ADHERENT);
        Long nbAcheteurs = personneMoraleRepository.countByIndviduRolesContaining(IndviduRole.ACHETEUR) +
                personnePhysiqueRepository.countByIndviduRolesContaining(IndviduRole.ACHETEUR);
        roleCounts.put("nbAdherents", nbAdherents);
        roleCounts.put("nbAcheteurs", nbAcheteurs);
        return roleCounts;

    }
}
