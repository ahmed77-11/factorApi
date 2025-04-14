package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.enums.IndviduRole;

import java.util.List;
import java.util.Optional;

public interface PersonnePhysiqueService {
    PersonnePhysique createPersonne(PersonnePhysique personne);

    List<PersonnePhysique> getAllPersonnes();

    Optional<PersonnePhysique> getPersonneById(Long id);

    Optional<PersonnePhysique> getPersonneByNumPieceIdentite(String numPieceIdentite);

    PersonnePhysique updatePersonne(Long id, PersonnePhysique personneDetails);

    void deletePersonne(Long id);
    PersonnePhysique ajouterRole(Long id, IndviduRole role);
    PersonnePhysique ajouterRoles(Long id, List<IndviduRole> roles);


}
