package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Enquete;
import com.medfactor.factorapi.repos.EnqueteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnqueteServiceImpl implements EnqueteService {

    @Autowired
    private EnqueteRepository enqueteRepository;
    @Override
    public Enquete createEnquete(Enquete enquete) {
        return enqueteRepository.save(enquete);
    }

    @Override
    public Enquete updateEnquete(Long id, Enquete enquete) {
        enquete.setId(id);
        return enqueteRepository.save(enquete);
    }

    @Override
    public Enquete getEnqueteById(Long id) {
        return enqueteRepository.findByIdAndArchiver(id,false).orElse(null);
    }

    @Override
    public Enquete getEnqueteByAdherRef(String ref) {
        return enqueteRepository.findByAdherRefAndArchiver(ref,false).orElse(null);
    }

    @Override
    public List<Enquete> getAllEnquetes() {
        return enqueteRepository.findAllByArchiver(true);
    }

    @Override
    public boolean deleteEnquete(Long id) {
        Enquete enquete = enqueteRepository.findByIdAndArchiver(id, false).orElse(null);
        if (enquete != null) {
            enquete.setArchiver(true);
            enqueteRepository.save(enquete);
            return true;
        }
        return false;
    }
}
