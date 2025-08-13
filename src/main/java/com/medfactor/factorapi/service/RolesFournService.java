package com.medfactor.factorapi.service;

import com.medfactor.factorapi.dtos.Adherent;
import com.medfactor.factorapi.dtos.RelAdherFournReq;
import com.medfactor.factorapi.entities.RelationAdherentFournisseur;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

public interface RolesFournService {

    Map<String,Object> getAllFournisseurs();


    void updateRelationAdherentFournisseur(RelationAdherentFournisseur relation);

    List<RelationAdherentFournisseur> getAllFournisseursByAdherantId(Long adherentId, String token);

    void addFournisseurToAdherant(Long adherentId, Long fournisseurPhysiqueId, Long fournisseurMoraleId, RelAdherFournReq req, HttpServletRequest httpRequest);

    Map<String,Object> findPersonneFournisseurById(Long fournisseurId);
    RelationAdherentFournisseur findPersonneFournisseurByIdRelation(Long id);


}
