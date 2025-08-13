package com.medfactor.factorapi.repos;

import com.medfactor.factorapi.entities.BlackList;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BlackListRepositroy extends JpaRepository<BlackList,Long> {
    Optional<BlackList> findByIdAndArchvier(Long id, boolean archvier);
    List<BlackList> findAllByArchvier(boolean archvier);

}
