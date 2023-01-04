package member.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class GuestMypageController {

	private final String command = "guestMypage.mb"; //mypage open
	private String getPage = "/guestMypage";
	
	private final String command2 = "guestMyUpdate.mb"; //my data update
	private String getPage2 = "/guestMyUpdate";
	
	private final String emailcheck ="myEmailcheck.mb";
	
	@Autowired ServletContext config;

	@Autowired MemberDao memberDao;
	
	@RequestMapping(command)//mypage open
	public String guestMypage(HttpSession session, Model model) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("session id : "+mb.getId());
		
		model.addAttribute("mb", mb);
		return getPage;
	}
	
	@RequestMapping(command2)//mypage open->updatepage
	public String guestMyUpdate(HttpSession session, Model model) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("session id : "+mb.getId());
		
		model.addAttribute("mb", mb);
		return getPage2;
	}
	
	@RequestMapping(emailcheck)
	@ResponseBody
	public String emailcheck(@RequestParam() String email) {
		System.out.println(email);
		String check = "";
		
		int cnt = memberDao.emailcheck(email);
		if(cnt > 0) {
			check = "N";
		}
		else {
			check = "Y";
		}
		return check;
	}
	
	@RequestMapping(value=command2, method=RequestMethod.POST)
	public String guestMyUpdate(@Valid MemberBean mb, BindingResult result) {
		
		memberDao.myDataUpdate(mb);
		
		return "redirect:/"+command;
	}
}
