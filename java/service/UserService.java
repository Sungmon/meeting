package com.bit.service;

import java.util.List;

import com.bit.domain.UserVO;

public interface UserService {

	public void register(UserVO user);
	
	public UserVO get(Long seq);
	
	public boolean modify(UserVO user);
	
	public boolean remove(Long seq);
	
	public List<UserVO> getList();
}
