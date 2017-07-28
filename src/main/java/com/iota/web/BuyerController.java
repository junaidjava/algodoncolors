package com.iota.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iota.model.Buyer;
import com.iota.repository.BuyerRepository;
import com.iota.validator.BuyerValidator;

@Controller
public class BuyerController {
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);

    @Autowired
    private BuyerValidator buyerValidator;
    @Autowired
    private BuyerRepository repository;

    @RequestMapping(value = "/buyer-setup", method = RequestMethod.GET)
    public String buyerSetup(Model model) {
        model.addAttribute("buyerForm", new Buyer());

        return "buyer-setup";
    }

    @RequestMapping(value = "/buyer-setup", method = RequestMethod.POST)
    public String buyerSetup(@ModelAttribute("buyerForm") Buyer buyerForm, BindingResult bindingResult, Model model) {
        buyerValidator.validate(buyerForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "buyer-setup";
        }

        repository.save(buyerForm);
        logger.debug(String.format("Buyer %s saved successfully!", buyerForm.getName()));

        return "redirect:/buyer-list";
    }

    @RequestMapping(value = "/buyer-list", method = RequestMethod.GET)
    public String buyerList(Model model) {
        List<Buyer> buyerList=repository.findAll();

        model.addAttribute("buyerList", buyerList);

        return "buyerList";
    }

    // this method will be called from buyer list
    @RequestMapping(value = "/edit-buyer", method = RequestMethod.GET)
    public String editBuyer(Model model,HttpServletRequest request) {
    	String strId=request.getParameter("uid");
        logger.debug(String.format("In editBuyer() BuyerId:%s found from url", strId));
    	if(strId==null || strId.trim().length()==0){
            model.addAttribute("buyerForm", new Buyer());
    	}else{
    		try {
        		Long id=Long.valueOf(strId);
        		Buyer selectedBuyer=repository.getOne(id);
                model.addAttribute("buyerForm", selectedBuyer);

			} catch (NumberFormatException nfe) {
		        logger.error(nfe.getMessage(),nfe.getStackTrace());
			}
    	}

        return "buyer-setup";
    }

    @RequestMapping(value = "/edit-buyer", method = RequestMethod.POST)
    public String editBuyer(@ModelAttribute("buyerForm") Buyer buyerForm, BindingResult bindingResult, Model model) {
    	buyerValidator.validate(buyerForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "buyer-setup";
        }
        repository.save(buyerForm);
        logger.debug(String.format("Buyer %s updated successfully!", buyerForm.getName()));

        return "redirect:/buyer-list";
    }

}
