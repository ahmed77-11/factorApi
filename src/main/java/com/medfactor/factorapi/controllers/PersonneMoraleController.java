package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.service.PersonneMoraleService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;


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
}
