package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.service.PersonneMoraleService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

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
}
