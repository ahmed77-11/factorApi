package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.Enquete;
import com.medfactor.factorapi.service.EnqueteService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/enquete")
public class EnqueteController {

    @Autowired
    private EnqueteService enqueteService;

    // Define endpoints for creating, updating, retrieving, and deleting enquete
    @PostMapping("/ajouter-enquete")
    public Enquete createEnquete(@RequestBody Enquete enquete, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getDetails());
        enquete.setSysAdrIp((String) http.getAttribute("clientIp"));
        System.out.println("clientIp: "+http.getAttribute("clientIp"));
        enquete.setSysUser(auth.getName());
        enquete.setSysUserId((Long) http.getAttribute("userId"));
        enquete.setSysDate(new Date());
        enquete.setSysAction("CREATE");
        return enqueteService.createEnquete(enquete);
    }

    @PostMapping("/modifier-enquete/{id}")
    public Enquete updateEnquete(@PathVariable("id") Long id, @RequestBody Enquete enquete, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getDetails());
        enquete.setSysAdrIp((String) http.getAttribute("clientIp"));
        System.out.println("clientIp: "+http.getAttribute("clientIp"));
        enquete.setSysUser(auth.getName());
        enquete.setSysUserId((Long) http.getAttribute("userId"));
        enquete.setSysDate(new Date());
        enquete.setSysAction("UPDATE");
        return enqueteService.updateEnquete(id, enquete);
    }
    @GetMapping("/get-enquete/{id}")
    public Enquete getEnqueteById(@PathVariable("id") Long id) {
        return enqueteService.getEnqueteById(id);
    }
    @GetMapping("/get-enquete-by-adher-ref/{ref}")
    public Enquete getEnqueteByAdherRef(@PathVariable("ref") String ref) {
        return enqueteService.getEnqueteByAdherRef(ref);
    }

    @GetMapping("/all-enquetes")
    public List<Enquete> getAllEnquetes() {
        return enqueteService.getAllEnquetes();
    }
    @GetMapping("/all-active-enquetes")
    public List<Enquete> getAllActiveEnquetes() {
        return enqueteService.getAllActiveEnquetes();
    }
    @DeleteMapping("/delete-enquete/{id}")
    public boolean deleteEnquete(@PathVariable("id") Long id) {
        return enqueteService.deleteEnquete(id);
    }



}
