package com.iota.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "algodon_order")
public class Order implements Serializable {
	private static final long serialVersionUID = 6901996741501149509L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String ancNo;
	private String orderNo;
	private String techPack;
	private String techPack2;
	private String techPack3;
	@ManyToOne
	@JoinColumn(name="buyerId")
	private Buyer buyer;
	private Boolean washStandard;
	private Boolean swatch;
	private String styleNo;
	private String fabricDesc;
	private String color;
	private String itemDesc;
	private String collection;
	private String remarks;
	@ManyToOne
	@JoinColumn(name="itemGroupId")
	private ItemGroup itemGroup;
	private String size;
	private String productLabel;
	private Date shipmentDate;
	private String shipmentMode;
	private Date shipmentDate2;
	private String shipmentMode2;
	private Date shipmentDate3;
	private String shipmentMode3;
	private Boolean sample;
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
		if(ancNo!=null)
			this.ancNo = ancNo.trim();
		else
			this.ancNo = ancNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		if(orderNo!=null) 
			this.orderNo = orderNo.trim();
		else	
			this.orderNo = orderNo;
	}

	public String getTechPack() {
		return techPack;
	}

	public void setTechPack(String techPack) {
		this.techPack = techPack;
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
		if(styleNo!=null)
			this.styleNo = styleNo.trim();
		else	
			this.styleNo = styleNo;
	}

	public String getFabricDesc() {
		return fabricDesc;
	}

	public void setFabricDesc(String fabricDesc) {
		if(fabricDesc!=null)
			this.fabricDesc = fabricDesc.trim();
		else	
			this.fabricDesc = fabricDesc;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		if(itemDesc!=null)
			this.itemDesc = itemDesc.trim();
		else
			this.itemDesc = itemDesc;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		if(collection!=null)
			this.collection = collection.trim();
		else
			this.collection = collection;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		if(remarks!=null)
			this.remarks = remarks.trim();
		else
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
		if(productLabel!=null)
			this.productLabel = productLabel.trim();
		else
			this.productLabel = productLabel;
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

	public Boolean getSample() {
		return sample;
	}

	public void setSample(Boolean sample) {
		this.sample = sample;
	}

	public String getTechPack2() {
		return techPack2;
	}

	public void setTechPack2(String techPack2) {
		this.techPack2 = techPack2;
	}

	public String getTechPack3() {
		return techPack3;
	}

	public void setTechPack3(String techPack3) {
		this.techPack3 = techPack3;
	}

	public Date getShipmentDate2() {
		return shipmentDate2;
	}

	public void setShipmentDate2(Date shipmentDate2) {
		this.shipmentDate2 = shipmentDate2;
	}

	public String getShipmentMode2() {
		return shipmentMode2;
	}

	public void setShipmentMode2(String shipmentMode2) {
		this.shipmentMode2 = shipmentMode2;
	}

	public Date getShipmentDate3() {
		return shipmentDate3;
	}

	public void setShipmentDate3(Date shipmentDate3) {
		this.shipmentDate3 = shipmentDate3;
	}

	public String getShipmentMode3() {
		return shipmentMode3;
	}

	public void setShipmentMode3(String shipmentMode3) {
		this.shipmentMode3 = shipmentMode3;
	}
}
