package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.PersonneMorale;
import com.medfactor.factorapi.entities.PmMereFiliale;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PmMereFilialeRepository extends JpaRepository<PmMereFiliale, Long> {
    List<PmMereFiliale> findAllByMereAndArchvier(PersonneMorale mere, boolean archvier);
    List<PmMereFiliale> findAllByFilialeAndArchvier(PersonneMorale filiale, boolean archvier);
    List<PmMereFiliale> findAllByArchvier(boolean archvier);

    Optional<PmMereFiliale> findByIdAndArchvier(Long id, boolean archvier);

    

}
