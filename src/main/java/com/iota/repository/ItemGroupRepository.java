package com.iota.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iota.model.ItemGroup;

public interface ItemGroupRepository extends JpaRepository<ItemGroup, Long> {

}
