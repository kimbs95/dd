package com.dd.dealing.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int Notice_Num;
	private String Notice_Title;
	private String Notice_Text;
	private Date Notice_Date;
	private String user_Id;
	private String Notice_Category;

	public NoticeVO() {

	}

	public NoticeVO(int notice_Num, String notice_Title, String notice_Text, Date notice_Date, String user_Id,
			String notice_Category) {
		super();
		this.Notice_Num = notice_Num;
		this.Notice_Title = notice_Title;
		this.Notice_Text = notice_Text;
		this.Notice_Date = notice_Date;
		this.user_Id = user_Id;
		this.Notice_Category = notice_Category;
	}

	public int getNotice_Num() {
		return Notice_Num;
	}

	public void setNotice_Num(int notice_Num) {
		Notice_Num = notice_Num;
	}

	public String getNotice_Title() {
		return Notice_Title;
	}

	public void setNotice_Title(String notice_Title) {
		Notice_Title = notice_Title;
	}

	public String getNotice_Text() {
		return Notice_Text;
	}

	public void setNotice_Text(String notice_Text) {
		Notice_Text = notice_Text;
	}

	public Date getNotice_Date() {
		return Notice_Date;
	}

	public void setNotice_Date(Date notice_Date) {
		Notice_Date = notice_Date;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getNotice_Category() {
		return Notice_Category;
	}

	public void setNotice_Category(String notice_Category) {
		Notice_Category = notice_Category;
	}

}