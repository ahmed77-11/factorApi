package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.Accord;
import com.medfactor.factorapi.entities.Enquete;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AccordRepository extends JpaRepository<Accord, Long> {

    Optional<Accord> findByIdAndArchiver(Long id, Boolean archiver);
    Optional<Accord> findByFactorRefAndArchiver(String factorRef, Boolean archiver);

    List<Accord> findAllByEnqueteAndArchiver( Enquete enquete, Boolean archiver);

    List<Accord> findAllByArchiver(Boolean archiver);
}
