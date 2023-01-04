package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class JoinController {

	private final String command = "join.mb";
	private final String idCheck = "joinIdCheck.mb";
	
	private String getPage = "/join";
	//private String gotoLogin = "redirect:/loginForm.mb";

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String joinform() {
		return getPage;
	}
	
	@RequestMapping(value=idCheck,method=RequestMethod.GET)
	@ResponseBody
	public String idChcek(@RequestParam(value="id") String id) {
		
		System.out.println("id : " + id);
		String check ="";
		
		List<MemberBean> mlist = memberDao.getCheckById(id);
		System.out.println("mlist : " + mlist.size());
		
		if(mlist.size() == 0) { //email okay
			check = "Y";
		}
		else { // not okay
			check="N";
		}
		System.out.println("check : " + check);
		return check;
		
		
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String joinform(@Valid MemberBean mb, BindingResult result,
							HttpServletResponse response) throws IOException {
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println(result.hasErrors());
		System.out.println(mb.getId());
		System.out.println(mb.getEmail());
		System.out.println(mb.getPh());
		System.out.println(mb.getPw());
		System.out.println(mb.getName());
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		int cnt = memberDao.joinMember(mb);
		if(cnt==1) {
			writer.print("<script> alert('가입완료') </script>");
			writer.print("<script> location.href='loginForm.mb' </script>");
			writer.flush();
		}
		else {
			writer.print("<script> alert('가입실패') </script>");
			writer.print("<script> location.href='join.mb' </script>");
			writer.flush();
		}
		return null;
	}
}
