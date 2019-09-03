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
		log.info("get......" + seq);
		
		return mapper.read(seq);
	}

	@Override
	public boolean modify(UserVO user) {
		// TODO Auto-generated method stub
		log.info("modify ...." + user);
		return mapper.update(user) == 1;
	}

	@Override
	public boolean remove(Long seq) {
		// TODO Auto-generated method stub
		log.info("remove...." + seq);
		
		return mapper.delete(seq) == 1;
	}

	@Override
	public List<UserVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList ....");
		
		return mapper.getList();
	}
	
	
}
