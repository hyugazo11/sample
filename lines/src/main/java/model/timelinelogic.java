package model;
import java.io.Serializable;
import java.util.List;

import dao.timelineDAO;

public class timelinelogic implements Serializable{
	public List<tubuyakiID> execute(){
		timelineDAO dao = new timelineDAO();
		List<tubuyakiID> tubu = dao.tubu();
		return tubu;
	}

}
