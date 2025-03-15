package com.medfactor.factorapi.controllers;

import com.medfactor.factorapi.entities.TypePieceId;
import com.medfactor.factorapi.service.TypePieceIdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/type-piece-id")
public class TypePieceIdController {
    @Autowired
    private TypePieceIdService service;

    @GetMapping("/all")
    public List<TypePieceId> getAllPieceId(){
        return service.getAllPieceId();
    }

    @PostMapping("/add")
    public TypePieceId addPieceId(@RequestBody TypePieceId pieceId){
        return service.addPieceId(pieceId);
    }
}
