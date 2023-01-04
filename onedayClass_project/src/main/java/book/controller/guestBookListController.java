package book.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;
import member.model.MemberBean;

@Controller
public class guestBookListController {
	private final String command = "guestBookList.bk";
	private String getPage = "/guestMyBookList";
	
	private final String command2 = "guestBookDetail.bk";
	private String getPage2 = "/guestBookDetail";
	
	@Autowired BookDao bookDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(command)
	public String bookopen(HttpSession session,Model model) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		List<BookBean> guestbookLists = new ArrayList<BookBean>();
		guestbookLists = bookDao.getBookListById(mb.getId());
		
		model.addAttribute("guestbookLists",guestbookLists);
		model.addAttribute("mb",mb);
		return getPage;
	}
	
	@RequestMapping(command2)
	public String bookdetail(@RequestParam(value="b_num") String b_num,
							HttpSession session,Model model) {
		
		BookBean bb = bookDao.getBookDetailByBnum(b_num);
		
		model.addAttribute("bb",bb);
		return getPage2;
	}
}
