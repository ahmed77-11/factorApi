package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.PmMereFiliale;
import com.medfactor.factorapi.service.PmMereFilialeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pm-mere-filiale")
public class PmMereFilialeController {

    @Autowired
    private PmMereFilialeService service;


    @PostMapping("/add")
    public ResponseEntity<PmMereFiliale> createPmMereFiliale(@RequestBody PmMereFiliale pmMereFiliale, HttpServletRequest http) {
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        pmMereFiliale.setSysAdresseIp((String) http.getAttribute("clientIp"));
        pmMereFiliale.setSysUser(auth.getName());
        pmMereFiliale.setSysAction("CREATE");
        pmMereFiliale.setSysUserId((Long) http.getAttribute("userId"));
        return ResponseEntity.ok(service.createPmMereFiliale(pmMereFiliale));
    }


    @GetMapping("/all-filiale-by-mere/{id}")
    public List<PmMereFiliale> getAllPmMereFiliale(@PathVariable("id") Long id) {

        return service.getAllPmMereFilialeByMere(id); // Assuming you want all without filtering by mere
    }

    @GetMapping("/get-pm-mere-filiale/{id}")
    public PmMereFiliale getPmMereFilialeById(@PathVariable("id") Long id) {
        return service.getPmMereFilialeById(id);
    }



    @PostMapping("/update-pm-mere-filiale/{id}")
    public ResponseEntity<PmMereFiliale> updatePmMereFiliale(@PathVariable("id") Long id, @RequestBody PmMereFiliale pmMereFiliale, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        pmMereFiliale.setSysAdresseIp((String) http.getAttribute("clientIp"));
        pmMereFiliale.setSysUser(auth.getName());
        pmMereFiliale.setSysAction("UPDATE");
        pmMereFiliale.setSysUserId((Long) http.getAttribute("userId"));
        if(pmMereFiliale.getId() == null) {
            pmMereFiliale.setId(id); // Ensure the ID is set for update
        } else if (!pmMereFiliale.getId().equals(id)) {
            throw new IllegalArgumentException("ID dans le corps de la requête ne correspond pas à l'ID dans l'URL. Veuillez vérifier les données envoyées.");
        }
        return ResponseEntity.ok(service.updatePmMereFiliale(pmMereFiliale));
    }


    @DeleteMapping("/delete-pm-mere-filiale/{id}")
    public ResponseEntity<String> deletePmMereFiliale(@PathVariable("id") Long id) {
        service.deletePmMereFiliale(id);
        return ResponseEntity.ok( "Relation Mere-Filiale supprimée avec succès.");
    }


}
