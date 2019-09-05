package com.bit.domain;



import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private Long seq;
	private String id;
	private Long password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String sex;
	private Long rrn;
	private Date regdate;
	private Date updatedate;
}
