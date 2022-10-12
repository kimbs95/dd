package com.dd.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.product.dao.ProductDAO;
import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;

@Service("prodcutService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

//상품등록
	@Override
	public int addProduct(Map<String, Object> productMap) throws DataAccessException {
		return productDAO.insertProduct(productMap);

	}

	// 상품목록
	@Override
	public List<ProductVO> listProducts(String product_Name) throws Exception {
		List<ProductVO> productsList = null;
		productsList = productDAO.selectAllProductsList(product_Name);
		return productsList;
	}

//	상품번호로 상품찾기
	@Override
	public ProductVO productinfo(int product_Nums) throws Exception {

		return productDAO.productinfo(product_Nums);

	}

//	 상품번호 
	@Override
	public int productNum(String product_Num) throws DataAccessException {
		return productDAO.productnum(product_Num);
	}

//	상품 조회수 올리기
	public void viewCount(int product_Nums) throws Exception {
		productDAO.viewCount(product_Nums);
	}

//	장바구니
	@Override
	public int cart(Map<String, Object> body) throws DataAccessException {
		return productDAO.cart(body);
	}

//	장바구니리스트
	@Override
	public List<CartVO> cartlist(String user_Id) throws DataAccessException {
		return productDAO.cartlist(user_Id);
	}

//	장바구니 삭제 
	public int cartdelete(int body) throws DataAccessException {
		return productDAO.cartdelete(body);
	}

//	리뷰 작성
	public int reviewpost(Map<String, Object> body) throws DataAccessException {
		return productDAO.reviewpost(body);
	}
}
