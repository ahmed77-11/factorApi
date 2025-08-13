package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Enquete;
import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.repos.EnqueteRepository;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.PersonnePhysiqueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnqueteServiceImpl implements EnqueteService {

    @Autowired
    private EnqueteRepository enqueteRepository;
    @Autowired
    private PersonnePhysiqueRepository physiqueRepository;
    @Autowired
    private PersonneMoraleRepository repository;
    @Override
    public Enquete createEnquete(Enquete enquete) {
        if(enquete.getPmAdher()!=null && enquete.getPmAdher().getId() != null){
            PersonneMorale pm = repository.findByIdAndArchiver(enquete.getPmAdher().getId(), false)
                    .orElseThrow(() -> new RuntimeException("Personne Morale not found with id: " + enquete.getPmAdher().getId()));
            pm.setPmAdherEnqueteEnCours(true);
            pm=repository.save(pm);
            enquete.setPmAdher(pm);


        }
        if(enquete.getPmAchet()!=null && enquete.getPmAchet().getId() != null){
            PersonneMorale pm = repository.findByIdAndArchiver(enquete.getPmAchet().getId(), false)
                    .orElseThrow(() -> new RuntimeException("Personne Morale not found with id: " + enquete.getPmAchet().getId()));
            pm.setPmAchetEnqueteEnCours(true);
            pm=repository.save(pm);
            enquete.setPmAchet(pm);
        }
        if(enquete.getPpAdher()!=null && enquete.getPpAdher().getId() != null){
            PersonnePhysique pp = physiqueRepository.findByIdAndArchiver(enquete.getPpAdher().getId(), false)
                    .orElseThrow(() -> new RuntimeException("Personne Physique not found with id: " + enquete.getPpAdher().getId()));
            pp.setPpAdherEnqueteEnCours(true);
            pp=physiqueRepository.save(pp);
            enquete.setPpAdher(pp);

        }
        if(enquete.getPpAchet()!=null && enquete.getPpAchet().getId() != null){
            PersonnePhysique pp = physiqueRepository.findByIdAndArchiver(enquete.getPpAchet().getId(), false)
                    .orElseThrow(() -> new RuntimeException("Personne Physique not found with id: " + enquete.getPpAchet().getId()));
            pp.setPpAchetEnqueteEnCours(true);
            pp=physiqueRepository.save(pp);
            enquete.setPpAchet(pp);
        }
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
        return enqueteRepository.findAllByArchiver(false);
    }

    @Override
    public List<Enquete> getAllActiveEnquetes() {
        return enqueteRepository.findAllByIsEnqueteActiveAndArchiver(true, false);
    }

    @Override
    public boolean deleteEnquete(Long id) {
        Enquete enquete = enqueteRepository.findByIdAndArchiver(id, false).orElse(null);

        if (enquete != null) {
            if(enquete.getPmAdher()!=null && enquete.getPmAdher().getId() != null){
                PersonneMorale pm = repository.findByIdAndArchiver(enquete.getPmAdher().getId(), false)
                        .orElseThrow(() -> new RuntimeException("Personne Morale not found with id: " + enquete.getPmAdher().getId()));
                pm.setPmAdherEnqueteEnCours(false);
                repository.save(pm);
            }
            if(enquete.getPmAchet()!=null && enquete.getPmAchet().getId() != null){
                PersonneMorale pm = repository.findByIdAndArchiver(enquete.getPmAchet().getId(), false)
                        .orElseThrow(() -> new RuntimeException("Personne Morale not found with id: " + enquete.getPmAchet().getId()));
                pm.setPmAchetEnqueteEnCours(false);
                repository.save(pm);
            }
            if(enquete.getPpAdher()!=null && enquete.getPpAdher().getId() != null){
                PersonnePhysique pp = physiqueRepository.findByIdAndArchiver(enquete.getPpAdher().getId(), false)
                        .orElseThrow(() -> new RuntimeException("Personne Physique not found with id: " + enquete.getPpAdher().getId()));
                pp.setPpAdherEnqueteEnCours(false);
                physiqueRepository.save(pp);
            }
            if(enquete.getPpAchet()!=null && enquete.getPpAchet().getId() != null){
                PersonnePhysique pp = physiqueRepository.findByIdAndArchiver(enquete.getPpAchet().getId(), false)
                        .orElseThrow(() -> new RuntimeException("Personne Physique not found with id: " + enquete.getPpAchet().getId()));
                pp.setPpAchetEnqueteEnCours(false);
                physiqueRepository.save(pp);
            }
            enquete.setArchiver(true);
            enqueteRepository.save(enquete);
            return true;
        }
        return false;
    }
}
