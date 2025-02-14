package com.medfactor.factorapi.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Groupe {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String codeInterne;
    private String codeBct;
    private String dsg;
    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;


}
