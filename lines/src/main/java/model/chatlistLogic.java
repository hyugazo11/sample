package model;
import java.io.Serializable;
import java.util.List;

import dao.privatechatDAO;


public class chatlistLogic implements Serializable {
	public List<privatechat> execute(String myid,String youid){
		privatechatDAO dao = new privatechatDAO();
		List<privatechat> chatlist = dao.chatlist(myid, youid);
		return chatlist;
		
	}

}
