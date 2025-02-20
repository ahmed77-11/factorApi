package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;

import java.util.List;
import java.util.Optional;

public interface PersonneMoraleService {

    PersonneMorale createPM(PersonneMorale pm);
    List<PersonneMorale> getAllPM();
    Optional<PersonneMorale> getPMById(Long id);

    Optional<PersonneMorale> getPMByNumPieceIdentite(String numPieceIdentite);

    PersonneMorale updatePM(Long id, PersonneMorale pm);

    void deletePM(Long id);

}
