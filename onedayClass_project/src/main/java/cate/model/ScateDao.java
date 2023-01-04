package cate.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class ScateDao {

	private final String namespace = "cate.model.Scate";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int deleteFrgCate(String bcate) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteFrgCate",bcate);
		System.out.println("deleteFrgCate : " + cnt);
		return cnt;
	}

	public int getScateListTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getScateListTotalCount",map);
		System.out.println("getScateListTotalCount : " + cnt);
		return cnt;
	}

	public List<ScateBean> getScateList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<ScateBean> slist = new ArrayList<ScateBean>();
		slist = sqlSessionTemplate.selectList(namespace+".getScateList",map,rowBounds);
		System.out.println(slist.size());
		return slist;
	}

	public ScateBean getScateByNum(String scatenum) {
		ScateBean sb = sqlSessionTemplate.selectOne(namespace+".getScateByNum",scatenum);
		System.out.println("getScateByNum : "+sb.getBcate()+"/"+sb.getScate()+"/"+sb.getScatenum());
		return sb;
	}

	public int checkScate(String scate) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".checkScate",scate);
		System.out.println("checkScate : " + cnt);
		return cnt;
	}

	public void updateScate(ScateBean scateBean) {
		int cnt = sqlSessionTemplate.update(namespace+".updateScate",scateBean);
		System.out.println("updateScate : " + cnt);
	}

	public void deleteScate(int scatenum) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteScate",scatenum);
		System.out.println("deleteScate cnt : "+cnt);
	}

	public void insertScate(ScateBean sb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertScate",sb);
		System.out.println("insertScate : "+cnt);
	}

	
	
}
