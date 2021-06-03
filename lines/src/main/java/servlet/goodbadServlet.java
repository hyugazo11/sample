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

import dao.timelineDAO;
import model.timelinelogic;
import model.tubuyakiID;

/**
 * Servlet implementation class goodbad
 */
@WebServlet("/goodbadServlet")
public class goodbadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public goodbadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメーターの取得,good,badの生成
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("god") != null) {
			    // 「GOODボタンが押された時の処理」
			    //  該当するつぶやきをIDで検索、あれば現在のGOOD数に＋1してDBを更新
			    String sid = request.getParameter("id");
			    int id = Integer.parseInt(sid);
			    String judge = "GOOD";
			    timelineDAO timelinedao = new timelineDAO();
				boolean check = timelinedao.judge(id, judge);
				if(check) {//いいね処理が成功したら・・・
					timelinelogic gettubuyaki = new timelinelogic();
					List<tubuyakiID> tubuyakilist = gettubuyaki.execute(); 
					ServletContext application = this.getServletContext();
					application.setAttribute("tubuyakilist", tubuyakilist);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/timeline.jsp");
					dispatcher.forward(request,response);
				}else {System.out.println("だめよ");};
			} else if (request.getParameter("bad") != null) {
				// 「BADボタンが押された時の処理」
			    //  該当するつぶやきをIDで検索、あれば現在のBAD数に＋1してDBを更新
				String sid = request.getParameter("id");
			    int id = Integer.parseInt(sid);
			    String judge = "BAD";
			    timelineDAO timelinedao = new timelineDAO();
				boolean check = timelinedao.judge(id, judge);
				if(check) {//悪いね処理が成功したら
					timelinelogic gettubuyaki = new timelinelogic();
					List<tubuyakiID> tubuyakilist = gettubuyaki.execute(); 
					ServletContext application = this.getServletContext();
					application.setAttribute("tubuyakilist", tubuyakilist);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/timeline.jsp");
					dispatcher.forward(request,response);
				}else {System.out.println("だめよ");};
			}
	}

}
