package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.Enquete;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface EnqueteRepository extends JpaRepository<Enquete,Long> {

    Optional<Enquete> findByAdherRefAndArchiver(String adherRef, Boolean archiver);
    Optional<Enquete> findByIdAndArchiver(Long id, Boolean archiver);

    List<Enquete> findAllByArchiver(Boolean archiver);

}
