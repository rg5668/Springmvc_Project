package calculation;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DiffofDate 
{

	public long diffOfDate(String sdate,String edate) throws Exception//체크인 체크아웃 날짜차이를 구하는 메소드
	{

		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date start=formatter.parse(sdate);
		Date end=formatter.parse(edate);
		
		long diff=end.getTime()-start.getTime();
		long diffDays=diff/(24*60*60*1000);
		return diffDays;
	}
}
