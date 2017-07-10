package com.iota.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iota.model.User;

@Controller
public class SupplierController {

	@RequestMapping(value = "/supplier-setup", method = RequestMethod.GET)
    public String supplierSetup(Model model) {
        model.addAttribute("supplierForm", new User());

        return "supplier-setup";
    }

    @RequestMapping(value = "/supplier-setup", method = RequestMethod.POST)
    public String supplierSetup(@ModelAttribute("supplierForm") User supplierForm, BindingResult bindingResult, Model model) {
        //supplierValidator.validate(supplierForm, bindingResult);

        /*if (bindingResult.hasErrors()) {
            return "registration";
        }*/

        //buyerService.save(userForm);

        return "redirect:/welcome";
    }

}
