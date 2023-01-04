package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;

@Controller
public class LogoutController {

	private final String command = "logout.mb";
	private String getPage = "GuestClsMain.cls";
	
	@Autowired MemberDao memberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter writer=response.getWriter();
		
		session.removeAttribute("loginInfo");
		writer.println("<script> alert('로그아웃합니다');</script>");
	    writer.println("<script> location.href='GuestClsMain.cls' </script>");
	    writer.flush();
		return null;
	}
}
