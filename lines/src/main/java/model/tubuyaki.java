package model;
import java.io.Serializable;

//タイムラインへのつぶやき情報を取り扱うビーンズ

public class tubuyaki implements Serializable {
	
	private String Userid;
	//private int id;
	private String tubuyaki;
	private int goodpoint;
	private int badpoint;
	private String date;
	public tubuyaki() {};
	public tubuyaki(String Userid,String tubuyaki,int goodpoint,int badpoint,String date) {
		this.Userid = Userid;
		//this.id = id;
		this.tubuyaki = tubuyaki;
		this.goodpoint = goodpoint;
		this.badpoint = badpoint;
		this.date = date;
		
	}
	
	public String getUserid() {return Userid;}
	public String getDate() {return date;}
	public String getTubuyaki() {return tubuyaki;}
	public int getGoodpoint() {return goodpoint;}
	public int getBadpoint() {return badpoint;}
	
	

}
