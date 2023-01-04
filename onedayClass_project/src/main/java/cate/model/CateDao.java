package cate.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;

@Component
public class CateDao {

	private final String namespace = "cate.model.Cate";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getCateListTotalCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getCateListTotalCount");
		System.out.println("getCateListTotalCount : " + cnt);
		return cnt;
	}
	
	public List<CateBean> getCateList() {
		List<CateBean> clist = new ArrayList<CateBean>();
		clist = sqlSessionTemplate.selectList(namespace+".getCateList");
		System.out.println(clist.size());
		return clist;
	}

	public CateBean getCateByNum(String bcatenum) {
		CateBean cb = sqlSessionTemplate.selectOne(namespace+".getCateByNum",bcatenum);
		System.out.println("getCateByNum : "+cb.getBcate()+"/"+cb.getBcatenum());
		return cb;
	}

	public int checkBcate(String bcate) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".checkBcate",bcate);
		System.out.println("checkBcate : " + cnt);
		return cnt;
	}

	public void updateBcate(CateBean cateBean) {
		int cnt = sqlSessionTemplate.update(namespace+".updateBcate",cateBean);
		System.out.println("updateBcate : " + cnt);
	}

	public void deleteCate(int bcatenum) {
		sqlSessionTemplate.delete(namespace+".deleteCate",bcatenum);
	}

	public void insertBcate(CateBean cb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertBcate",cb);
		System.out.println("insertBcate : "+cnt);
	}

}
