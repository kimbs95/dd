package com.dd.dealing.vo;

import org.springframework.stereotype.Component;

@Component("searchVO")
public class SearchVO {
	private String searchKeyword;

	public SearchVO() {
	}

	public SearchVO(String searchKeyword) {
		super();
		this.searchKeyword = searchKeyword;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

}
