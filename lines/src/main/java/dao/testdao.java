package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Login;
import model.tubuyaki;

public class testdao{
	
	//データベース接続に使用する情報
		private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/example";
		private final String DB_USER = "sa";
		private final String DB_PASS = "";
		
		public boolean add(Login login,tubuyaki tubu) {
		//データベースへ接続
				try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
					
					
					//ログインが成功していた場合
					//つぶやき処理に移行
						
						//INSERT文を準備
						String sql2 = "INSERT INTO TIMELINE(USER_ID,GAZOU,TUBUYAKI,GOOD,BAD) VALUES(?,'http',?,?,?)";
						PreparedStatement pStmta = conn.prepareStatement(sql2);
						pStmta.setString(1,tubu.getUserid());
						pStmta.setString(2,tubu.getTubuyaki());
						pStmta.setInt(3,tubu.getGoodpoint());
						pStmta.setInt(4,tubu.getBadpoint());
						
						//SELECT文を実行
						pStmta.executeUpdate();
						
						//前の処理で追加できたか
						String sql3 = "SELECT USER_ID,GAZOU,TUBUYAKI,GOOD,BAD FROM TIMELINE WHERE USER_ID = ? AND TUBUYAKI = ?";
						PreparedStatement pStmt2 = conn.prepareStatement(sql3);
						pStmt2.setString(1,tubu.getUserid());
						pStmt2.setString(2,tubu.getTubuyaki());
						
						//SELECT文を実行し、結果表を習得
						ResultSet rs2 = pStmt2.executeQuery();
						
						//追加ができていればtrue
						if(rs2.next()) {return true;}else return false;
						
                   }catch(SQLException e) {
                	return false;
		}
	}
		
	public boolean test(Login login) {
		try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
	
		//SELECT文を準備
		String sql = "SELECT USER_ID,PASS,TELL,SECRET FROM ACOUNT WHERE USER_ID = ? AND PASS = ?";
		PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setString(1,login.getUserid());
		pStmt.setString(2,login.getPass());
		
		//SELECT文を実行し、結果表を習得
		ResultSet rs = pStmt.executeQuery();
		
		//ログインが成功していた場合
		//つぶやき処理に移行
		if(rs.next()) {return true;}else {return false;}
		}catch(SQLException e) {
        	return false;
        }
     }
}
