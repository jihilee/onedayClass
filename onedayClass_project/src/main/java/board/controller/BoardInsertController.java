package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardInsertController {

	private final String command = "boardInsert.bd";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String insert(@ModelAttribute("board") @Valid BoardBean board, 
								BindingResult result, HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(result.hasErrors()) {
			System.out.println("error");
			return "redirect:/GuestClsMain.cls?id=#contact";
		}
		
		System.out.println(board.getSubject());
		System.out.println(board.getContent());
		System.out.println(board.getEmail());
		System.out.println(board.getName());
		System.out.println(board.getContent());
		System.out.println(board.getPw());
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		if(mb==null) {
			board.setSubject("비회원 문의글입니다");
		}
		else {
			board.setSubject(board.getName()+"님 문의글입니다");
		}
		
		boardDao.insertBoard(board);
		
		if(mb==null) {
			writer.print("<script> alert('비회원 문의글이 등록되었습니다'); </script>");
			writer.print("<script> location.href='GuestClsMain.cls' </script>");
			writer.flush();
		}
		else {
			writer.print("<script> alert('회원님의 문의글이 등록되었습니다'); </script>");
			writer.print("<script> location.href='guestBoardList.bd' </script>");
			writer.flush();
		}
		
		return null;
		
	}
	
}
