package model;

import java.io.Serializable;
//import java.util.Date;

public class privatechat implements Serializable {
	
	private int ID;
	private String USER_ID;
	private String CHAT;
	private String date;
	
	public privatechat() {}
	public privatechat(int ID,String USER_ID,String CHAT,String date) {
		this.ID = ID;
		this.USER_ID = USER_ID;
		this.CHAT = CHAT;
		this.date = date;
	}
	
	//public privatechat(String USER_ID,String CHAT,Date date)
	
	public int getId() {return ID;}
	public String getUser_id() {return USER_ID;}
	public String getChat() {return CHAT;}
	public String getDate() {return date;}
	

}
