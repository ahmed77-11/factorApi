package com.medfactor.factorapi.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "xSituationJudiciaire")
public class SituationJudiciaire {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xSituationJudiciaireId", nullable = true)
    private Long id;

    @Column(name = "xSituationJudiciaireCode", nullable = true)
    private String code;

    @Column(name = "xSituationJudiciaireDsg", nullable = true)
    private String dsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}