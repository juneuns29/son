package com.human.son.vo;

import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.web.multipart.*;

public class BoardVO {
	private int rno, bno, mno, ano, cnt;
	private String name, id, title, body, sdate, sname;
	private ArrayList<String> filenames;
	private MultipartFile[] file;
	private Date wdate;
	/*
		웹 통신의 방식은 문자단위로 통신을 한다.
		그런데 파일 전송은 문자단위로 하면 파일이 손상이 된다.
		따라서 파일 전송은 바이트 단위로 해야하고
		그결과 파일 전송이 필요한 뷰에서는 
		문자 단위가 아닌  byte 단위로 서버에 데이터를 전송해야 한다.
		
		방법은 전송할 폼의 encType을 multipart/form-data 로 하고 전송해야 한다.
		
		이때 전송되는 파일은 MultipartFile 타입으로 서버에 전송이 되고
		꺼내는 방식도 기존에 꺼내던 파라미터로 꺼내는 방식이 아닌
		다른 방식으로 꺼내야 한다.
		
		이때 전송되는 파일이 한개이면 일반 변수로 만들어주면 되는데
		지금처럼 여러개의 파일이 업로드 되는 경우는
		name 속성이 같은 태그가 여러개가 전송이 될 것이므로
		이럴 때는 배열형태로 받아야 한다.
	 */
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public ArrayList<String> getFilenames() {
		return filenames;
	}
	public void setFilenames(ArrayList<String> filenames) {
		this.filenames = filenames;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdate = form.format(wdate);
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", mno=" + mno + ", ano=" + ano + ", cnt=" + cnt + ", name=" + name + ", id="
				+ id + ", title=" + title + ", body=" + body + ", sdate=" + sdate + ", sname=" + sname + ", filenames="
				+ filenames + ", file=" + Arrays.toString(file) + ", wdate=" + wdate + "]";
	}
}
