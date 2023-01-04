package board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class GuestBoardListController {

	private final String command = "guestBoardList.bd";
	private String getPage = "/guestBoardList";

	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(command)
	public String list(HttpSession session,Model model) {
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		List<BoardBean> bList = new ArrayList<BoardBean>();
		bList = boardDao.getContactByEmail(mb.getEmail());
		
		model.addAttribute("bList",bList);
		return getPage;
	}
}
