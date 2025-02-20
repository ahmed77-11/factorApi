package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonnePhysique;

import java.util.List;
import java.util.Optional;

public interface PersonnePhysiqueService {
    PersonnePhysique createPersonne(PersonnePhysique personne);

    List<PersonnePhysique> getAllPersonnes();

    Optional<PersonnePhysique> getPersonneById(Long id);

    Optional<PersonnePhysique> getPersonneByNumPieceIdentite(String numPieceIdentite);

    PersonnePhysique updatePersonne(Long id, PersonnePhysique personneDetails);

    void deletePersonne(Long id);

}
