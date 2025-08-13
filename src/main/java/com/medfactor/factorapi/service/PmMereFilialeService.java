package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.PmMereFiliale;

import java.util.List;

public interface PmMereFilialeService {
    PmMereFiliale createPmMereFiliale(PmMereFiliale pmMereFiliale);
    PmMereFiliale updatePmMereFiliale(PmMereFiliale pmMereFiliale);
    PmMereFiliale getPmMereFilialeById(Long id);

    List<PmMereFiliale> getAllPmMereFilialeByMere(Long mereId);
    void deletePmMereFiliale(Long id);

}
