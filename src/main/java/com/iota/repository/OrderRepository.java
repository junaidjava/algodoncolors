package com.iota.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iota.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
