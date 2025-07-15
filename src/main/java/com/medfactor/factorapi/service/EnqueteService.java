package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Enquete;

import java.util.List;

public interface EnqueteService {

    Enquete createEnquete(Enquete enquete);
    Enquete updateEnquete(Long id, Enquete enquete);
    Enquete getEnqueteById(Long id);
    Enquete getEnqueteByAdherRef(String ref);

    List<Enquete> getAllEnquetes();
    boolean deleteEnquete(Long id);

}
