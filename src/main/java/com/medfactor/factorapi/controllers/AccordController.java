package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.Accord;
import com.medfactor.factorapi.service.AccordService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/accord")
public class AccordController {
    @Autowired
    private AccordService accordService;

    @PostMapping("/create-accord")
    public Accord createAccord(@RequestBody Accord accord, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getDetails());
        accord.setSysAdrIp((String) http.getAttribute("clientIp"));
        System.out.println("clientIp: "+http.getAttribute("clientIp"));
        accord.setSysUser(auth.getName());
        accord.setSysUserId((Long) http.getAttribute("userId"));
        accord.setSysDate(new Date());
        accord.setSysAction("CREATE");
        return accordService.createAccord(accord);
    }

    @PostMapping("/update-accord/{id}")
    public Accord updateAccord(@PathVariable("id") Long id, @RequestBody Accord accord, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getDetails());
        accord.setSysAdrIp((String) http.getAttribute("clientIp"));
        System.out.println("clientIp: "+http.getAttribute("clientIp"));
        accord.setSysUser(auth.getName());
        accord.setSysUserId((Long) http.getAttribute("userId"));
        accord.setSysDate(new Date());
        accord.setSysAction("UPDATE");
        return accordService.updateAccord(id, accord);
    }
    @GetMapping("/get-accord/{id}")
    public Accord getAccordById(@PathVariable("id") Long id) {
        return accordService.getAccordById(id);
    }
    @GetMapping("/get-accord-by-factor-ref/{ref}")
    public Accord getAccordByAdherRef(@PathVariable("ref") String ref) {
        return accordService.getAccordByFactorRef(ref);
    }
    @GetMapping("/all-accords")
    public List<Accord> getAllAccords() {
        return accordService.getAllAccords();
    }
    @GetMapping("/all-accords-by-enquete/{enqueteId}")
    public List<Accord> getAllAccordsByEnquete(@PathVariable("enqueteId") Long enqueteId) {
        return accordService.getAllAccordsByEnquete(enqueteId);
    }
    @DeleteMapping("/delete-accord/{id}")
    public boolean deleteAccord(@PathVariable("id") Long id) {
        return accordService.deleteAccord(id);
    }
}
