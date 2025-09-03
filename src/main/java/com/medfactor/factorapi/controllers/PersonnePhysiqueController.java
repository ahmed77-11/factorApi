package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.service.PersonnePhysiqueService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pp")
public class PersonnePhysiqueController {

    @Autowired
    private PersonnePhysiqueService service;

    @PostMapping("/add-pp")
    public ResponseEntity<PersonnePhysique> createPersonne(@RequestBody PersonnePhysique personne, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        personne.setSysUser(auth.getName());
        personne.setSysUserId((Long) request.getAttribute("userId"));
        personne.setSysAdrIp(request.getAttribute("clientIp").toString());
        return ResponseEntity.ok(service.createPersonne(personne));
    }

    @GetMapping("/all")
    public List<PersonnePhysique> getPersonne() {
        return service.getAllPersonnes();
    }

    @GetMapping("/get-pp/{id}")
    public PersonnePhysique getPersonneById(@PathVariable Long id) {
        return service.getPersonneById(id).orElseThrow(() -> new RuntimeException("Personne non trouvée"));
    }
    @GetMapping("/get-pp-achet/{achetCode}")
    public PersonnePhysique getPersonnePhysiqueByAchetCode(@PathVariable("achetCode") String achetCode) {
        System.out.println("Achet Code: " + achetCode);
        if (achetCode == null || achetCode.isEmpty()) {
            throw new RuntimeException("Achet code ne peut pas être vide");
        }
        return service.getPersonneByFactorAchetCode(achetCode).orElseThrow(() -> new RuntimeException("Personne phyqique non trouvée"));
    }
    @PostMapping("/update-pp/{id}")
    public PersonnePhysique updatePersonne(@PathVariable Long id, @RequestBody PersonnePhysique personne, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        personne.setSysUser(auth.getName());
        personne.setSysUserId((Long) request.getAttribute("userId"));
        personne.setSysAdrIp(request.getAttribute("clientIp").toString());
        return service.updatePersonne(id, personne);
    }

    @DeleteMapping("/delete-pp/{id}")
    public void deletePersonne(@PathVariable Long id) {
        service.deletePersonne(id);
    }
    @PostMapping("/ajouter-roles/{id}")
    public ResponseEntity<?> ajouterRoles(@PathVariable("id") Long id, @RequestBody List<String> roles) {
        List<IndviduRole> enumRoles = roles.stream()
                .map(String::toUpperCase)
                .map(roleStr -> {
                    try {
                        return IndviduRole.valueOf(roleStr);
                    } catch (IllegalArgumentException ex) {
                        throw new RuntimeException("Invalid role: " + roleStr);
                    }
                })
                .toList();

        return ResponseEntity.ok(service.ajouterRoles(id, enumRoles));
    }
    @PostMapping("/ajouter-role-adherant")
    public ResponseEntity<?> ajouterRoleAdherant(@RequestBody Long id) {
        return ResponseEntity.ok(service.ajouterRole(id, IndviduRole.ADHERENT));
    }

    @GetMapping("/all-by-adher-sans-accord")
    public List<PersonnePhysique> getAllPPsByAdherAccord() {
        return service.getAllPPsByAdherAccord(false);
    }
    @GetMapping("/all-by-achet-sans-accord")
    public List<PersonnePhysique> getAllPPsByAchetAccord() {
        return service.getAllPPsByAchetAccord(false);
    }




}
