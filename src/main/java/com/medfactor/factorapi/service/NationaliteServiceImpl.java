package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Nationalite;
import com.medfactor.factorapi.repos.NationaliteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NationaliteServiceImpl implements NationaliteService{
    @Autowired
    private NationaliteRepository repository;
    @Override
    public List<Nationalite> getAllNationalites() {
        return repository.findAll();
    }

    @Override
    public Nationalite getNationaliteById(Long id) {
        return repository.findById(id).orElse(null);
    }
}
