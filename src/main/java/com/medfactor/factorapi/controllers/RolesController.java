package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.dtos.RelAdhAcheReq;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import com.medfactor.factorapi.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/relations")
public class RolesController {
    @Autowired
    private RolesService rolesService;

    @GetMapping("/acheteurs")
    public Object getAcheteurs() {
        return rolesService.getAllAcheteurs();
    }

    @GetMapping("/adherants")
    public List<PersonneMorale> getAdherants() {
        return rolesService.getAllAdherants();
    }
    @PostMapping("/adherants/{adherentId}/acheteurs")
    public ResponseEntity<?> addAcheteur(
            @PathVariable Long adherentId,
            @RequestParam(required = false) Long acheteurPhysiqueId,
            @RequestParam(required = false) Long acheteurMoraleId, @RequestBody RelAdhAcheReq req) {

        rolesService.addAcheteurToAdherant(adherentId, acheteurPhysiqueId, acheteurMoraleId, req);
        return ResponseEntity.ok("Acheteur added to adherent successfully.");


    }

    @GetMapping("/acheteurs/{adherentId}")
    public List<RelationAdherentAcheteur> getAcheteursByAdherantId(@PathVariable("adherentId") Long adherentId) {
        return rolesService.getAllAcheteursByAdherantId(adherentId);
    }
    @GetMapping("/per-acheteur/{AcheteurId}")
    public ResponseEntity<?> getAcheteurById(@PathVariable("AcheteurId") Long AcheteurId) {
        return ResponseEntity.ok(rolesService.findPersonneAcheteurById(AcheteurId));
    }

}
