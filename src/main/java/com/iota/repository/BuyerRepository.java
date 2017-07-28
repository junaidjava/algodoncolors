package com.iota.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iota.model.Buyer;

public interface BuyerRepository extends JpaRepository<Buyer, Long>{

}
