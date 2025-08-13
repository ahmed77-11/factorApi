package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Assur;

import java.util.List;

public interface AssurService {
    List<Assur> getAllAssurs();

    Assur getAssurById(Long id);
}
