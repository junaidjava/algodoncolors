package com.iota.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iota.model.Order;
import com.iota.repository.OrderRepository;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderRepository orderRepository;

	@RequestMapping(value = "/order-entry", method = RequestMethod.GET)
	public String createOrder(Model model) {
		Order order = new Order();
		order.setSize("{\"data\":{\"Small_Sleeve\":\"15\"},\"measurementSize\":[\"Small\"],\"measurementCategory\":[\"Sleeve\"]}");
		model.addAttribute("order", order);
		return "order";
	}

	@RequestMapping(value = "/order-entry", method = RequestMethod.POST)
	public String createOrder(@ModelAttribute("order") Order order, BindingResult bindingResult, Model model) {
		orderRepository.save(order);
		logger.debug(String.format("Order # %s entered successfully!", order.getOrderNo()));

		return "redirect:/order-list";
	}

	@RequestMapping(value = "/order-list", method = RequestMethod.GET)
	public String getOrderList(Model model) {
		model.addAttribute("orderList", orderRepository.findAll());
		return "orderList";
	}
}
