package com.bootdo.oaForm.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class OaForm implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private Long id;

    /**
     * 
     */
    private String wlastname;

    /**
     * 
     */
    private String wfirstname;

    /**
     * 
     */
    private Long sin;

    /**
     * 
     */
    private String telephone;

    /**
     * 
     */
    private String waddress;

    /**
     * 
     */
    private String wcity;

    /**
     * 
     */
    private String wprovince;

    /**
     * 
     */
    private String wpostal;

    /**
     * 
     */
    private String job;

    /**
     * 
     */
    private String birth;

    /**
     * 
     */
    private Long sex;

    /**
     * 
     */
    private Double monetlost;

    /**
     *
     */
    private String ename;

    /**
     * 
     */
    private String etelephone;

    /**
     * 
     */
    private String eaddress;

    /**
     * 
     */
    private String ecity;

    /**
     * 
     */
    private String eprovince;

    /**
     * 
     */
    private String epostal;

    /**
     * 
     */
    private Integer status;

    /**
     * 
     */
    private String remarks;

    /**
     * 
     */
    private String delFlag;

    private String doctor_name;

    private String doctor_address;

    private String doctor_city;

    private String doctor_province;

    private String doctor_code;

    private Long user_id;

    private Integer is_use;

    private Integer is_version;

    private Integer is_color;

    private Integer is_hearing;

    private Integer is_body;

    private Integer is_limb;

    private Integer is_strength;

}