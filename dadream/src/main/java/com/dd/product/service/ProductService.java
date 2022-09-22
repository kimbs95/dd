package com.dd.product.service;

import org.springframework.dao.DataAccessException;

import com.dd.product.vo.ProductVO;

public interface ProductService {
	public int addProduct(ProductVO product) throws DataAccessException;
}