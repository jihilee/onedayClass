package cate.model;

import org.springframework.web.multipart.MultipartFile;

public class CateBean {

	private int bcatenum;
	private String bcate;
	private String bcateimg;

	public CateBean() {
		super();
	}
	public CateBean(int bcatenum, String bcate, String bcateimg) {
		super();
		this.bcatenum = bcatenum;
		this.bcate = bcate;
		this.bcateimg = bcateimg;
	}
	public int getBcatenum() {
		return bcatenum;
	}
	public void setBcatenum(int bcatenum) {
		this.bcatenum = bcatenum;
	}
	public String getBcate() {
		return bcate;
	}
	public void setBcate(String bcate) {
		this.bcate = bcate;
	}
	public String getBcateimg() {
		return bcateimg;
	}
	public void setBcateimg(String bcateimg) {
		this.bcateimg = bcateimg;
	}
	

	private MultipartFile upload; 
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("setUpload : " + upload);
		System.out.println("upload.getName : " + upload.getName());
		this.bcateimg = upload.getOriginalFilename();
	}
	
	
}
