package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Nationalite;

import java.util.List;

public interface NationaliteService {
    List<Nationalite> getAllNationalites();
    Nationalite getNationaliteById(Long id);
}
