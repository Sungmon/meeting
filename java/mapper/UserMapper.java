package com.bit.mapper;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();
	
	public List<UserVO> getListWithPaging(Criteria cri);
	
	public void insert(UserVO user);
	
	public void insertSelectKey(UserVO user);
	
	public UserVO read(Long seq);
	
	public int delete(Long seq);
	
	public int update(UserVO user);
	
	public int getTotalCount(Criteria cri);
}
