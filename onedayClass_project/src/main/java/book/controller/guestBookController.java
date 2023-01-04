package book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import member.model.MemberBean;

@Controller
@ComponentScan({"cls.*","book.*"}) 
public class guestBookController { 
	private final String command = "guestBook.bk"; 
	private String getPage = "/guestBook";
	private final String selectBtime = "selectBtime.bk";
	
	@Autowired ClsDao clsDao;
	@Autowired BookDao bookDao;
	@Autowired ServletContext config;
	
	@RequestMapping(command) 
	public String bookopen(@RequestParam(value="cnum",required=false) String cnum,
						HttpSession session,Model model) {

		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		ClsBean cb = clsDao.getClsByNum(cnum); 
		
		model.addAttribute("mb",mb);
		model.addAttribute("cb",cb); 
		
		return getPage; 
	}
	
	@RequestMapping(value=selectBtime, method=RequestMethod.POST) 
	public @ResponseBody List<TimetableBean> b_day(@RequestParam("b_day") String b_day,
													@RequestParam("b_cname") String b_cname,
													HttpSession session, Model model, 
													HttpServletResponse response) throws IOException { 
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		model.addAttribute("mb",mb);
		System.out.println(b_cname +"/"+b_day);
		Map<String, String> map = new HashMap<String, String>();
		map.put("t_cname", b_cname);
		map.put("t_day", b_day);
		
		List<TimetableBean> ttLists = new ArrayList<TimetableBean>(); 
		ttLists = bookDao.getTtByCnameBday(map);
		
		return ttLists; 
	}

	@RequestMapping(value=command, method=RequestMethod.POST) 
	public String booking(BookBean bk, HttpSession session,Model model,
						HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter();
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		//System.out.println(bk.getB_num());
		//System.out.println(bk.getB_stime().split(" ")[1]);
		String etime = bk.getB_stime().split(" ")[1];
		bk.setB_person(mb.getId());
		bk.setB_stime(bk.getB_day() + " " + bk.getB_stime().split(" ")[0]);
		
		//System.out.println(bk.getB_day() + " " + etime);
		bk.setB_etime(bk.getB_day() + " " + etime);
		//System.out.println(bk.getB_stime());
		//System.out.println(bk.getB_etime());
		
		int cnt = bookDao.insertBook(bk); 
		bookDao.updateTcheckByNum(String.valueOf(bk.getB_num()));
		
		if(cnt>=0) {
			writer.print("<script> alert('예약 성공'); </script>");
			writer.print("<script> location.href='GuestClsMain.cls' </script>");
			writer.flush(); 
		} else {
			writer.print("<script> alert('예약 실패\n다시 한번 시도해주세요'); </script>");
			writer.print("<script> location.href='guestBook.bk' </script>");
			writer.flush();
		}
		return getPage; 
	}

 }
