package com.iota.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iota.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier,Long> {

}
