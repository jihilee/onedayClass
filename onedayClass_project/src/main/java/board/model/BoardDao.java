package board.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value="Myboard")
public class BoardDao {
	
	private final String namespace = "board.model.Board";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertBoard(BoardBean board) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertBoard", board);
		System.out.println("insertBoard : " + cnt);
	}

	public List<BoardBean> getContactByEmail(String email) {
		List<BoardBean> bList = new ArrayList<BoardBean>();
		bList = sqlSessionTemplate.selectList(namespace+".getContactByEmail",email);
		return bList;
	}
	
}
