package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.privatechat;

public class privatechatDAO {
	
	//データベース接続に使用する情報
			private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/example";
			private final String DB_USER = "sa";
			private final String DB_PASS = "";
			
	
	public boolean check() {
		try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			
			//SELECT文を準備
			String sql = "SELECT * FROM PRIVATECHAT";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			//SELECT文を実行し、結果表を習得
			ResultSet rs = pStmt.executeQuery();
			
			//テーブルが見つかればチャットを取得してページ移行
			//なければテーブル作成
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
	}catch(SQLException e) {
		System.out.println("例外です。");
		return false;
	}

   }
	
	public boolean chatadd(String myid,String chat,String youid) {
         
		 try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			
		 //INSERT文を準備
		 String sql = "INSERT INTO PRIVATECHAT(USER_ID,CHAT,DT,YOUID) VALUES(?,?,?,?)";
		 PreparedStatement pStmt = conn.prepareStatement(sql);
		 pStmt.setString(1,myid);
		 pStmt.setString(2,chat);
		 //現在時刻を所得及び設定
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date = new Date(); 
		 String dt = dateFormat.format(date);
		 pStmt.setString(3,dt);
		 pStmt.setString(4, youid);
		 //INSERT文を実行
		 pStmt.executeUpdate();
		 
		//前の処理で追加できたか
		String sql2 = "SELECT USER_ID,CHAT,DT FROM PRIVATECHAT WHERE USER_ID = ? AND CHAT = ?";
		PreparedStatement pStmt2 = conn.prepareStatement(sql2);
		pStmt2.setString(1,myid);
		pStmt2.setString(2,chat);
			
		//SELECT文を実行し、結果表を習得
		ResultSet rs2 = pStmt2.executeQuery();
		
		//追加ができていればtrue
		if(rs2.next()) {
			return true;
		 }else {
			return false; 
		 }
	
		 }catch(SQLException e) {
		  System.out.println("例外ですよ");
	      return false;
         }
    }
	
	public List<privatechat> chatlist(String myid,String youid){
		List<privatechat> chatlist = new ArrayList<>();
		
		try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			//自身と相手のユーザーIDのチャットをリストから抽出
			String sql = "SELECT * FROM PRIVATECHAT WHERE "
			+ "(USER_ID = ? AND YOUID = ?) OR (USER_ID = ? AND YOUID = ?) ORDER BY ID DESC";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1,myid);
			pStmt.setString(2,youid);
			pStmt.setString(3,youid);
			pStmt.setString(4,myid);
			
			//SELECT文を実行
			ResultSet rs = pStmt.executeQuery();
			
			//チャットインスタンスを生成してリストに格納
			while(rs.next()) {
				String USER_ID = rs.getString("USER_ID");
				String CHAT = rs.getString("CHAT");
				String date = rs.getString("DT");
				int ID = rs.getInt("ID");
				privatechat chatli = new privatechat(ID,USER_ID,CHAT,date);
				chatlist.add(chatli);
				
			}
			
		 }catch(SQLException e) {
			 e.printStackTrace();
			 System.out.println("例外です");
			 return null;
			
		}
	   return chatlist;
	}
	
    /*public boolean creat(String myid,String youid) {
    	try(Connection conn = DriverManager.getConnection(JDBC_URL,DB_USER,DB_PASS)){
			//テーブル名を作成
    	String table = myid + "FOR" + youid;
    	String rsql = "CREATE TABLE " + table + " ( ID INT PRIMARY KEY AUTO_INCREMENT,"
    			+ "USER_ID VARCHAR(100) NOT NULL,CHAT VARCHAR(255) NOT NULL)";
    	String sql = rsql;
    	PreparedStatement pStmt = conn.prepareStatement(sql);
    	
    	
    }*/
}
