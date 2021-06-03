package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Login;
import model.tubuyaki;
import model.tubuyakiID;

public class timelineDAO {
	
	//データベース接続に使用する情報
		private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/example";
		private final String DB_USER = "sa";
		private final String DB_PASS = "";
		
		public boolean add(Login login,tubuyaki tubu) {
		//データベースへ接続
				try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
					
					//SELECT文を準備
					String sql = "SELECT USER_ID,PASS,TELL,SECRET FROM ACOUNT WHERE USER_ID = ? AND PASS = ?";
					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setString(1,login.getUserid());
					pStmt.setString(2,login.getPass());
					
					//SELECT文を実行し、結果表を習得
					ResultSet rs = pStmt.executeQuery();
					//System.out.println(rs);
					//ログインが成功していた場合
					//つぶやき処理に移行
					if(!rs.next()) {return false;}
					
						
						//INSERT文を準備
						String sql2 = "INSERT INTO TIMELINE(USER_ID,GAZOU,TUBUYAKI,GOOD,BAD,DT) VALUES(?,'http',?,?,?,?)";
						PreparedStatement pStmt2 = conn.prepareStatement(sql2);
						pStmt2.setString(1,tubu.getUserid());
						pStmt2.setString(2,tubu.getTubuyaki());
						pStmt2.setInt(3,tubu.getGoodpoint());
						pStmt2.setInt(4,tubu.getBadpoint());
						pStmt2.setString(5,tubu.getDate());
						
						//SELECT文を実行
						pStmt2.executeUpdate();
						
						//前の処理で追加できたか
						String sql3 = "SELECT USER_ID,GAZOU,TUBUYAKI,GOOD,BAD,DT FROM TIMELINE WHERE USER_ID = ? AND TUBUYAKI = ?";
						PreparedStatement pStmt3 = conn.prepareStatement(sql3);
						pStmt3.setString(1,tubu.getUserid());
						pStmt3.setString(2,tubu.getTubuyaki());
						
						//SELECT文を実行し、結果表を習得
						ResultSet rs2 = pStmt3.executeQuery();
						
						//追加ができていればtrue
						if(rs2.next()) {
							return true;
						}else return false;
						
				
					 
                   }catch(SQLException e) {
                	   return false;
                   }
		}
		
		public List<tubuyakiID> tubu(){
			List<tubuyakiID> tubu = new ArrayList<>();
			
			try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
				String sql = "SELECT * FROM TIMELINE ORDER BY ID DESC";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				
				//SELECT文を実行
				ResultSet rs = pStmt.executeQuery();
				
				while(rs.next()) {
					String Userid = rs.getString("USER_ID");
					String tubuyaki = rs.getString("TUBUYAKI");
					int goodpoint = rs.getInt("GOOD");
					int badpoint = rs.getInt("BAD");
					int id = rs.getInt("ID");
					String dt = rs.getString("DT");
					tubuyakiID tubuta = new tubuyakiID(Userid,tubuyaki,goodpoint,badpoint,id,dt);
					tubu.add(tubuta);
					
				}
			 }catch(SQLException e) {
				 e.printStackTrace();
				 return null;
				
			}
		   return tubu;
		}
		
		public boolean judge(int id,String judge) {
			try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
		
			//SELECT文を準備
			String sql5 = "SELECT USER_ID,GAZOU,TUBUYAKI,GOOD,BAD,ID FROM TIMELINE WHERE ID = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql5);
			pStmt.setInt(1,id);
			//SELECT文を実行し、結果表を習得
			ResultSet rs = pStmt.executeQuery();
			//ログインが成功していた場合
			//つぶやき処理に移行
			if(rs.next()) {
				int idplus = rs.getInt(judge);
				idplus++;
				String sql2;
				if(judge.equals("GOOD")) {
			        sql2 = "UPDATE TIMELINE SET GOOD = ? WHERE ID=?";
				}else {
					sql2 = "UPDATE TIMELINE SET BAD = ? WHERE ID=?";
				}
			    PreparedStatement pStmt2 = conn.prepareStatement(sql2);
			    pStmt2.setInt(1, idplus);
			    pStmt2.setInt(2, id);
			    pStmt2.executeUpdate();
			    return true;
			 }else {return false;}
			}catch(SQLException e) {
				System.out.println("例外です");
				return false;
	        }
	     }
}
	

