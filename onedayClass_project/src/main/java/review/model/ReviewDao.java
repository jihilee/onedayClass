package review.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class ReviewDao {

	private final String namespace = "review.model.Review";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(ReviewBean rb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertReview",rb);	
		System.out.println("insertReview : " + cnt);
	}

	public List<ReviewBean> getAllReviewById(String reviewer) {
		List<ReviewBean> reviewLists = new ArrayList<ReviewBean>();
		reviewLists = sqlSessionTemplate.selectList(namespace+".getAllReviewById",reviewer);
		return reviewLists;
	}

	public void deleteReview(String rnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteReview",rnum);
		System.out.println("deleteReview : " + cnt);
	}

	public List<ReviewBean> getAllReviewByCls(String b_cname) {
		List<ReviewBean> reviewLists = new ArrayList<ReviewBean>();
		reviewLists = sqlSessionTemplate.selectList(namespace+".getAllReviewByCls",b_cname);
		return reviewLists;
	}

	public ReviewBean getReviewByNum(String b_num) {
		ReviewBean rv = sqlSessionTemplate.selectOne(namespace+".getReviewByNum",b_num);
		System.out.println(rv.getBnum());
		return rv;
	
	}

	public void updateReview(ReviewBean rb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateReview",rb);	
		System.out.println("updateReview : " + cnt);
	}
}
