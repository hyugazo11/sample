package test;

import java.util.List;

import model.timelinelogic;
import model.tubuyakiID;

public class tubuyakilistTest {
	public static void main(String[] args) {
		tubuyakitest();
	}
	
	public static void tubuyakitest() {
		
		timelinelogic tl = new timelinelogic();
		List<tubuyakiID> tubu = tl.execute();
		
		for (int i=0; i<tubu.size(); ++i)
		{
		    System.out.println(tubu.get(i));
		}
	}

}
