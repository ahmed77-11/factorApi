package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.service.PersonnePhysiqueService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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


}
