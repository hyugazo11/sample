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

import dao.privatechatDAO;
import model.chatlistLogic;
import model.privatechat;
/**
 * Servlet implementation class userchatlogic
 */
@WebServlet("/userchatlogicServlet")
public class userchatlogicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userchatlogicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//送信されてきたフォームを受け取る
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				HttpSession session3 = request.getSession();
				String youid = (String)session3.getAttribute("youid");
				//String youid = request.getParameter("userid");
				HttpSession session = request.getSession();
				String myid = (String)session.getAttribute("userid");
				String chat = request.getParameter("chat");
				privatechatDAO check = new privatechatDAO();
				boolean test = check.check();
				if(test) {
				 
				   privatechatDAO dao2 = new privatechatDAO();
				   boolean check2 = dao2.chatadd(myid, chat,youid);
				   if(check2) {
					   chatlistLogic logic = new chatlistLogic();
					   List<privatechat> chatlist = logic.execute(myid, youid);
					   ServletContext application = this.getServletContext();
					   application.setAttribute("chatlist", chatlist);
					   HttpSession session2 = request.getSession();
					   session2.setAttribute("youid",youid);
					   RequestDispatcher dispatcher = request.getRequestDispatcher("/userchat.jsp");
					   dispatcher.forward(request,response);
				   }
				}else {
					System.out.println("いやむりやん");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/userserch.jsp");
					dispatcher.forward(request,response);
				}
	}

}
