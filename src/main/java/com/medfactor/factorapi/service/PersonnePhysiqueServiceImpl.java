package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.repos.PersonnePhysiqueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

@Service
public class PersonnePhysiqueServiceImpl implements PersonnePhysiqueService{
    @Autowired
    private PersonnePhysiqueRepository repository;
    @Override
    public PersonnePhysique createPersonne(PersonnePhysique personne) {
        return repository.save(personne);
    }

    @Override
    public List<PersonnePhysique> getAllPersonnes() {
        return repository.findAllByArchiver(false);
    }

    @Override
    public Optional<PersonnePhysique> getPersonneById(Long id) {
        return repository.findByIdAndArchiver(id,false);
    }

    @Override
    public Optional<PersonnePhysique> getPersonneByNumPieceIdentite(String numPieceIdentite) {
        return Optional.empty();
    }

    @Override
    public PersonnePhysique updatePersonne(Long id, PersonnePhysique personneDetails) {
        return repository.findById(id).map(personne -> {
            personne.setNumeroPieceIdentite(personneDetails.getNumeroPieceIdentite());
            personne.setNom(personneDetails.getNom());
            personne.setPrenom(personneDetails.getPrenom());
            personne.setAdresse(personneDetails.getAdresse());
            personne.setEmail(personneDetails.getEmail());
            personne.setTelMobileNo(personneDetails.getTelMobileNo());
            personne.setNaissanceDate(personneDetails.getNaissanceDate());
            if (personneDetails.getIndviduRoles() != null) {

                personneDetails.getIndviduRoles().forEach(role -> {
                    if(!personne.getIndviduRoles().contains(role)) {
                        personne.getIndviduRoles().add(role);
                    }
                });
            }
            //personne.setNationalite(personneDetails.getNationalite());
            return repository.save(personne);
        }).orElseThrow(() -> new RuntimeException("Personne non trouvée"));
    }

    @Override
    public void deletePersonne(Long id) {
        PersonnePhysique p= repository.findById(id).orElseThrow(()->new RuntimeException("Personne non trouvée"));
        p.setArchiver(true);
        repository.save(p);
    }

    @Override
    public PersonnePhysique ajouterRole(Long id, IndviduRole role) {
        return repository.findById(id).map(personne -> {
            personne.getIndviduRoles().add(role);
            return repository.save(personne);
        }).orElseThrow(() -> new RuntimeException("Personne non trouvée"));
    }

    @Override
    public PersonnePhysique ajouterRoles(Long id, List<IndviduRole> roles) {
        return repository.findById(id).map(personne -> {
            personne.getIndviduRoles().addAll(roles);
            return repository.save(personne);
        }).orElseThrow(() -> new RuntimeException("Personne non trouvée"));
    }
}
