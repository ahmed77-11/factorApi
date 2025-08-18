package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PersonnePhysique;
import com.medfactor.factorapi.entities.TypePieceId;
import com.medfactor.factorapi.enums.IndviduRole;
import com.medfactor.factorapi.repos.PersonneMoraleRepository;
import com.medfactor.factorapi.repos.TypePieceIdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
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
        return repository.findAllByArchiver(false);
    }

    @Override
    public Optional<PersonneMorale> getPMById(Long id) {
        return repository.findByIdAndArchiver(id,false);
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
            personneMorale.setMatriculeFiscal(pm.getMatriculeFiscal());
            if (pm.getIndviduRoles() != null) {
                pm.getIndviduRoles().forEach(role -> {
                   if(!personneMorale.getIndviduRoles().contains(role)) {
                       personneMorale.getIndviduRoles().add(role);
                   }
                   if(role.equals(IndviduRole.ACHETEUR)) {
                       personneMorale.setFactorAchetCode(
                               "ACHETEUR-PM" + personneMorale.getNumeroPieceIdentite() + "-" + System.currentTimeMillis()
                       );
                   }
                     if(role.equals(IndviduRole.FOURNISSEUR)) {
                          personneMorale.setFactorFournCode(
                                 "FOURNISSEUR-PM" + personneMorale.getNumeroPieceIdentite() + "-" + System.currentTimeMillis()
                          );
                     }
                });
            }

            return repository.save(personneMorale);
        }).orElseThrow(() -> new RuntimeException("Personne morale non trouvée"));
    }

    @Override
    public void deletePM(Long id) {
       PersonneMorale p= repository.findById(id).orElseThrow(()->new RuntimeException("Personne morale non trouvée"));
       p.setArchiver(true);
       repository.save(p);
    }

    @Override
    public PersonneMorale ajouterRole(Long id, IndviduRole role) {
        PersonneMorale p= repository.findById(id).orElseThrow(()->new RuntimeException("Personne morale non trouvée"));
        p.getIndviduRoles().add(role);
        return repository.save(p);
    }

    @Override
    public PersonneMorale ajouterRoles(Long id, List<IndviduRole> roles) {
        return repository.findById(id).map(personne -> {
            personne.getIndviduRoles().addAll(roles);
            if(roles.contains(IndviduRole.ACHETEUR)){
                personne.setFactorAchetCode(
                        "ACHETEUR-PM" + personne.getNumeroPieceIdentite() + "-" + System.currentTimeMillis()
                );
            }
            if(roles.contains(IndviduRole.FOURNISSEUR)){
                personne.setFactorFournCode(
                        "FOURNISSEUR-PM" + personne.getNumeroPieceIdentite() + "-" + System.currentTimeMillis()
                );
            }
            return repository.save(personne);
        }).orElseThrow(() -> new RuntimeException("Personne non trouvée"));
    }

    @Override
    public List<PersonneMorale> getAllPMsByAdherAccord(boolean pmAdherBoolAccord) {
        return repository.findAllByPmAdherBoolAccordAndPmAdherEnqueteEnCoursAndArchiver(pmAdherBoolAccord, false,false);
    }

    @Override
    public List<PersonneMorale> getAllPMsByAchetAccord(boolean pmAchetBoolAccord) {
        return repository.findAllByPmAchetBoolAccordAndPmAchetEnqueteEnCoursAndArchiver(pmAchetBoolAccord, false,false);
    }


}
