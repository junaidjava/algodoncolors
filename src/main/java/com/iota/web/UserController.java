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

import com.iota.model.User;
import com.iota.service.SecurityService;
import com.iota.service.UserService;
import com.iota.validator.UserValidator;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);
        logger.debug(String.format("User %s saved successfully!", userForm.getUsername()));

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }

    @RequestMapping(value = "/employee-setup", method = RequestMethod.GET)
    public String employeeSetup(Model model,HttpServletRequest request) {
        model.addAttribute("userForm", new User());
        return "employee-setup";
    }

    @RequestMapping(value = "/employee-setup", method = RequestMethod.POST)
    public String employeeSetup(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "employee-setup";
        }
        userService.save(userForm);
        logger.debug(String.format("User %s saved successfully!", userForm.getUsername()));

        return "redirect:/employee-list";
    }

    @RequestMapping(value = "/employee-list", method = RequestMethod.GET)
    public String employeeList(Model model) {
        List<User> userList=userService.getAllUsers();

        model.addAttribute("userList", userList);

        return "employeeList";
    }

    // this method will be called from user list
    @RequestMapping(value = "/edit-user", method = RequestMethod.GET)
    public String editUser(Model model,HttpServletRequest request) {
    	String strId=request.getParameter("uid");
        logger.debug(String.format("In editUser() UserId:%s found from url", strId));
    	if(strId==null || strId.trim().length()==0){
            model.addAttribute("userForm", new User());
    	}else{
    		try {
        		Long id=Long.valueOf(strId);
        		User selectedUser=userService.getById(id);
                model.addAttribute("userForm", selectedUser);

			} catch (NumberFormatException nfe) {
		        logger.error(nfe.getMessage(),nfe.getStackTrace());
			}
    	}

        return "editUser";
    }

    @RequestMapping(value = "/edit-user", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validateUpdate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "editUser";
        }
        userService.update(userForm);
        logger.debug(String.format("User %s updated successfully!", userForm.getUsername()));

        return "redirect:/employee-list";
    }

}
