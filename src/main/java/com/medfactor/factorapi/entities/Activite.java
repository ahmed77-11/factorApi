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
@Table(name = "xActivite")
public class Activite {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xActiviteId", nullable = true)
    private Long id;

    @Column(name = "xActiviteCode", nullable = true)
    private String code;
    @Column(name = "xActiviteDsg", nullable = true)
    private String dsg;
    private Long sysUserId;
    private String sysUser;
    private String sysAdrIp;
    private Date sysDate;
}
