package com.dd.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dd.dealing.vo.BoardVO;
import com.dd.dealing.vo.JjimVO;
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

//	상품관리
	@Override
	public List<ProductVO> proMyList(String user_Id) throws Exception {
		return productDAO.proMyList(user_Id);
	}

//	상품 수정
	@Override
	public ProductVO proMod(ProductVO map) throws Exception {
		return productDAO.proMod(map);
	}

//	상품 삭제
	@Override
	public int proDelete(int pro) throws DataAccessException {
		return productDAO.proDelete(pro);
	}

//	상품 조회수 올리기
	public void viewCount(int product_Nums) throws Exception {
		productDAO.viewCount(product_Nums);
	}

	/* 부동산 찜 목록 가져오기 */
	public List<JjimVO> proDl(String user_Id) throws DataAccessException {
		return productDAO.proDl(user_Id);
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
	public List<ReviewReplyVO> revReply() throws Exception {
		return productDAO.revReply();
	}

//	리뷰 대댓글 작성
	public void daedatgle(ReviewReplyVO reply) throws Exception {
		productDAO.daedatgle(reply);
	}

//	리뷰 최고 제일 높은 부모 
	@Override
	public int parentMax() throws Exception {
		return productDAO.parentMax();
	}

//	댓글 토탈 리스트
	public List<ReviewReplyVO> totalReply() throws Exception {
		return productDAO.totalReply();
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
