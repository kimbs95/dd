package com.dd.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.product.vo.ProductVO;

@Mapper
@Repository("productDAO")
public interface ProductDAO {

//	상품등록
	public void insertProduct(ProductVO productMap) throws DataAccessException;

	// 상품목록
	public List<ProductVO> selectAllProductsList(String product_Name) throws DataAccessException;
}
