package com.bit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bit.domain.UserVO;
import com.bit.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private UserMapper mapper;

	@Override
	public void register(UserVO user) {
		// TODO Auto-generated method stub
		
		log.info("register...." + user);
		
		mapper.insertSelectKey(user);
	}

	@Override
	public UserVO get(Long seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(UserVO user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<UserVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
