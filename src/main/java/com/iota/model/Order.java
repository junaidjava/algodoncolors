package com.iota.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order")
public class Order implements Serializable {
	private static final long serialVersionUID = 6901996741501149509L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String ancNo;
	private String orderNo;
	private String category;
	private String tackPack;
	@ManyToOne
	private Buyer buyer;
	private Boolean washStandard;
	private Boolean swatch;
	private String styleNo;
	private String fabricDesc;
	private String itemDesc;
	private String collection;
	private String remarks;
	@ManyToOne
	private ItemGroup itemGroup;
	private String size;
	private String productLabel;
	private String sampleType;
	private String weight;
	private String packing;
	private Date shipmentDate;
	private String shipmentMode;
	@OneToMany(mappedBy = "order")
	private List<OrderPicture> orderPictures = new ArrayList<OrderPicture>();
	private Date createdOn;
	private Date updatedOn;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getAncNo() {
		return ancNo;
	}

	public void setAncNo(String ancNo) {
		this.ancNo = ancNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTackPack() {
		return tackPack;
	}

	public void setTackPack(String tackPack) {
		this.tackPack = tackPack;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Boolean getWashStandard() {
		return washStandard;
	}

	public void setWashStandard(Boolean washStandard) {
		this.washStandard = washStandard;
	}

	public Boolean getSwatch() {
		return swatch;
	}

	public void setSwatch(Boolean swatch) {
		this.swatch = swatch;
	}

	public String getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(String styleNo) {
		this.styleNo = styleNo;
	}

	public String getFabricDesc() {
		return fabricDesc;
	}

	public void setFabricDesc(String fabricDesc) {
		this.fabricDesc = fabricDesc;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public ItemGroup getItemGroup() {
		return itemGroup;
	}

	public void setItemGroup(ItemGroup itemGroup) {
		this.itemGroup = itemGroup;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getProductLabel() {
		return productLabel;
	}

	public void setProductLabel(String productLabel) {
		this.productLabel = productLabel;
	}

	public String getSampleType() {
		return sampleType;
	}

	public void setSampleType(String sampleType) {
		this.sampleType = sampleType;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getPacking() {
		return packing;
	}

	public void setPacking(String packing) {
		this.packing = packing;
	}

	public Date getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(Date shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}
}
