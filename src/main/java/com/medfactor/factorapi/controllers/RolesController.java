package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.dtos.Adherent;
import com.medfactor.factorapi.dtos.RelAdhAcheReq;
import com.medfactor.factorapi.dtos.RelAdherFournReq;
import com.medfactor.factorapi.dtos.TopAdherentDTO;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.RelationAdherentAcheteur;
import com.medfactor.factorapi.entities.RelationAdherentFournisseur;
import com.medfactor.factorapi.service.RolesFournService;
import com.medfactor.factorapi.service.RolesService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.xml.ws.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/relations")
public class RolesController {
    @Autowired
    private RolesService rolesService;
    @Autowired
    private RolesFournService rolesFournService;

    @GetMapping("/acheteurs")
    public Object getAcheteurs() {
        return rolesService.getAllAcheteurs();
    }

    @GetMapping("/fournisseurs")
    public Object getFournisseurs() {
        return rolesFournService.getAllFournisseurs();
    }

    @GetMapping("/adherants")
    public List<Adherent> getAdherants() {
        return rolesService.getAllAdherants();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getRelationById(@PathVariable("id") Long id) {
        RelationAdherentAcheteur relation = rolesService.findPersonneAcheteurByIdRelation(id);
        if (relation == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(relation);
    }
    @GetMapping("/fournisseurs/{id}")
    public ResponseEntity<?> getFournisseurById(@PathVariable("id") Long id) {
        RelationAdherentFournisseur fournisseur = rolesFournService.findPersonneFournisseurByIdRelation(id);
        if (fournisseur == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(fournisseur);
    }

    @PostMapping("/adherants/{adherentId}/acheteurs")
    public ResponseEntity<?> addAcheteur(
            @PathVariable Long adherentId,
            @RequestParam(required = false) Long acheteurPhysiqueId,
            @RequestParam(required = false) Long acheteurMoraleId, @RequestBody RelAdhAcheReq req,HttpServletRequest http) {

        rolesService.addAcheteurToAdherant(adherentId, acheteurPhysiqueId, acheteurMoraleId, req,http);
        return ResponseEntity.ok("Acheteur added to adherent successfully.");


    }

    @PostMapping("/adherants/{adherentId}/fournisseurs")
    public ResponseEntity<?> addFournisseur(
            @PathVariable Long adherentId,
            @RequestParam(required = false) Long fournisseurPhysiqueId,
            @RequestParam(required = false) Long fournisseurMoraleId, @RequestBody RelAdherFournReq req, HttpServletRequest http) {

        rolesFournService.addFournisseurToAdherant(adherentId, fournisseurPhysiqueId, fournisseurMoraleId, req,http);
        return ResponseEntity.ok("Fournisseur added to adherent successfully.");
    }


    @GetMapping("/acheteurs/{adherentId}")
    public List<RelationAdherentAcheteur> getAcheteursByAdherantId(@PathVariable("adherentId") Long adherentId, HttpServletRequest request) {
        String token=(String) request.getAttribute("JWT_TOKEN");
        return rolesService.getAllAcheteursByAdherantId(adherentId,token);
    }


    @GetMapping("/fournisseurs-by-adher/{adherentId}")
    public List<RelationAdherentFournisseur> getFournisseursByAdherantId(@PathVariable("adherentId") Long adherentId, HttpServletRequest request) {
        String token=(String) request.getAttribute("JWT_TOKEN");
        return rolesFournService.getAllFournisseursByAdherantId(adherentId,token);
    }
    @PostMapping("/modifier-relations")
    public ResponseEntity<?> updateRelationAdherentAcheteur(@RequestBody RelationAdherentAcheteur relation) {
        rolesService.updateRelationAdherentAcheteur(relation);
        return ResponseEntity.ok("Relation updated successfully.");
    }
    @PostMapping("/modifier-relations-fournisseurs")
    public ResponseEntity<?> updateRelationAdherentFournisseur(@RequestBody RelationAdherentFournisseur relation) {
        rolesFournService.updateRelationAdherentFournisseur(relation);
        return ResponseEntity.ok("Relation updated successfully.");
    }
    @GetMapping("/per-acheteur/{AcheteurId}")
    public ResponseEntity<?> getAcheteurById(@PathVariable("AcheteurId") Long AcheteurId) {
        return ResponseEntity.ok(rolesService.findPersonneAcheteurById(AcheteurId));
    }
    @GetMapping("/per-fournisseur/{fournisseurId}")
    public ResponseEntity<?> getPerFournisseurById(@PathVariable("fournisseurId") Long fournisseurId) {
        return ResponseEntity.ok(rolesFournService.findPersonneFournisseurById(fournisseurId));
    }

    @GetMapping("/dashboard/top-adherents")
    public List<TopAdherentDTO> getTopAdherents() {
        return rolesService.getTopAdherents();
    }

    @GetMapping("/dashboard/count-roles")
    public Map<String,Long> getCountRoles() {
        return rolesService.getCountRoles();
    }


}
