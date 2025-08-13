package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Assur;
import com.medfactor.factorapi.repos.AssurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssurServiceImpl implements AssurService{

    @Autowired
    private AssurRepository assurRepository;
    @Override
    public List<Assur> getAllAssurs() {
        return assurRepository.findAll();
    }

    @Override
    public Assur getAssurById(Long id) {
        return assurRepository.findById(id).orElse(null);
    }
}
