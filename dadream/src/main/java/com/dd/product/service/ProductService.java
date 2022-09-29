package com.dd.product.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.dd.product.vo.ProductVO;

public interface ProductService {
	public void addProduct(ProductVO productMap) throws DataAccessException;

	public List<ProductVO> listProducts(String product_Name) throws Exception;
}