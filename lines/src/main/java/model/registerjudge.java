package model;

//アカウント登録時の入力文字をチェック

public class registerjudge {
   public boolean RegisterJudge(String userid,String pass,String tell2,String secret) {
	   String id = userid;
	   String pass1 = pass;
	   String tellno = tell2;
	   String ques = secret;
	   
	   if(id.matches("[a-zA-Z_0-9]{1,10}")&&pass1.matches("[a-zA-Z_0-9]{1,10}")
			   &&tellno.matches("[0-9]{1,10}")&&ques.matches(".*{1,20}")) {
		   
		   return true;
	   }else {
		   return false;
	   }
   }
}
       