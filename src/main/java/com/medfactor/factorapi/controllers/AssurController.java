package com.medfactor.factorapi.controllers;


import com.medfactor.factorapi.entities.Assur;
import com.medfactor.factorapi.service.AssurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/assur")
public class AssurController {

    @Autowired
    private AssurService assurService;

    @GetMapping("/all")
    public List<Assur> getAllAssurs() {
        return assurService.getAllAssurs();
    }

    @GetMapping("/{id}")
    public Assur getAssurById(Long id) {
        return assurService.getAssurById(id);
    }


}
