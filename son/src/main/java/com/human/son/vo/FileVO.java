package com.human.son.vo;

import java.text.SimpleDateFormat;
import java.util.*;

public class FileVO {
	private int fno, bno, cnt;
	private String id, upname, savename, dir, sdate;
	private long len;
	private Date savedate;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUpname() {
		return upname;
	}
	public void setUpname(String upname) {
		this.upname = upname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdate = form.format(savedate);
	}
	@Override
	public String toString() {
		return "FileVO [fno=" + fno + ", bno=" + bno + ", cnt=" + cnt + ", upname=" + upname + ", savename=" + savename
				+ ", dir=" + dir + ", sdate=" + sdate + ", len=" + len + ", savedate=" + savedate + "]";
	}
}
