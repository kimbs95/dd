package com.dd.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;

public interface ProductService {
	public void addProduct(ProductVO productMap) throws DataAccessException;

	public List<ProductVO> listProducts(String product_Name) throws Exception;

//	 상품번호 
	public int productNum(String product_Num) throws DataAccessException;

//	장바구니
	public int cart(Map<String, Object> body) throws DataAccessException;

//	장바구니 리스트
	public List<CartVO> cartlist(String user_Id) throws DataAccessException;

//	장바구니 삭제 
	public int cartdelete(int body) throws DataAccessException;
}