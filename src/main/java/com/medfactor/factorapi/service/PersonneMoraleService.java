package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.enums.IndviduRole;

import java.util.List;
import java.util.Optional;

public interface PersonneMoraleService {

    PersonneMorale createPM(PersonneMorale pm);
    List<PersonneMorale> getAllPM();
    Optional<PersonneMorale> getPMById(Long id);

    Optional<PersonneMorale> getPMByNumPieceIdentite(String numPieceIdentite);

    PersonneMorale updatePM(Long id, PersonneMorale pm);

    void deletePM(Long id);

    PersonneMorale ajouterRole(Long id, IndviduRole role);
    PersonneMorale ajouterRoles(Long id, List<IndviduRole> roles);

    List<PersonneMorale> getAllPMsByAdherAccord(boolean pmAdherBoolAccord);
    List<PersonneMorale> getAllPMsByAchetAccord(boolean pmAchetBoolAccord);

}
