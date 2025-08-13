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
        Enquete enquete= enqueteRepository.findByIdAndArchiver(accord.getEnquete().getId(), false).orElse(null);
        if (enquete == null) {
            throw new RuntimeException("Enquete not found with id: " + accord.getEnquete().getId());
        }
        enquete.setIsEnqueteActive(false);

        if(enquete.getPmAdher()!=null && !enquete.getPmAdher().isArchiver()) {
            enquete.getPmAdher().setPmAdherEnqueteEnCours(false);
            enquete.getPmAdher().setPmAdherBoolAccord(true);
            accord.setPmFactorAdher("pm"+"adher"+enquete.getPmAdher().getId());
            enquete.getPmAdher().setFactorAdherCode(
                    "pm"+"adher"+enquete.getPmAdher().getId()
            );
        } else if (enquete.getPpAdher() != null && !enquete.getPpAdher().isArchiver()) {
            enquete.getPpAdher().setPpAdherEnqueteEnCours(false);
            enquete.getPpAdher().setPpAdherBoolAccord(true);
            accord.setPpFactorAdher("pp"+"adher"+enquete.getPpAdher());
            enquete.getPpAdher().setFactorAdherCode(
                    "pp"+"adher"+enquete.getPpAdher().getId()
            );
        }else if(enquete.getPpAchet() != null && !enquete.getPpAchet().isArchiver()){
            enquete.getPpAchet().setPpAchetEnqueteEnCours(false);
            enquete.getPpAchet().setPpAchetBoolAccord(true);
            accord.setPpFactorAchet("pp"+"achet"+enquete.getPpAchet());
            enquete.getPpAchet().setFactorAchetCode(
                    "pp"+"achet"+enquete.getPpAchet().getId()
            );
        } else if(enquete.getPmAchet() != null && !enquete.getPmAchet().isArchiver()) {
            enquete.getPmAchet().setPmAchetEnqueteEnCours(false);
            enquete.getPmAchet().setPmAchetBoolAccord(true);
            accord.setPmFactorAchet("pm"+"achet"+enquete.getPmAchet());
            enquete.getPmAchet().setFactorAchetCode(
                    "pm"+"achet"+enquete.getPmAchet().getId()
            );
        }
        else {
            throw new RuntimeException("No valid adherent found for the enquete with id: " + enquete.getId());
        }
        enqueteRepository.save(enquete);
        accord.setEnquete(enquete);
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
