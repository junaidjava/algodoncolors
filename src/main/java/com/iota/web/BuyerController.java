package com.iota.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iota.model.User;

@Controller
public class BuyerController {

	@RequestMapping(value = "/buyer-setup", method = RequestMethod.GET)
    public String buyerSetup(Model model) {
        model.addAttribute("buyerForm", new User());

        return "buyer-setup";
    }

    @RequestMapping(value = "/buyer-setup", method = RequestMethod.POST)
    public String buyerSetup(@ModelAttribute("buyerForm") User buyerForm, BindingResult bindingResult, Model model) {
        //buyerValidator.validate(buyerForm, bindingResult);

        /*if (bindingResult.hasErrors()) {
            return "registration";
        }*/

        //buyerService.save(userForm);

        return "redirect:/welcome";
    }

}
