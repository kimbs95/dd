package proTest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import proTest.dao.TestDAO;

@Service("testService")
@Transactional(propagation = Propagation.REQUIRED)
public class TestService {
	@Autowired
	private TestDAO testDAO;
	
	
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = testDAO.listTests();
		return membersList;
	}


	
}
