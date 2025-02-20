package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.TypePieceId;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.TypePieceIdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonneMoraleServiceImpl implements PersonneMoraleService{

    @Autowired
    private PersonneMoraleRepository repository;
    @Autowired
    private TypePieceIdRepository typePieceIdRepository;
    @Override
    public PersonneMorale createPM(PersonneMorale pm) {



        return repository.save(pm);
    }

    @Override
    public List<PersonneMorale> getAllPM() {
        return repository.findAll();
    }

    @Override
    public Optional<PersonneMorale> getPMById(Long id) {
        return repository.findById(id);
    }

    @Override
    public Optional<PersonneMorale> getPMByNumPieceIdentite(String numPieceIdentite) {
        return repository.findByNumeroPieceIdentite(numPieceIdentite);
    }

    @Override
    public PersonneMorale updatePM(Long id, PersonneMorale pm) {
        return repository.findById(id).map(personneMorale -> {
            personneMorale.setNumeroPieceIdentite(pm.getNumeroPieceIdentite());
            personneMorale.setRaisonSocial(pm.getRaisonSocial());
            personneMorale.setSigle(pm.getSigle());
            personneMorale.setAdresse(pm.getAdresse());
            personneMorale.setVille(pm.getVille());
            personneMorale.setEmail(pm.getEmail());
            personneMorale.setTelNo(pm.getTelNo());
            return repository.save(personneMorale);
        }).orElseThrow(() -> new RuntimeException("Personne morale non trouvée"));
    }

    @Override
    public void deletePM(Long id) {
    }
}
