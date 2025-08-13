package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.service.PersonneMoraleService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/api/pm")
public class PersonneMoraleController {

    @Autowired
    private PersonneMoraleService service;

    @PostMapping("/add-pm")
    public ResponseEntity<PersonneMorale> createPersonneMorale(@RequestBody PersonneMorale personneMorale, HttpServletRequest request ){
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            System.out.println(auth.getDetails());
            personneMorale.setSysAdrIp((String) request.getAttribute("clientIp"));
            System.out.println("clientIp: "+request.getAttribute("clientIp"));
            personneMorale.setSysUser(auth.getName());
            personneMorale.setSysUserId((Long) request.getAttribute("userId"));
        return ResponseEntity.ok(service.createPM(personneMorale));
    }

    @GetMapping("/all")
    public List<PersonneMorale> getPersonneMorale() {
        return service.getAllPM();
    }
    @GetMapping("/get-pm/{id}")
    public PersonneMorale getPersonneMoraleById(@PathVariable Long id) {
        return service.getPMById(id).orElseThrow(() -> new RuntimeException("Personne morale non trouvée"));
    }
    @PostMapping("/update-pm/{id}")
    public PersonneMorale updatePersonneMorale(@PathVariable Long id, @RequestBody PersonneMorale personneMorale, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        personneMorale.setSysUser(auth.getName());
        personneMorale.setSysUserId((Long) request.getAttribute("userId"));
        personneMorale.setSysAdrIp(request.getAttribute("clientIp").toString());
        return service.updatePM(id, personneMorale);
    }
    @DeleteMapping("/delete-pm/{id}")
    public void deletePersonneMorale(@PathVariable Long id) {
        service.deletePM(id);
    }


    @PostMapping("/ajouter-role-adherant")
    public ResponseEntity<?> ajouterRoleAdherant(@RequestBody Long id) {
        return ResponseEntity.ok(service.ajouterRole(id, IndviduRole.ADHERENT));
    }


    @PostMapping("/ajouter-role-gestionnaire/{id}")
    public ResponseEntity<?> ajouterRoleGestionnaire(@PathVariable("id") Long id) {
        System.out.println("Received roles: " );

        return ResponseEntity.ok("e");
    }
    @PostMapping("/ajouter-roles/{id}")
    public ResponseEntity<?> ajouterRoles(@PathVariable("id") Long id, @RequestBody List<String> roles) {
        System.out.println("Received roles: ");
        System.out.println("Received roles: ");
        System.out.println("Received roles: ");
        System.out.println("Received roles: ");
        System.out.println("Received roles: ");
        System.out.println("Received roles: ");

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

    @GetMapping("/all-by-adher-sans-accord")
    public List<PersonneMorale> getAllPMsByAdherAccord() {
        return service.getAllPMsByAdherAccord(false);
    }
    @GetMapping("/all-by-achet-sans-accord")
    public List<PersonneMorale> getAllPMsByAchetAccord() {
        return service.getAllPMsByAchetAccord(false);
    }

}
