package test;

import java.util.List;

import dao.privatechatDAO;
import model.privatechat;

public class privatechatDAOtest {
	public static void main(String[] args) {
		listtest();
	}
	
	public static void test() {
		//String myid = "HYUGA11";
		//String youid = "OHA11" ;
		privatechatDAO dao = new privatechatDAO();
		boolean test = dao.check();
		if(test) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
	}
	
	public static void addtest() {
		String myid = "hyuga11";
		String chat = "ohayou";
		String youid = "zoezoe";
		privatechatDAO dao = new privatechatDAO();
		boolean test = dao.chatadd(myid, chat,youid);
		if(test) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
	}
	
	public static void listtest() {
		String myid = "hyuga11";
		String youid = "zoezoe";
		privatechatDAO dao = new privatechatDAO();
		List<privatechat> list = dao.chatlist(myid,youid);
		System.out.println(list);
	}

}
