package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.privatechatDAO;
import model.Account;
import model.chatlistLogic;
import model.privatechat;
/**
 * Servlet implementation class userchatServlet
 */
@WebServlet("/userchatServlet")
public class userchatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userchatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		AccountDAO acc = new AccountDAO();
		List<Account> acclist = acc.aca(); 
		ServletContext application = this.getServletContext();
		application.setAttribute("Accountlist", acclist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/userserch.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//チャット内容仮設定
		//String chat = "test";
		
		//送信されてきたフォームを受け取る
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String youid = request.getParameter("userid");
		HttpSession session = request.getSession();
		String myid = (String)session.getAttribute("userid");
		privatechatDAO check = new privatechatDAO();
		boolean test = check.check();
		if(test) {
		   //privatechatDAO dao2 = new privatechatDAO();
		   //boolean check2 = dao2.chatadd(myid, chat);
		   //if(check2) {
			   chatlistLogic logic = new chatlistLogic();
			   List<privatechat> chatlist = logic.execute(myid, youid);
			   ServletContext application = this.getServletContext();
			   application.setAttribute("chatlist", chatlist);
			   HttpSession session2 = request.getSession();
			   session2.setAttribute("youid",youid);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/userchat.jsp");
			   dispatcher.forward(request,response);
		  // }
		//}else {
			//System.out.println("いやむりやん");
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/userserch.jsp");
			//dispatcher.forward(request,response);
		}
		
		
	}

}
