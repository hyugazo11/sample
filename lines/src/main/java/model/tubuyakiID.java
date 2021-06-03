package model;
import java.io.Serializable;

//タイムラインへのつぶやき情報を取り扱うビーンズ(IDあり)

public class tubuyakiID implements Serializable {
	
	private String Userid;
	private int id;
	private String tubuyaki;
	private int goodpoint;
	private int badpoint;
	private String date;
	public tubuyakiID() {};
	public tubuyakiID(String Userid,String tubuyaki,int goodpoint,int badpoint,int id,String date) {
		this.Userid = Userid;
		this.id = id;
		this.tubuyaki = tubuyaki;
		this.goodpoint = goodpoint;
		this.badpoint = badpoint;
		this.date = date;
		
	}
	
	public String getUserid() {return Userid;}
	public int getId() {return id;}
	public String getTubuyaki() {return tubuyaki;}
	public int getGoodpoint() {return goodpoint;}
	public int getBadpoint() {return badpoint;}
	public String getDate() {return date;}
	
	

}