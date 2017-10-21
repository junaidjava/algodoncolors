package com.iota.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.iota.model.Order;

@Component
public class OrderValidator implements Validator {

	@Override
	public boolean supports(Class<?> aClass) {
		return Order.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Order order = (Order) o;

		if (order.getAncNo()==null || order.getAncNo().length() ==0 ) {
			errors.rejectValue("ancNo", "NotEmpty");
		}else if (order.getAncNo().length() > 255) {
			errors.rejectValue("ancNo", "max.char.allowed"+" "+order.getAncNo().length());
		}

		if (order.getOrderNo()==null || order.getOrderNo().length() == 0) {
			errors.rejectValue("orderNo", "NotEmpty");
		}else if (order.getOrderNo().length() > 255) {
			errors.rejectValue("orderNo", "max.char.allowed"+" "+order.getOrderNo().length());
		}
		
		if (order.getBuyer() == null || order.getBuyer().getId() == null) {
			errors.rejectValue("buyer.id", "NotEmpty");
		}

		if (order.getStyleNo()==null || order.getStyleNo().length() ==0 ) {
			errors.rejectValue("styleNo", "NotEmpty");
		}else if (order.getStyleNo().length() > 255) {
			errors.rejectValue("styleNo", "max.char.allowed"+" "+order.getStyleNo().length());
		}

		if (order.getFabricDesc()==null || order.getFabricDesc().length() ==0) {
			errors.rejectValue("fabricDesc", "NotEmpty");
		}else if (order.getFabricDesc().length() > 1000) {
			errors.rejectValue("fabricDesc", "max.char.allowed"+" "+order.getFabricDesc().length());
		}

		if (order.getCollection()==null || order.getCollection().length() < 6 || order.getCollection().length() > 255) {
			errors.rejectValue("collection", "size.order.field.255");
		}

		if (order.getItemGroup() == null || order.getItemGroup().getId() == null) {
			errors.rejectValue("itemGroup.id", "NotEmpty");
		}

		if (order.getShipmentMode() == null || order.getShipmentMode().isEmpty()) {
			errors.rejectValue("shipmentMode", "NotEmpty");
		}

		if (order.getColor() == null || order.getColor().isEmpty()) {
			errors.rejectValue("color", "NotEmpty");
		}

		if (order.getShipmentDate() == null) {
			errors.rejectValue("shipmentDate", "NotEmpty");
		}
	}
}
