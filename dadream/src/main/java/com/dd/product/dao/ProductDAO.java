package com.dd.product.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dd.product.vo.ProductVO;

@Mapper
@Repository("productDAO")
public interface ProductDAO {

	public int insertProduct(ProductVO product) throws DataAccessException;
}
