package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.Nationalite;
import com.medfactor.factorapi.service.NationaliteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/nationalite")
public class NationaliteController {
    @Autowired
    private NationaliteService nationaliteService;

    @GetMapping("/all")
    public List<Nationalite> getAllNationalites() {
        return nationaliteService.getAllNationalites();
    }
    @GetMapping("/{id}")
    public Nationalite getNationaliteById(@PathVariable("id") Long id) {
        return nationaliteService.getNationaliteById(id);
    }
}
