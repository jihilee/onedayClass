package book.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookDao;
import book.model.TimetableBean;
import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
@ComponentScan({"cls.*","book.*"}) 
public class AdminTimeTableUpdateController { 
	private final String command = "AdminTimeTableUpdate.bk"; 
	private String getPage = "/AdminTimeTableUpdate";
	
	private final String updateTT = "timeTableUpdate.bk";
	private String getList = "AdminTimeTableList.bk";
 
	@Autowired ClsDao clsDao;
	@Autowired BookDao bookDao;

	@RequestMapping(command) 
	public String bookopen(@RequestParam("t_num") String t_num,
							@RequestParam(value="t_cname",required=false) String t_cname,
							@RequestParam(value="t_day",required=false) String t_day,
							HttpSession session,Model model) {

		TimetableBean tb = bookDao.getTTByNum(t_num);
		
		if(t_day != null) {
			System.out.println(t_cname+"/"+t_day);
			
			List<TimetableBean> B_dayDulList = new ArrayList<TimetableBean>();
			System.out.println(t_day);
			B_dayDulList = bookDao.getSelectB_dayDul(t_day);
			model.addAttribute("B_dayDulList",B_dayDulList);
			
			model.addAttribute("t_day",t_day);
			model.addAttribute("t_cname",t_cname);
		}
		
		model.addAttribute("tb",tb); 
		return getPage; 
	}
	
	@RequestMapping(value=updateTT, method=RequestMethod.POST)
	public String insertbook(@RequestParam("t_num") String t_num,
							@RequestParam("t_cname") String t_cname,
							@RequestParam("t_day") String t_day,
							@RequestParam("t_stime") String t_stime,
							Model model) {
		
		System.out.println("b_day:"+t_day);
		
		t_stime = t_day + " " + t_stime;
		System.out.println("t_stime : "+t_stime);
		
		int ctime = clsDao.getCtimeBycname(t_cname);
		System.out.println(ctime);
		ctime = Integer.parseInt(t_stime.split(" ")[1].split(":")[0])+(ctime/60);;
		System.out.println("ctime : "+ctime);
		
		String t_etime = t_day + " " + ctime + ":00";
		System.out.println("t_etime : "+t_etime);
		
		TimetableBean tb = new TimetableBean(t_num,t_cname,t_day,t_stime,t_etime);
		bookDao.timetableUpdate(tb);
		
		return "redirect:/"+getList;
	}
}
