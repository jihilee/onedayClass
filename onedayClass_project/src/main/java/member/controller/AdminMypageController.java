package member.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cls.model.ClsBean;
import cls.model.ClsDao;
import member.model.MemberBean;
import member.model.MemberDao;


@Controller
@ComponentScan({"cls.*","member.*"})
public class AdminMypageController {

	private final String command = "adminMypage.mb";
	private String getPage = "/adminMypage";
	
	private final String command2 = "adminMypageUpdate.mb"; //my data update
	private String getPage2 = "/adminMyUpdate";
	
	private final String idCheck = "adminIdCheck.mb";
	
	private final String emailCheck = "adminEmailCheck.mb";
	
	@Autowired ServletContext config;

	@Autowired MemberDao memberDao;
	
	@Autowired ClsDao clsDao;
	
	@RequestMapping(command)
	public String admindataupdate(HttpSession session, Model model) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		ClsBean cb = clsDao.getClsAddress();
		model.addAttribute("cb",cb);
		model.addAttribute("mb",mb);
		return getPage;

	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String admindataupdate(MemberBean mb, ClsBean cb, Model model) {
		
		model.addAttribute("cb",cb);
		model.addAttribute("mb",mb);
		return getPage2;
	}
	
	@RequestMapping(value=command2, method=RequestMethod.POST)
	public String adminMyUpdate(MemberBean mb, ClsBean cb) {
		
		memberDao.updateAdminData(mb);
		clsDao.updateAddress(cb);
		return "redirect:/"+command;
	}
	
	@RequestMapping(idCheck)
	@ResponseBody
	public String adminIdcheck(@RequestParam("id") String id) {
		
		System.out.println("adminIdcheck : " +id);
		String check = "";
		int cnt = memberDao.CheckAdminIdDul(id);
		if(cnt == 0) {
			check = "Y";
		}
		else {
			check = "N";
		}
		return check;
	}
	
	@RequestMapping(emailCheck)
	@ResponseBody
	public String adminEmailcheck(@RequestParam("email") String email) {
		
		System.out.println("adminEmailcheck : " +email);
		String emailcheck = "";
		int exist = memberDao.CheckAdminEmailDul(email);
		if(exist == 0) {
			emailcheck = "Y";
		}
		else {
			emailcheck = "N";
		}
		return emailcheck;
	}
	
	
}
