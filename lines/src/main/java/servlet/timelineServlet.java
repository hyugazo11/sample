package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.timelineDAO;
import model.Login;
import model.timelinelogic;
import model.tubuyaki;
import model.tubuyakiID;

/**
 * Servlet implementation class timeline
 */
@WebServlet("/timelineServlet")
public class timelineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public timelineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		timelinelogic gettubuyaki = new timelinelogic();
		List<tubuyakiID> tubuyakilist = gettubuyaki.execute(); 
		ServletContext application = this.getServletContext();
		application.setAttribute("tubuyakilist", tubuyakilist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/timeline.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//リクエストパラメーターの取得,good,badの生成
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String Userid = (String)session.getAttribute("userid");
			String tubuyaki = request.getParameter("tubuyaki");
			int goodpoint = 0;
			int badpoint = 0;
			//現在時刻を所得及び設定
			 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 Date date = new Date(); 
			 String dt = dateFormat.format(date);
			//つぶやきインスタンス生成
			tubuyaki tubu = new tubuyaki(Userid,tubuyaki,goodpoint,badpoint,dt);
			//後ほど入力値チェックを実施
			
			//データベースにつぶやきを追加
			HttpSession session3 = request.getSession();
			HttpSession session4 = request.getSession();
			String userid = (String)session3.getAttribute("userid");
			String pass = (String)session4.getAttribute("pass");
			Login login = new Login(userid,pass);
			timelineDAO timelinedao = new timelineDAO();
			boolean check = timelinedao.add(login, tubu);
			
				if(check) {//成功
					timelinelogic gettubuyaki = new timelinelogic();
					List<tubuyakiID> tubuyakilist = gettubuyaki.execute(); 
					ServletContext application = this.getServletContext();
					application.setAttribute("tubuyakilist", tubuyakilist);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/timeline.jsp");
					dispatcher.forward(request,response);
				   }else {//失敗
					 //リダイレクト
					 response.sendRedirect("/lines/timelineServlet");
				 
				  }
				
					}catch(NumberFormatException e) {
					//リダイレクト
					response.sendRedirect("/lines/timelineServlet");
				 
				  }
			
	}

}
