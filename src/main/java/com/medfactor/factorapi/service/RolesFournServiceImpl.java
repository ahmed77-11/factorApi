package com.medfactor.factorapi.service;

import com.medfactor.factorapi.dtos.Adherent;
import com.medfactor.factorapi.dtos.RelAdherFournReq;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.entities.RelationAdherentFournisseur;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.PersonnePhysiqueRepository;
import com.medfactor.factorapi.repos.RelationAdherentFournisseurRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RolesFournServiceImpl implements RolesFournService{

    @Autowired
    private PersonneMoraleRepository personneMoraleRepository;
    @Autowired
    private PersonnePhysiqueRepository personnePhysiqueRepository;
    @Autowired
    private RelationAdherentFournisseurRepository relationRepository;
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public Map<String, Object> getAllFournisseurs() {
        Map<String,Object> fournisseurs=new HashMap<>();
        List<PersonneMorale> fournisseursPm = personneMoraleRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.FOURNISSEUR, false);
        List<PersonnePhysique> fournisseursPp = personnePhysiqueRepository.findByIndviduRolesContainsAndArchiver(IndviduRole.FOURNISSEUR, false);

        fournisseurs.put("pms", fournisseursPm);
        fournisseurs.put("pps", fournisseursPp);
        return fournisseurs;
    }



    @Override
    public void updateRelationAdherentFournisseur(RelationAdherentFournisseur relation) {
        if(relation.getContratId()==null || (relation.getFournisseurMorale()==null && relation.getFournisseurPhysique()==null)) {
            throw new IllegalArgumentException("Relation must have a contract ID and at least one type of fournisseur (morale or physique).");
        }
        relationRepository.save(relation);

    }

    @Override
    public List<RelationAdherentFournisseur> getAllFournisseursByAdherantId(Long adherentId, String token) {
        String url = "http://localhost:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
//        String url="http://contract:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
        HttpHeaders headers=new HttpHeaders();
        headers.add(HttpHeaders.COOKIE,"JWT_TOKEN="+token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response=restTemplate.exchange(
                url,
                HttpMethod.GET,
                entity,
                Map.class
        );
        Map contrat=response.getBody();
        if(contrat==null || contrat.get("id")== null) {
            throw new RuntimeException("No contract found for adherent with ID: " + adherentId);
        }
        Long contratId=((Number) contrat.get("id")).longValue();

        return relationRepository.findAllByContratId(contratId);
    }

    @Override
    public void addFournisseurToAdherant(Long adherentId, Long fournisseurPhysiqueId, Long fournisseurMoraleId, RelAdherFournReq req, HttpServletRequest httpRequest) {

        String token=(String) httpRequest.getAttribute("JWT_TOKEN");

        String url = "http://localhost:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
        //        String url = "http://contract:8083/factoring/contrat/api/find-by-adherent/" + adherentId;
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.COOKIE, "JWT_TOKEN=" + token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> resp= restTemplate.exchange(
                url,
                HttpMethod.GET,
                entity,
                Map.class
        );

        if(resp.getStatusCode()!= HttpStatus.OK || resp.getBody() == null) {
            throw new RuntimeException("No contract found for adherent with ID: " + adherentId);
        }
        Map<?,?> contratMap= resp.getBody();
        Number rawId = (Number) contratMap.get("id");
        if(rawId == null) {
            throw new RuntimeException("No contract ID found for adherent with ID: " + adherentId);
        }
        Long contratId=rawId.longValue();
        RelationAdherentFournisseur relation = new RelationAdherentFournisseur();
        relation.setContratId(contratId);

        if(fournisseurMoraleId!= null ^ fournisseurPhysiqueId!=null){
            if(fournisseurMoraleId!=null){
                PersonneMorale fournisseurMorale = personneMoraleRepository.findById(fournisseurMoraleId)
                        .orElseThrow(() -> new RuntimeException("Fournisseur morale non trouvé"));
                relation.setFournisseurMorale(fournisseurMorale);
            }else{
                PersonnePhysique fournisseurPhysique = personnePhysiqueRepository.findById(fournisseurPhysiqueId)
                        .orElseThrow(() -> new RuntimeException("Fournisseur physique non trouvé"));
                relation.setFournisseurPhysique(fournisseurPhysique);
            }
        }else{
            throw new IllegalArgumentException("Veuillez choisir un seul acheteur : physique ou morale.");
        }


        relation.setLimiteFinAuto(req.getLimiteFinAuto());
        relation.setComiteRisqueTexte(req.getComiteRisqueTexte());
        relation.setComiteDerogTexte(req.getComiteDerogTexte());
        relation.setEffetDate(req.getEffetDate());
        relation.setInfoLibre(req.getInfoLibre());
        relationRepository.save(relation);
    }

    @Override
    public Map<String, Object> findPersonneFournisseurById(Long fournisseurId) {
        Map<String,Object> fournisseur = new HashMap<>();
        PersonnePhysique fournisseurPp=personnePhysiqueRepository.findByIdAndArchiver(fournisseurId, false)
                .orElse(null);
        if(fournisseurPp != null) {
            fournisseur.put("fournisseurPhysique", fournisseurPp);
            return fournisseur;
        }else if(fournisseurPp==null){
            PersonneMorale fournisseurPm=personneMoraleRepository.findByIdAndArchiver(fournisseurId, false)
                    .orElse(null);
            fournisseur.put("fournisseurMorale", fournisseurPm);
            return fournisseur;
        }else {
            throw new RuntimeException("Fournisseur non trouvé ");
        }
    }

    @Override
    public RelationAdherentFournisseur findPersonneFournisseurByIdRelation(Long id) {
    RelationAdherentFournisseur relation = relationRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Relation fournisseur non trouvée pour l'ID: " + id));
        return relation;
    }
}
