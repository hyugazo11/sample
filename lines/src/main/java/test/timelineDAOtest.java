package test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.timelineDAO;
import model.Login;
import model.tubuyaki;

public class timelineDAOtest {
	public static void main(String[] args) {
		addtest();
		//test();
	}
	
	public static void addtest() {
		
		//現在時刻を所得及び設定
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date = new Date(); 
		 String dt = dateFormat.format(date);
		//つぶやきインスタンス生成
		tubuyaki tubu = new tubuyaki("hyuga11", "tubuyaki", 1, 2,dt);
		//ログイン作成
		Login login = new Login("hyuga11","otoshi11");
		
		timelineDAO dao = new timelineDAO();
		boolean check = dao.add(login, tubu);
		
		if(check) {
			System.out.println("成功");
			
		}else {
			System.out.println("失敗");
		}
	}
	
	/*public static void test() {
		Login login = new Login("hyuga11","otoshi11");
		
		timelineDAO dao = new timelineDAO();
		boolean check = dao.test(login);
		if(check) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
	}*/
}

