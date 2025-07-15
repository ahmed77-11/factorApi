package com.medfactor.factorapi.service;

import com.medfactor.factorapi.dtos.Adherent;
import com.medfactor.factorapi.dtos.RelAdhAcheReq;
import com.medfactor.factorapi.dtos.TopAdherentDTO;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

public interface RolesService {

    Map<String,Object> getAllAcheteurs();
    List<Adherent> getAllAdherants();

    void updateRelationAdherentAcheteur(RelationAdherentAcheteur relation);

   List<RelationAdherentAcheteur> getAllAcheteursByAdherantId(Long adherentId,String token);

    void addAcheteurToAdherant(Long adherentId, Long acheteurPhysiqueId, Long acheteurMoraleId, RelAdhAcheReq req, HttpServletRequest httpRequest);

    Map<String,Object> findPersonneAcheteurById(Long AcheteurId);
    RelationAdherentAcheteur findPersonneAcheteurByIdRelation(Long id);


    List<TopAdherentDTO> getTopAdherents();


    Map<String,Long> getCountRoles();


}
