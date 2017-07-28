package com.iota.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.iota.model.Supplier;

@Component
public class SupplierValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Supplier.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	Supplier supplier = (Supplier) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        if (supplier.getName().length() < 6 || supplier.getName().length() > 32) {
            errors.rejectValue("name", "size.user.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if (supplier.getEmail().length() < 8 || supplier.getEmail().length() > 255) {
            errors.rejectValue("email", "size.user.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contactPerson", "NotEmpty");
        if (supplier.getContactPerson().length() < 6 || supplier.getContactPerson().length() > 32) {
            errors.rejectValue("contactPerson", "size.user.username");
        }

    }
}
