package com.dd.dealing.vo;

import java.sql.Date;

public class BoardVO {
	private int inte_Num;
	private String inte_Title;
	private String inte_Text;
	private String inte_Image;
	private String user_Id;
	private Date inte_Date;

	public BoardVO() {

	}

	public BoardVO(int inte_Num, String inte_Title, String inte_Text, String inte_Image, String user_Id,
			Date inte_Date) {
		super();
		this.inte_Num = inte_Num;
		this.inte_Title = inte_Title;
		this.inte_Text = inte_Text;
		this.inte_Image = inte_Image;
		this.user_Id = user_Id;
		this.inte_Date = inte_Date;
	}

	public int getInte_Num() {
		return inte_Num;
	}

	public void setInte_Num(int inte_Num) {
		this.inte_Num = inte_Num;
	}

	public String getInte_Title() {
		return inte_Title;
	}

	public void setInte_Title(String inte_Title) {
		this.inte_Title = inte_Title;
	}

	public String getInte_Text() {
		return inte_Text;
	}

	public void setInte_Text(String inte_Text) {
		this.inte_Text = inte_Text;
	}

	public String getInte_Image() {
		return inte_Image;
	}

	public void setInte_Image(String inte_Image) {
		this.inte_Image = inte_Image;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public Date getInte_Date() {
		return inte_Date;
	}

	public void setInte_Date(Date inte_Date) {
		this.inte_Date = inte_Date;
	}

	@Override
	public String toString() {
		return "BoardVO [inte_Num=" + inte_Num + ", inte_Title=" + inte_Title + ", inte_Text=" + inte_Text
				+ ", user_Id=" + user_Id + ", inte_Date=" + inte_Date + ", inte_Image=" + inte_Image + "]";
	}
}
