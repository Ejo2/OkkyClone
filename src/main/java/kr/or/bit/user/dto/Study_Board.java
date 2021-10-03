package kr.or.bit.user.dto;

import java.util.Date;
//board 와 b_study 합친 테이블 입니다
public class Study_Board {
    private int no;
    private int bno;
    private String id;
    private String title;
    private String cont;
    private int hit;
    private Date writedate;
    private int good;
    private int removedOk;
    private int scrapNum;
    ///////////////////////b_study
    private int st_categorynum;
    private String sido;
    private String exp;
    private int closeok;

////getter , setter //////////////////
    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
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

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public int getRemovedOk() {
        return removedOk;
    }

    public void setRemovedOk(int removedOk) {
        this.removedOk = removedOk;
    }

    public int getScrapNum() {
        return scrapNum;
    }

    public void setScrapNum(int scrapNum) {
        this.scrapNum = scrapNum;
    }

    public int getSt_categorynum() {
        return st_categorynum;
    }

    public void setSt_categorynum(int st_categorynum) {
        this.st_categorynum = st_categorynum;
    }

    public String getSido() {
        return sido;
    }

    public void setSido(String sido) {
        this.sido = sido;
    }

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public int getCloseok() {
        return closeok;
    }

    public void setCloseok(int closeok) {
        this.closeok = closeok;
    }

    @Override
    public String toString() {
        return "Study_Board{" +
                "no=" + no +
                ", bno=" + bno +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", cont='" + cont + '\'' +
                ", hit=" + hit +
                ", writedate=" + writedate +
                ", good=" + good +
                ", removedOk=" + removedOk +
                ", scrapNum=" + scrapNum +
                ", st_categorynum=" + st_categorynum +
                ", sido='" + sido + '\'' +
                ", exp='" + exp + '\'' +
                ", closeok=" + closeok +
                '}';
    }
}
