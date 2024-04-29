package com.human.son.vo;

import java.text.*;
import java.util.*;

public class SurveyVO {
	private int rno, qno, tpno, qano, qupno, svno, cnt;
	private double per;
	private int[] qanos;
	private String id, title, body, sdate, ing;
	private Date startDate, endDate, adate;
	private ArrayList<SurveyVO> bogis;
	public int[] getQanos() {
		return qanos;
	}
	public void setQanos(int[] qanos) {
		this.qanos = qanos;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public ArrayList<SurveyVO> getBogis() {
		return bogis;
	}
	public void setBogis(ArrayList<SurveyVO> bogis) {
		this.bogis = bogis;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getTpno() {
		return tpno;
	}
	public void setTpno(int tpno) {
		this.tpno = tpno;
	}
	public int getQano() {
		return qano;
	}
	public void setQano(int qano) {
		this.qano = qano;
	}
	public int getQupno() {
		return qupno;
	}
	public void setQupno(int qupno) {
		this.qupno = qupno;
	}
	public int getSvno() {
		return svno;
	}
	public void setSvno(int svno) {
		this.svno = svno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public double getPer() {
		return per;
	}
	public void setPer(double per) {
		this.per = per;
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
	public void setSdate(Date date) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(date);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	@Override
	public String toString() {
		return "SurveyVO [rno=" + rno + ", qno=" + qno + ", tpno=" + tpno + ", qano=" + qano + ", qupno=" + qupno
				+ ", svno=" + svno + ", cnt=" + cnt + ", per=" + per + ", qanos=" + Arrays.toString(qanos) + ", id="
				+ id + ", title=" + title + ", body=" + body + ", sdate=" + sdate + ", ing=" + ing + ", startDate="
				+ startDate + ", endDate=" + endDate + ", adate=" + adate + ", bogis=" + bogis + "]";
	}
}
