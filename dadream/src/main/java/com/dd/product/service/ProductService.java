package com.dd.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;

public interface ProductService {
	public int addProduct(Map<String, Object> productMap) throws DataAccessException;

	public List<ProductVO> listProducts(String product_Name) throws Exception;

//	상품번호로 상품찾기
	public ProductVO productinfo(int product_Nums) throws Exception;

//	상품 조회수 올리기
	public void viewCount(int product_Nums) throws Exception;

//	 상품번호 
	public int productNum(String product_Num) throws DataAccessException;

//	장바구니
	public int cart(Map<String, Object> body) throws DataAccessException;

//	장바구니 리스트
	public List<CartVO> cartlist(String user_Id) throws DataAccessException;

//	장바구니 삭제 
	public int cartdelete(int body) throws DataAccessException;

//	리뷰작성
	public int reviewpost(Map<String, Object> body) throws DataAccessException;
}