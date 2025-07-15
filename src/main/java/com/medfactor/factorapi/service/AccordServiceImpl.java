package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Accord;
import com.medfactor.factorapi.entities.Enquete;
import com.medfactor.factorapi.repos.AccordRepository;
import com.medfactor.factorapi.repos.EnqueteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccordServiceImpl implements AccordService{

    @Autowired
    private AccordRepository accordRepository;

    @Autowired
    private EnqueteRepository enqueteRepository;
    @Override
    public Accord createAccord(Accord accord) {
        return accordRepository.save(accord);
    }

    @Override
    public Accord updateAccord(Long id, Accord accord) {
        accord.setId(id);
        return accordRepository.save(accord);
    }

    @Override
    public Accord getAccordById(Long id) {
        return accordRepository.findByIdAndArchiver(id, false).orElse(null);
    }

    @Override
    public Accord getAccordByFactorRef(String factorRef) {
        return accordRepository.findByFactorRefAndArchiver(factorRef, false).orElse(null);
    }

    @Override
    public List<Accord> getAllAccords() {
        return accordRepository.findAllByArchiver(false);
    }

    @Override
    public List<Accord> getAllAccordsByEnquete(Long enqueteId) {
        Enquete enquete = enqueteRepository.findByIdAndArchiver(enqueteId, false).orElse(null);
        if (enquete == null) {
            return List.of(); // Return an empty list if the enquete is not found
        }
        return accordRepository.findAllByEnqueteAndArchiver(enquete, false);
    }

    @Override
    public boolean deleteAccord(Long id) {
    Accord accord = accordRepository.findByIdAndArchiver(id, false).orElse(null);
    if (accord != null) {
        accord.setArchiver(true);
        accordRepository.save(accord);
        return true;
    }
        return false;
    }
}
