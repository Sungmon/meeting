package com.bit.domain;

import lombok.Data;

@Data
public class UserVO {

	private int seq;
	private String id;
	private long password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String sex;
}
