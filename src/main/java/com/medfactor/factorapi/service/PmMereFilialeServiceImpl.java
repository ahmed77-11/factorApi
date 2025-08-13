package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PmMereFiliale;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.PmMereFilialeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PmMereFilialeServiceImpl implements PmMereFilialeService {

    @Autowired
    private PmMereFilialeRepository repository;

    @Autowired
    private PersonneMoraleRepository pmRepository;
    @Override
    public PmMereFiliale createPmMereFiliale(PmMereFiliale pmMereFiliale) {
        if (pmMereFiliale == null) {
            throw new IllegalArgumentException("la relation Mere Filiale ne peut pas être nulle");
        }
        if(pmRepository.findByIdAndArchiver(pmMereFiliale.getMere().getId(), false).isEmpty()) {
            throw new IllegalArgumentException("Mere non trouvé");
        }
        if(pmRepository.findByIdAndArchiver(pmMereFiliale.getFiliale().getId(), false).isEmpty()) {
            throw new IllegalArgumentException("Filiale non trouvé");
        }
        return repository.save(pmMereFiliale);
    }

    @Override
    public PmMereFiliale updatePmMereFiliale(PmMereFiliale pmMereFiliale) {
        return repository.save(pmMereFiliale);
    }

    @Override
    public PmMereFiliale getPmMereFilialeById(Long id) {
        return repository.findByIdAndArchvier(id, false)
                .orElseThrow(() -> new IllegalArgumentException("la relation Mere Filiale n'existe pas "));
    }

    @Override
    public List<PmMereFiliale> getAllPmMereFilialeByMere(Long mereId) {
        if(mereId == null) {
            throw new IllegalArgumentException("Mere ID ne peut pas être nul");
        }
        PersonneMorale mere = pmRepository.findByIdAndArchiver(mereId, false)
                .orElseThrow(() -> new IllegalArgumentException("Mere non trouvée"));
        if(pmRepository.findByIdAndArchiver(mere.getId(), false).isEmpty()) {
            throw new IllegalArgumentException("Mere non trouvée ");
        }
        List <PmMereFiliale> list= repository.findAllByMereAndArchvier(mere, false);
        System.out.println("List of PmMereFiliale for mere ID " + mereId + ": " + list.size() + " entries found.");

        return list.isEmpty() ? List.of() : list;
    }

    @Override
    public void deletePmMereFiliale(Long id) {
        if(id == null) {
            throw new IllegalArgumentException("Id cannot be null");
        }
        PmMereFiliale pmMereFiliale = repository.findByIdAndArchvier(id, false)
                .orElseThrow(() -> new IllegalArgumentException("PmMereFiliale n'existe"));
        pmMereFiliale.setArchvier(true);
        repository.save(pmMereFiliale);

    }
}
