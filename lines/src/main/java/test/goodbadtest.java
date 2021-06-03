package test;
import dao.timelineDAO;


public class goodbadtest {
	public static void main(String[] args) {
		test();
		test2();
	}
	
	public static void test() {
		int id = 47;
		String judge = "GOOD";
		timelineDAO timelinedao = new timelineDAO();
		boolean check = timelinedao.judge(id, judge);
		if(check) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
		
	}
	
	public static void test2() {
		int id = 47;
		String judge = "BAD";
		timelineDAO timelinedao = new timelineDAO();
		boolean check = timelinedao.judge(id, judge);
		if(check) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
		
	}

}
