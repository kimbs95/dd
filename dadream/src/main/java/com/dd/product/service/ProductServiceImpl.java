package com.dd.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.product.dao.ProductDAO;
import com.dd.product.vo.ProductVO;

@Service("prodcutService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

//상품등록
	@Override
	public int addProduct(ProductVO product) throws DataAccessException {
		return productDAO.insertProduct(product);
	}
}
