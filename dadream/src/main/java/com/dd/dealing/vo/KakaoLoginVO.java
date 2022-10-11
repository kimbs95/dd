package com.dd.dealing.vo;

import org.springframework.stereotype.Component;

@Component("kakaoLoginVO")
public class KakaoLoginVO {
	private int kakao_Count;
	private String user_Id;
	private String user_Name;
	private int user_Level;

	public KakaoLoginVO() {

	}

	public KakaoLoginVO(int kakao_Count, String user_Id, String user_Name, int user_Level) {
		super();
		this.kakao_Count = kakao_Count;
		this.user_Id = user_Id;
		this.user_Name = user_Name;
		this.user_Level = user_Level;
	}

	public int getKakao_Count() {
		return kakao_Count;
	}

	public void setKakao_Count(int kakao_Count) {
		this.kakao_Count = kakao_Count;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public int getUser_Level() {
		return user_Level;
	}

	public void setUser_Level(int user_Level) {
		this.user_Level = user_Level;
	}

}
