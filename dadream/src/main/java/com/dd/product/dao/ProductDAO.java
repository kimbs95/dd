package com.dd.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;

@Mapper
@Repository("productDAO")
public interface ProductDAO {

//	상품등록
	public void insertProduct(ProductVO productMap) throws DataAccessException;

	// 상품목록
	public List<ProductVO> selectAllProductsList(String product_Name) throws DataAccessException;

//	  상품번호 
	public int productnum(String product_Num) throws DataAccessException;

//	장바구니
	public int cart(Map<String, Object> body) throws DataAccessException;

//	장바구니 리스트
	public List<CartVO> cartlist(String user_Id) throws DataAccessException;
}
