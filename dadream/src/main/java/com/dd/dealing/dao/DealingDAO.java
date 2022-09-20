package com.dd.dealing.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.dealing.vo.MemberVO;

@Mapper
@Repository("dealingDAO")
public interface DealingDAO {

	public int insertMember(MemberVO memberVO) throws DataAccessException;

}
