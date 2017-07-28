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

import com.iota.model.Supplier;
import com.iota.repository.SupplierRepository;
import com.iota.validator.SupplierValidator;


@Controller
public class SupplierController {
	private static final Logger logger = LoggerFactory.getLogger(SupplierController.class);

    @Autowired
    private SupplierValidator supplierValidator;
    @Autowired
    private SupplierRepository repository;

    @RequestMapping(value = "/supplier-setup", method = RequestMethod.GET)
    public String supplierSetup(Model model) {
        model.addAttribute("supplierForm", new Supplier());

        return "supplier-setup";
    }

    @RequestMapping(value = "/supplier-setup", method = RequestMethod.POST)
    public String supplierSetup(@ModelAttribute("supplierForm") Supplier supplierForm, BindingResult bindingResult, Model model) {
    	supplierValidator.validate(supplierForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "supplier-setup";
        }

        repository.save(supplierForm);
        logger.debug(String.format("Supplier %s saved successfully!", supplierForm.getName()));

        return "redirect:/supplier-list";
    }

    @RequestMapping(value = "/supplier-list", method = RequestMethod.GET)
    public String supplierList(Model model) {
        List<Supplier> supplierList=repository.findAll();

        model.addAttribute("supplierList", supplierList);

        return "supplierList";
    }

    // this method will be called from supplier list
    @RequestMapping(value = "/edit-supplier", method = RequestMethod.GET)
    public String editSupplier(Model model,HttpServletRequest request) {
    	String strId=request.getParameter("uid");
        logger.debug(String.format("In editSupplier() SupplierId:%s found from url", strId));
    	if(strId==null || strId.trim().length()==0){
            model.addAttribute("supplierForm", new Supplier());
    	}else{
    		try {
        		Long id=Long.valueOf(strId);
        		Supplier selectedSupplier=repository.getOne(id);
                model.addAttribute("supplierForm", selectedSupplier);

			} catch (NumberFormatException nfe) {
		        logger.error(nfe.getMessage(),nfe.getStackTrace());
			}
    	}

        return "supplier-setup";
    }

    @RequestMapping(value = "/edit-supplier", method = RequestMethod.POST)
    public String editSupplier(@ModelAttribute("supplierForm") Supplier supplierForm, BindingResult bindingResult, Model model) {
    	supplierValidator.validate(supplierForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "supplier-setup";
        }
        repository.save(supplierForm);
        logger.debug(String.format("Supplier %s updated successfully!", supplierForm.getName()));

        return "redirect:/supplier-list";
    }

}
