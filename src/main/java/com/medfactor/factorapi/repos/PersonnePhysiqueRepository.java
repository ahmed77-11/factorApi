package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.enums.IndviduRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonnePhysiqueRepository extends JpaRepository<PersonnePhysique, Long> {
    Optional<PersonnePhysique> findByNumeroPieceIdentite(String numeroPieceIdentite);
    List<PersonnePhysique> findAllByArchiver(boolean archiver);
    Optional<PersonnePhysique> findByIdAndArchiver(Long id, boolean archiver);
    List<PersonnePhysique> findByIndviduRolesContainsAndArchiver(IndviduRole role, boolean archiver);
    long countByIndviduRolesContaining(IndviduRole role);


    List<PersonnePhysique> findAllByPpAdherBoolAccordAndPpAdherEnqueteEnCoursAndArchiver(boolean ppAdherBoolAccord, boolean ppAdherEnqueteEnCours, boolean archiver);
    List<PersonnePhysique> findAllByPpAchetBoolAccordAndPpAchetEnqueteEnCoursAndArchiver(boolean ppAchetBoolAccord, boolean ppAchetEnqueteEnCours, boolean archiver);

}
