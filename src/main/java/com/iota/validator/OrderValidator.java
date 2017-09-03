package com.iota.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
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

		if (order.getAncNo()==null || order.getAncNo().length() < 6 || order.getAncNo().length() > 255) {
			errors.rejectValue("ancNo", "size.order.field.255");
		}

		if (order.getOrderNo()==null || order.getOrderNo().length() < 6 || order.getOrderNo().length() > 255) {
			errors.rejectValue("orderNo", "size.order.field.255");
		}

		if (order.getCategory()==null  || order.getCategory().length() < 6 || order.getCategory().length() > 255) {
			errors.rejectValue("category", "size.order.field.255");
		}

		if (order.getBuyer() == null || order.getBuyer().getId() == null) {
			errors.rejectValue("buyer.id", "NotEmpty");
		}

		if (order.getStyleNo()==null || order.getStyleNo().length() < 6 || order.getStyleNo().length() > 255) {
			errors.rejectValue("styleNo", "size.order.field.255");
		}

		if (order.getFabricDesc()==null || order.getFabricDesc().length() < 6 || order.getFabricDesc().length() > 1000) {
			errors.rejectValue("fabricDesc", "size.order.field.1000");
		}

		if (order.getCollection()==null || order.getCollection().length() < 6 || order.getCollection().length() > 255) {
			errors.rejectValue("collection", "size.order.field.255");
		}

		if (order.getItemGroup() == null || order.getItemGroup().getId() == null) {
			errors.rejectValue("itemGroup.id", "NotEmpty");
		}

		if (order.getWeight()==null || order.getWeight().length() < 6 || order.getWeight().length() > 255) {
			errors.rejectValue("weight", "size.order.field.255");
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
