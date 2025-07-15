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
@Table(name = "xTypeAssiette")
public class TypeAssiette {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "xTypeAssietteId", nullable = true)
    private Long id;

    @Column(name = "xTypeAssietteCode", nullable = false)
    private String code;
    @Column(name = "xTypeAssietteDsg", nullable = false)
    private String dsg;

    private Long sysUserId;
    private String sysUser;
    private String sysAction;
    private String sysAdrIp;
    private Date sysDate;

}
