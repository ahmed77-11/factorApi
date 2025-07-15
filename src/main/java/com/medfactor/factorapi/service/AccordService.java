package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.Accord;
import com.medfactor.factorapi.entities.Enquete;

import java.util.List;

public interface AccordService {
    Accord createAccord(Accord accord);
    Accord updateAccord(Long id, Accord accord);
    Accord getAccordById(Long id);
    Accord getAccordByFactorRef(String adherRef);

    List<Accord> getAllAccords();
    List<Accord> getAllAccordsByEnquete(Long enqueteId);
    boolean deleteAccord(Long id);
}
