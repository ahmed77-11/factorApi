package com.medfactor.factorapi.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TopAdherentDTO {
    private Long adherentId;
    private String adherentName;
    private Long totalAcheteurs;
}
