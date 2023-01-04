package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class LoginController {
	
	private final String command = "loginForm.mb";
	private String getPage = "/GuestClsMain.cls";
	
	private final String searchId = "searchId.mb";
	private String getIdPage = "/searchId";
			
	private final String searchPw = "searchPw.mb";
	private String getPwPage = "/searchPw";
			
	@Autowired MemberDao memberDao;
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String loginform() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String login(@RequestParam(value="id") String id,
						@RequestParam(value="pw") String pw,
						HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		int mcheck = memberDao.memberCheck(map);
	
		if(mcheck>0) { 
			MemberBean mb = memberDao.getMemberId(map);
			session.setAttribute("loginInfo", mb);

			if(mb.getId().equals("admin")) {
				writer.print("<script> alert('로그인 성공'); </script>");
				writer.print("<script> location.href='adminClsList.cls' </script>");
				writer.flush();
			}
			else {
				writer.print("<script> alert('로그인 성공'); </script>");
				writer.print("<script> location.href='GuestClsMain.cls' </script>");
				writer.flush();
			}
			
			return getPage;
		}
		else {
	        writer.print("<script> alert('존재하지 않는 회원입니다.'); </script>");
	        writer.flush();
	        return getPage;
		}
	}
	
	@RequestMapping(value=searchId,method=RequestMethod.GET)
	public String searchId() {
		return getIdPage;
	}
	
	@RequestMapping(value=searchId,method=RequestMethod.POST)
	public String searchId(MemberBean mb,Model model,
							HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", mb.getName());
		map.put("email", mb.getEmail());
		
		MemberBean mbean = memberDao.findId(map);
		
		if(mbean != null) {
			writer.print("<script> alert('"+mbean.getName()+"님의 id는 "+mbean.getId()+" 입니다'); </script>");
			writer.print("<script> location.href='loginForm.mb' </script>");
			writer.flush();
			return null;
		}
		else {
	        writer.print("<script> alert('존재하지 않는 회원입니다.'); </script>");
	        writer.print("<script> location.href='searchId.mb' </script>");
	        writer.flush();
	        return null;
		}
	}
	
	@RequestMapping(value=searchPw,method=RequestMethod.GET)
	public String searchPw() {
		return getPwPage;
	}
	
	@RequestMapping(value=searchPw,method=RequestMethod.POST)
	public String searchPw(MemberBean mb, Model model,
							HttpSession session, HttpServletResponse response) throws IOException {
		String tempw="";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		System.out.println(mb.getName()+"/"+mb.getId()+"/"+mb.getEmail());
		
		MemberBean mbean = new MemberBean(mb.getName(),mb.getId(),mb.getEmail());
		
		MemberBean memberbean = memberDao.findPw(mbean);
		
		if(memberbean == null) {
			writer.print("<script> alert('존재하지 않는 회원입니다.'); </script>");
			writer.print("<script> location.href='searchPw.mb' </script>");
			writer.flush();
			return null;
		}
		else { //update pw, send email
			for(int i=0;i<10;i++) {
				tempw += (char)((Math.random()*48)+58);
			}
			System.out.println("tempw : "+tempw);

			memberbean.setPw(tempw);
			memberDao.updateTempw(memberbean);
			
			sendEmail(memberbean,"findpw");
			
			writer.print("<script>alert('이메일로 임시 비밀번호를 발송하였습니다.');</script>");
			writer.print("<script> location.href='loginForm.mb' </script>");
			writer.flush();

			return null;
		}
	}

	private void sendEmail(MemberBean mb, String div) {
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "leejh129624"; //server email address
		String hostSMTPpw = "wnsh1096@"; //server email pw
		
		String fromEmail = "leejh129624@naver.com"; //보내는사람 이메일주소
		String fromName = "BBWOOD"; //프젝이름 보내는사람이름
		
		//mail content
		String subject = "";
		String msg = "";
	
		if(div.equals("findpw")) {
			subject = "[BBWOOD]임시비밀번호 발송드립니다";
			msg += "<div align='center' style='font-family:verdana;'>";
			msg += "<h3 style='color:red;'>";
			msg += mb.getName()+"님의 임시 비밀번호입니다.</h3>";
			msg += "<h4> 임시 비밀번호 : ";
			msg += mb.getPw()+"</h4> <br><br>";
			msg += "<p># 임시 비밀번호는 사용 후 변경하여 안전하게 계정을 관리해주세요.</p></div>";
		}
	
		String mail = mb.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);//한글
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPid, hostSMTPpw);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();//메일발송
		} catch (EmailException e) {
			System.out.println("메일 발송 실패 : " + e);
			e.printStackTrace();
		}
	}
}
