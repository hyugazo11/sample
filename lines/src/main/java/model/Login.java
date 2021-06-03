package model;
import java.io.Serializable;

//ログイン時に使用するビーンズ
public class Login implements Serializable {
	
	private String userid;
	private String pass;
	
	public Login(String userid,String pass) {
		this.userid = userid;
		this.pass = pass;
	}
	
	public String getUserid() {return userid;}
	public String getPass() {return pass;}

	
}
