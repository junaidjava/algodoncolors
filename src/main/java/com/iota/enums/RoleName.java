package com.iota.enums;

public enum RoleName {
	ROLE_USER("ROLE_USER"),
	ROLE_MANAGER("ROLE_MANAGER"),
	ROLE_ADMIN("ROLE_ADMIN");

	private String value;

	RoleName(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}
}
