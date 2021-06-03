package model;
import java.io.Serializable;

//アカウント情報を取り扱うビーンズ
public class Account implements Serializable {
   private String userid;
   private String pass;
   private int tell;
   private String secret;
   
   public Account(String userid,String pass,int tell,String secret) {
	   this.userid = userid;
	   this.pass = pass;
	   this.tell = tell;
	   this.secret = secret;
   }
   
   public Account(String userid,String pass) {
	   this.userid = userid;
	   this.pass = pass;
	  
   }
   
   public String getUserid() {return userid;}
   public String getPass() {return pass;}
   public int getTell() {return tell;}
   public String getSecret() {return secret;}

}
