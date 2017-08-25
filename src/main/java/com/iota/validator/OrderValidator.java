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

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ancNo", "NotEmpty");
		if (order.getAncNo().length() < 6 || order.getAncNo().length() > 255) {
			errors.rejectValue("ancNo", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "orderNo", "NotEmpty");
		if (order.getOrderNo().length() < 6 || order.getOrderNo().length() > 255) {
			errors.rejectValue("orderNo", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category", "NotEmpty");
		if (order.getCategory().length() < 6 || order.getCategory().length() > 255) {
			errors.rejectValue("category", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buyer.id", "NotEmpty");
		if (order.getBuyer() == null || order.getBuyer().getId() == null) {
			errors.rejectValue("buyer.id", "NotEmpty");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "styleNo", "NotEmpty");
		if (order.getStyleNo().length() < 6 || order.getStyleNo().length() > 255) {
			errors.rejectValue("styleNo", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fabricDesc", "NotEmpty");
		if (order.getFabricDesc().length() < 6 || order.getFabricDesc().length() > 1000) {
			errors.rejectValue("fabricDesc", "size.order.field.1000");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "collection", "NotEmpty");
		if (order.getCollection().length() < 6 || order.getCollection().length() > 255) {
			errors.rejectValue("collection", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemGroup.id", "NotEmpty");
		if (order.getItemGroup() == null || order.getItemGroup().getId() == null) {
			errors.rejectValue("itemGroup.id", "NotEmpty");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "weight", "NotEmpty");
		if (order.getWeight().length() < 6 || order.getWeight().length() > 255) {
			errors.rejectValue("weight", "size.order.field.255");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shipmentMode", "NotEmpty");
		if (order.getShipmentMode() == null || order.getShipmentMode().isEmpty()) {
			errors.rejectValue("shipmentMode", "NotEmpty");
		}
	}
}
