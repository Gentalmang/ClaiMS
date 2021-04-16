package com.bootdo.oaForm.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;


/**
 * 通知通告
 *
 * @author Bowen SU
 * @email asgrrem98@gmail.com
 * @date 2 March 2021
 */
public class FormDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//编号
	private Long id;

	private String wLastName;

	private String wFirstName;

	private Long SIN;

	private Long telephone;

	private String wAddress;

	private String wCity;

	private String wProvince;

	private String wPostal;

	private String job;

	private Date birth;

	private String sex;

	private Double moneyLost;

	private String eName;

	private Long eTelephone;

	private String eAddress;

	private String eCity;

	private String eProvince;

	private String ePostal;

	private Integer vision;

	private Integer hearing;

	private Integer strength;

	private Integer limbCo;

	private Integer bodyPosition;

	private Integer colorDiscrimination;



	//状态
	private String status;
	//创建者
	/*private Long createBy;
	//创建时间
	private Date createDate;
	//更新者
	private String updateBy;
	//更新时间
	private Date updateDate;
	//备注信息*/
	private String remarks;
	//删除标记
	/*private String delFlag;
	
	private Long[] userIds;*/

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getwLastName() {
		return wLastName;
	}

	public void setwLastName(String wLastName) {
		this.wLastName = wLastName;
	}

	public String getwFirstName() {
		return wFirstName;
	}

	public void setwFirstName(String wFirstName) {
		this.wFirstName = wFirstName;
	}

	public Long getSIN() {
		return SIN;
	}

	public void setSIN(Long SIN) {
		this.SIN = SIN;
	}

	public Long getTelephone() {
		return telephone;
	}

	public void setTelephone(Long telephone) {
		this.telephone = telephone;
	}

	public String getwAddress() {
		return wAddress;
	}

	public void setwAddress(String wAddress) {
		this.wAddress = wAddress;
	}

	public String getwCity() {
		return wCity;
	}

	public void setwCity(String wCity) {
		this.wCity = wCity;
	}

	public String getwProvince() {
		return wProvince;
	}

	public void setwProvince(String wProvince) {
		this.wProvince = wProvince;
	}

	public String getwPostal() {
		return wPostal;
	}

	public void setwPostal(String wPostal) {
		this.wPostal = wPostal;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Double getMoneyLost() {
		return moneyLost;
	}

	public void setMoneyLost(Double moneyLost) {
		this.moneyLost = moneyLost;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public Long geteTelephone() {
		return eTelephone;
	}

	public void seteTelephone(Long eTelephone) {
		this.eTelephone = eTelephone;
	}

	public String geteAddress() {
		return eAddress;
	}

	public void seteAddress(String eAddress) {
		this.eAddress = eAddress;
	}

	public String geteCity() {
		return eCity;
	}

	public void seteCity(String eCity) {
		this.eCity = eCity;
	}

	public String geteProvince() {
		return eProvince;
	}

	public void seteProvince(String eProvince) {
		this.eProvince = eProvince;
	}

	public String getePostal() {
		return ePostal;
	}

	public void setePostal(String ePostal) {
		this.ePostal = ePostal;
	}

	public Integer getVision() {
		return vision;
	}

	public void setVision(Integer vision) {
		this.vision = vision;
	}

	public Integer getHearing() {
		return hearing;
	}

	public void setHearing(Integer hearing) {
		this.hearing = hearing;
	}

	public Integer getStrength() {
		return strength;
	}

	public void setStrength(Integer strength) {
		this.strength = strength;
	}

	public Integer getLimbCo() {
		return limbCo;
	}

	public void setLimbCo(Integer limbCo) {
		this.limbCo = limbCo;
	}

	public Integer getBodyPosition() {
		return bodyPosition;
	}

	public void setBodyPosition(Integer bodyPosition) {
		this.bodyPosition = bodyPosition;
	}

	public Integer getColorDiscrimination() {
		return colorDiscrimination;
	}

	public void setColorDiscrimination(Integer colorDiscrimination) {
		this.colorDiscrimination = colorDiscrimination;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/*public Long getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}*/

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	/*public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Long[] getUserIds() {
		return userIds;
	}

	public void setUserIds(Long[] userIds) {
		this.userIds = userIds;
	}*/

	@Override
	public String toString() {
		return "FormDO{" +
				"id=" + id +
				", wLastName='" + wLastName + '\'' +
				", wFirstName='" + wFirstName + '\'' +
				", SIN=" + SIN +
				", telephone=" + telephone +
				", wAddress='" + wAddress + '\'' +
				", wCity='" + wCity + '\'' +
				", wProvince='" + wProvince + '\'' +
				", wPostal='" + wPostal + '\'' +
				", job='" + job + '\'' +
				", birth=" + birth +
				", sex='" + sex + '\'' +
				", moneyLost=" + moneyLost +
				", eName='" + eName + '\'' +
				", eTelephone=" + eTelephone +
				", eAddress='" + eAddress + '\'' +
				", eCity='" + eCity + '\'' +
				", eProvince='" + eProvince + '\'' +
				", ePostal='" + ePostal + '\'' +
				", vision=" + vision +
				", hearing=" + hearing +
				", strength=" + strength +
				", limbCo=" + limbCo +
				", bodyPosition=" + bodyPosition +
				", colorDiscrimination=" + colorDiscrimination +
				", status='" + status + '\'' +
				/*", createBy=" + createBy +
				", createDate=" + createDate +
				", updateBy='" + updateBy + '\'' +
				", updateDate=" + updateDate +
				", remarks='" + remarks + '\'' +*/
				/*", delFlag='" + delFlag + '\'' +
				", userIds=" + Arrays.toString(userIds) +*/
				"}";
	}
}
