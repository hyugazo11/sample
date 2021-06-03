package test;

import dao.AccountDAO;
import model.Account;
import model.Login;

public class AccountDAOtest {
	public static void main(String[] args) {
		testregister();
		testregister2();
	}
	
	public static void testFindByLogin1() {
		Login login = new Login("hyuga11","otoshi11");
		AccountDAO dao = new AccountDAO();
		Account result = dao.findByLogin(login);
		
		if(result != null && result.getUserid().equals("hyuga11") &&
			result.getPass().equals("otoshi11")) {
			System.out.println("テスト1成功");
			
		}else {
			System.out.println("テスト1失敗");
		}
	}
	
	public static void testFindByLogin2() {
		Login login = new Login("hyuga11","otoshi");
		AccountDAO dao= new AccountDAO();
		Account result = dao.findByLogin(login);
		
		if(result == null) {
			System.out.println("テスト2成功");
		}else {
			System.out.println("テスト2失敗");
		}
	}
	
	public static void testregister() {
		AccountDAO dao = new AccountDAO();
		boolean result = dao.accountregister("aaa1a", "3fdf", 123, "fsfsr");
		
		if(result) {
			System.out.println("テスト成功");
		}else {
			System.out.println("テスト失敗");
		}
	}
	
	public static void testregister2() {
		AccountDAO dao1 = new AccountDAO();
		boolean result = dao1.accountregister(null, "3fdf", 123, "fsfsr");
		
		if(result) {
			System.out.println("テスト失敗");
		}else {
			System.out.println("テスト成功");
		}
	}
	

}
