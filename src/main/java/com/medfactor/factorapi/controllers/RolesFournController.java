package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.service.RolesFournService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/relations-fournisseurs")
public class RolesFournController {

    @Autowired
    private RolesFournService rolesFournService;

}
