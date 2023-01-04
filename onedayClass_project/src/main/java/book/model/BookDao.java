package book.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cls.model.ClsBean;
import review.model.ReviewBean;
import utility.Paging;

@Component
public class BookDao {
	private final String namespace = "book.model.Book";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertBook(BookBean bk) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertBook",bk);		
		System.out.println("insertBook : "+cnt);
		return cnt;
	}

	public List<BookBean> getBookListAboutTime() {
		List<BookBean> bookLists = new ArrayList<BookBean>();
		bookLists = sqlSessionTemplate.selectList(namespace+".getBookListAboutTime");		
		System.out.println("getBookListAboutTime : "+bookLists);
		return bookLists;
	}

	public List<TimetableBean> getSelectB_dayDul(String b_day) {
		List<TimetableBean> B_dayDulList = new ArrayList<TimetableBean>();
		B_dayDulList = sqlSessionTemplate.selectList(namespace+".getSelectB_dayDul",b_day);		
		System.out.println("B_dayDulList : "+B_dayDulList.size());
		return B_dayDulList;
	}

	public List<BookBean> getBookListById(String guestId) {
		List<BookBean> bookList = new ArrayList<BookBean>();
		bookList = sqlSessionTemplate.selectList(namespace+".getBookListById",guestId);		
		System.out.println("getBookListById : "+bookList.size());
		return bookList;
	}

	public BookBean getBookDetailByBnum(String b_num) {
		BookBean bb = new BookBean();
		bb = sqlSessionTemplate.selectOne(namespace+".getBookDetailByBnum",b_num);		
		System.out.println("getBookListById : "+bb.getB_people());
		return bb;
	}
	public void timetableInsert(TimetableBean tb) {
		int cnt = sqlSessionTemplate.insert(namespace+".timetableInsert",tb);		
		System.out.println("timetableInsert : "+cnt);
	}

	public List<TimetableBean> getTbList(Map<String, String> map, Paging pageInfo) {
		List<TimetableBean> tblist = new ArrayList<TimetableBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		System.out.println(pageInfo.getOffset() +"/"+pageInfo.getLimit());
		tblist = sqlSessionTemplate.selectList(namespace+".getTbList", map, rowBounds);		
		System.out.println("getTbList : "+tblist.size());
		return tblist;
	}

	public int getTotalTimeTable(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".getTotalTimeTable",map);		
		System.out.println("getTotalTimeTable : "+totalCount);
		return totalCount;
	}

	public List<TimetableBean> getTtByCnameBday(Map<String, String> map) {
		List<TimetableBean> ttLists = new ArrayList<TimetableBean>(); 
		ttLists = sqlSessionTemplate.selectList(namespace+".getTtByCnameBday",map);		
		System.out.println("getTtByCnameBday : "+ttLists.size());
		return ttLists;
	}

	public TimetableBean getTimetableBybd(TimetableBean tb) {
		TimetableBean tbean = sqlSessionTemplate.selectOne(namespace+".getTimetableBybd",tb);
		System.out.println("getTimetableBybd num : " + tbean.getT_num());
		return tbean;
	}

	public List<BookBean> getBookList(Map<String, String> map, Paging pageInfo) {
		List<BookBean> blist = new ArrayList<BookBean>();
		RowBounds rowBounds=new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		System.out.println(pageInfo.getOffset() +"/"+pageInfo.getLimit());
		
		blist = sqlSessionTemplate.selectList(namespace+".getBookList",map,rowBounds);		
		return blist;
	}

	public TimetableBean getTTByNum(String t_num) {
		TimetableBean tb = sqlSessionTemplate.selectOne(namespace+".getTTByNum",t_num);	
		System.out.println("getTTByNum : " + tb.getT_num());
		return tb;
	}

	public void timetableUpdate(TimetableBean tb) {
		int cnt = sqlSessionTemplate.update(namespace+".timetableUpdate",tb);	
		System.out.println("timetableUpdate : " + cnt);
	}

	public void updateBcheckByNum(String b_num) {
		int cnt = sqlSessionTemplate.update(namespace+".updateBcheckByNum",b_num);	
		System.out.println("updateBcheckByNum : " + cnt);
	}

	public void updateTcheckByNum(String t_num) {
		int cnt = sqlSessionTemplate.update(namespace+".updateTcheckByNum",t_num);	
		System.out.println("updateTcheckByNum : " + cnt);
	}//when member book, update timetable t_check 1 

	public String getTcheckByNum(String t_num) {
		String bcheck = sqlSessionTemplate.selectOne(namespace+".getTcheckByNum",t_num);	
		System.out.println("getTcheckByNum : " + bcheck);
		return bcheck;
	}

	public int getTotalBookList(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".getTotalBookList",map);	
		System.out.println("getTcheckByNum : " + totalCount);
		return totalCount;
	}
}
