package review.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import book.model.BookBean;
import book.model.BookDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
@ComponentScan({"book.*","review.*"})
public class InsertReviewController {
	
	private final String command = "insertReview.rv";
	private String getPage = "/insertReview";
	
	private String gotoList = "redirect:/myReviewList.rv";

	@Autowired
	ServletContext application;
	
	@Autowired 
	BookDao bookDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String insertReview(@RequestParam("b_num") String b_num,
								Model model) {
		
		BookBean bb = bookDao.getBookDetailByBnum(b_num);
		model.addAttribute("bb",bb);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String insertReview(ReviewBean rb, 
			@RequestParam(required=false) MultipartFile[] review_images, 
			Model model) {

		if(review_images != null) {
			
			for(MultipartFile multipartFile : review_images) {
				
				String uploadFolder = application.getRealPath("/resources/assets/img/upload");
				String uploadFileName = multipartFile.getOriginalFilename();
				System.out.println("uploadFileName:"+uploadFileName);
				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				File saveFile = new File(uploadFolder, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);
				} catch (Exception e) {
					/* log.error(e.getMessage()); */
				} 
			}
			
			String names = "";
			
			for(MultipartFile multipartFile : review_images) {
				for(int i=0;i<review_images.length; i++) {
					System.out.println(multipartFile.getOriginalFilename());
					names += multipartFile.getOriginalFilename();
					System.out.println("i:"+i);
					if(i+1 != review_images.length) { 
						names += ","; //몰라
						break;
					}
				}
			}
			
			rb.setRimage(names);
			System.out.println("review img:"+rb.getRimage());
		}
		
		System.out.println(rb.getBnum());
		System.out.println(rb.getRcontent());
		System.out.println(rb.getReviewer());
		System.out.println(rb.getRnum());
		System.out.println(review_images);
		System.out.println(rb.getRimage());
		
		reviewDao.insertReview(rb);
		
		return gotoList;
	}
}
