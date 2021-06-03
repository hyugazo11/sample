package test;
import model.registerjudge;

public class registerchecktest {
	public static void main(String[] args) {
		test();
	}
	
	public static void test() {
		String userid = "dfada";
		String pass = "nfsf";
		String tell2 = "131333";
		String secret = "svsf";
		registerjudge judge = new registerjudge();
		boolean check = judge.RegisterJudge(userid,pass,tell2, secret);
		if(check) {
			System.out.println("成功");
		}else {
			System.out.println("失敗");
		}
	}

}
