package com.iota.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.iota.model.Buyer;

@Component
public class BuyerValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Buyer.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	Buyer buyer = (Buyer) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        if (buyer.getName().length() < 6 || buyer.getName().length() > 255) {
            errors.rejectValue("name", "size.user.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if (buyer.getEmail().length() < 8 || buyer.getEmail().length() > 255) {
            errors.rejectValue("email", "size.user.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contactPerson", "NotEmpty");
        if (buyer.getContactPerson().length() < 6 || buyer.getContactPerson().length() > 255) {
            errors.rejectValue("contactPerson", "size.user.username");
        }

    }

}
