package com.iota.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.iota.model.Order;
import com.iota.repository.BuyerRepository;
import com.iota.repository.ItemGroupRepository;
import com.iota.repository.OrderRepository;
import com.iota.validator.OrderValidator;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderValidator orderValidator;

	@Autowired
	private BuyerRepository buyerRepository;

	@Autowired
	private ItemGroupRepository itemGroupRepository;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	@RequestMapping(value = "/order-entry", method = RequestMethod.GET)
	public String createOrder(Model model) {
		Order order = new Order();
		model.addAttribute("order", order);
		model.addAttribute("buyers", buyerRepository.findAll());
		model.addAttribute("itemGroups", itemGroupRepository.findAll());
		return "order";
	}

	@RequestMapping(value = "/order-entry", method = RequestMethod.POST)
	public String createOrder(@ModelAttribute("order") Order order, BindingResult bindingResult, Model model) {
		if (order.getId() == null) {
			order.setCreatedOn(Calendar.getInstance().getTime());
			order.setUpdatedOn(order.getCreatedOn());
		} else {
			Order oldOrder = orderRepository.findOne(order.getId());
			order.setCreatedOn(oldOrder.getCreatedOn());
			order.setUpdatedOn(Calendar.getInstance().getTime());
		}

		/*
		 * orderValidator.validate(order, bindingResult);
		 * 
		 * if (bindingResult.hasErrors()) { model.addAttribute("buyers",
		 * buyerRepository.findAll()); model.addAttribute("itemGroups",
		 * itemGroupRepository.findAll()); return "order"; }
		 */

		orderRepository.save(order);
		logger.debug(String.format("Order # %s entered successfully!", order.getOrderNo()));

		return "redirect:/order-list";
	}

	@RequestMapping(value = "/order-list", method = RequestMethod.GET)
	public String getOrderList(Model model) {
		model.addAttribute("orderList", orderRepository.findAll());
		return "orderList";
	}

	@RequestMapping(value = "/edit-order", method = RequestMethod.GET)
	public String editOrder(@RequestParam("id") Long id, Model model) {
		Order order = orderRepository.findOne(id);
		model.addAttribute("order", order);
		model.addAttribute("buyers", buyerRepository.findAll());
		model.addAttribute("itemGroups", itemGroupRepository.findAll());
		return "order";
	}
}
