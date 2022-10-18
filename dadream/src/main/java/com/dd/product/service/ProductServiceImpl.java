package com.dd.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.dealing.vo.BoardVO;
import com.dd.product.dao.ProductDAO;
import com.dd.product.vo.CartVO;
import com.dd.product.vo.ProductVO;
import com.dd.product.vo.ReviewReplyVO;
import com.dd.product.vo.ReviewVO;

@Service("prodcutService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

//	메뉴 상품 보기
	@Override
	public List<ProductVO> productView() throws Exception {
		return productDAO.productView();
	}

//	메뉴 인테리어 게시판 보기
	@Override
	public List<BoardVO> inteView() throws Exception {
		return productDAO.inteView();
	}

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

//	리뷰리스트
	public List<ReviewVO> reviewList(int product_Nums) throws Exception {
		return productDAO.reviewList(product_Nums);
	}

//	리뷰 댓글
	public void reviewReply(ReviewReplyVO reply) throws Exception {
		productDAO.reviewReply(reply);
	}

//	리뷰 댓글 리스트
	public List<ReviewReplyVO> revReply(int review_Num) throws Exception {
		return productDAO.revReply(review_Num);
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
