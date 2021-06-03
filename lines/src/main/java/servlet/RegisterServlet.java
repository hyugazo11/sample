package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.registerjudge;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/userregister.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		
		try {
		//リクエストパラメーターの取得
		
		String userid = request.getParameter("newid");
		String pass = request.getParameter("newpass");
		String tell2 = request.getParameter("newtell");
		int tell = Integer.valueOf(tell2);
		String secret = request.getParameter("newsecret");
		
		//入力値をチェック
		registerjudge judge = new registerjudge();
		boolean check = judge.RegisterJudge(userid, pass,tell2, secret);
		
		if(check) {//良ければ処理続行
		//データベースへ登録、登録できればOK画面へフォワード
		//セッションスコープにユーザーID保存
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		AccountDAO dao = new AccountDAO();
		boolean judege = dao.accountregister(userid,pass,tell,secret);
		
		if(judege) {//成功
		RequestDispatcher dispatcher = request.getRequestDispatcher("/registerOK.jsp");
		dispatcher.forward(request,response);
	   }else {//失敗
		 //リダイレクト
		 response.sendRedirect("/lines/RegisterServlet");
	   }
	  }else {//失敗
		//リダイレクト
		response.sendRedirect("/lines/RegisterServlet");
	  }
	
		}catch(NumberFormatException e) {
		//リダイレクト
		response.sendRedirect("/lines/RegisterServlet");
	 
	  }
	}

}
