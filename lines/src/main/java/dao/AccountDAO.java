package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Login;

public class AccountDAO {
	
	//データベース接続に使用する情報
	private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/example";
	private final String DB_USER = "sa";
	private final String DB_PASS = "";
	
	public Account findByLogin(Login login) {
		Account account = null;
		
		//データベースへ接続
		try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			
			//SELECT文を準備
			String sql = "SELECT USER_ID,PASS,TELL,SECRET FROM ACOUNT WHERE USER_ID = ? AND PASS = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1,login.getUserid());
			pStmt.setString(2,login.getPass());
			
			//SELECT文を実行し、結果表を習得
			ResultSet rs = pStmt.executeQuery();
			
			//一致したユーザーが存在した場合
			//そのユーザーを表すAccountインスタンス作成
			if(rs.next()) {
				String userid = rs.getString("USER_ID");
				String pass = rs.getString("PASS");
				int tell = rs.getInt("TELL");
				String secret = rs.getString("SECRET");
				account = new Account(userid,pass,tell,secret);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		//見つかったユーザーまたはnullを返す
		return account;
	}
	
	public boolean accountregister(String userid,String pass,int tell,String secret) {

		//データベースへ接続
				try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
					
					//SELECT文を準備
					String sql = "INSERT INTO ACOUNT(USER_ID,PASS,TELL,SECRET)VALUES(?,?,?,?)";
					PreparedStatement pStmta = conn.prepareStatement(sql);
					pStmta.setString(1,userid);
					pStmta.setString(2,pass);
					pStmta.setInt(3,tell);
					pStmta.setString(4,secret);
					
					//SELECT文を実行
					pStmta.executeUpdate();
					
					//前の処理で追加できたか
					String sql2 = "SELECT USER_ID,PASS FROM ACOUNT WHERE USER_ID = ? AND PASS = ?";
					PreparedStatement pStmt2 = conn.prepareStatement(sql2);
					pStmt2.setString(1,userid);
					pStmt2.setString(2,pass);
					
					//SELECT文を実行し、結果表を習得
					ResultSet rs2 = pStmt2.executeQuery();
					
					if(rs2.next()) {
						return true;
					}else {
						return false;
					}
				}catch(SQLException e) {
					return false;
				}
	}
	
	public List<Account> aca(){
		List<Account> acau = new ArrayList<>();
		
		try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			String sql = "SELECT * FROM ACOUNT";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//SELECT文を実行
			ResultSet rs = pStmt.executeQuery();
			
			while(rs.next()) {
				String userid = rs.getString("USER_ID");
				String pass = rs.getString("PASS");
				Account aca = new Account(userid,pass);
				acau.add(aca);
				
			}
		 }catch(SQLException e) {
			 e.printStackTrace();
			 return null;
			
		}
	   return acau;
	}

}
