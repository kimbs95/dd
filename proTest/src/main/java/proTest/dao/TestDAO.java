package proTest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("testDAO")
public interface TestDAO {
	
	
	public List listTests() throws DataAccessException;
}
