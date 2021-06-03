package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Login;
import model.LoginLogic;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		//リクエストパラメーターの取得
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		
		//ログイン処理の実行
		Login login = new Login(userid,pass);
		LoginLogic bo = new LoginLogic();
		boolean result = bo.execute(login);
		
		//ログイン処理の成否によって処理分岐
		if(result) {//成功
			//セッションスコープにユーザーIDとパスワード保存
			HttpSession session = request.getSession();
			HttpSession session2 = request.getSession();
			session.setAttribute("userid", userid);
			session2.setAttribute("pass", pass);
			
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginOK.jsp");
			dispatcher.forward(request, response);
		}else {//失敗
			//リダイレクト
			response.sendRedirect("/lines/LoginServlet");
		}
		
	}

}
