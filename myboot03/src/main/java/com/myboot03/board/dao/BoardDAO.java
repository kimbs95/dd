package com.myboot03.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot03.board.vo.ArticleVO;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {

	public List selectAllArticlesList() throws Exception;
	public int insertNewArticle(Map articleMap ) throws Exception;
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public int replyArticle(Map articleMap) throws Exception;
	public void updateArticle(Map articleMap) throws DataAccessException; 
	public void deleteArticle(int articleNo) throws DataAccessException; 
	
//	public List selectImageFileList(int articleNO) throws DataAccessException;
	public void insertNewImage(Map articleMap) throws DataAccessException;
}
