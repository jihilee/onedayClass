package book.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import book.model.BookBean;
import book.model.BookDao;
import book.model.TimetableBean;
import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
@ComponentScan({"cls.*","book.*"})
public class AdminTimeTableInsertController {
	private final String command = "AdminTimeTableInsert.bk";
	private String getPage = "/AdminTimeTableInsert";
	
	private final String insertTT = "timeTableInsert.bk";
	private String getList = "AdminTimeTableList.bk";

	@Autowired ClsDao clsDao;
	@Autowired BookDao bookDao;
	
		
	@RequestMapping(command)
	public String bookopen(HttpSession session,Model model, 
			@RequestParam(value="b_day",required=false) String b_day,
			@RequestParam(value="cname",required=false) String cname) {
		
		List<ClsBean> clssList = new ArrayList<ClsBean>();
		clssList = clsDao.getClsList();

		List<BookBean> bookList = new ArrayList<BookBean>();
		bookList = bookDao.getBookListAboutTime();
		
		model.addAttribute("clssList",clssList);
		model.addAttribute("bookList",bookList);
		
		if(b_day!=null) {
			List<TimetableBean> B_dayDulList = new ArrayList<TimetableBean>();
			System.out.println(b_day);
			B_dayDulList = bookDao.getSelectB_dayDul(b_day);
			model.addAttribute("B_dayDulList",B_dayDulList);
		}
		model.addAttribute("b_day",b_day);
		model.addAttribute("cname",cname);
		return getPage;
	}

	@RequestMapping(value=insertTT, method=RequestMethod.POST)
	public String insertbook(@RequestParam("cname") String cname,
							@RequestParam("b_day") String b_day,
							@RequestParam("t_stime") String b_stime,
							Model model) {
		
		System.out.println("b_day:"+b_day);
		
		b_stime = b_day + " " + b_stime;
		System.out.println("b_stime : "+b_stime);
		
		int ctime = clsDao.getCtimeBycname(cname);
		System.out.println(ctime);
		ctime = Integer.parseInt(b_stime.split(" ")[1].split(":")[0])+(ctime/60);;
		System.out.println("ctime : "+ctime);
		
		String t_etime = b_day + " " + ctime + ":00";
		System.out.println("t_etime : "+t_etime);
		
		TimetableBean tb = new TimetableBean(cname,b_day,b_stime,t_etime);
		bookDao.timetableInsert(tb);
		
		return "redirect:/"+getList;
	}

}
