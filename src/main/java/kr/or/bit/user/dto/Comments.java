package kr.or.bit.user.dto;

import java.util.Date;

public class Comments {
    private int rno;  //댓글번호
    private int no;    //글번호
    private String id;
    private String rcont;
    private Date rdate;
    private int removedOk;
    private String photo;

    public Comments() {

    }

    public Comments(int rno, int no, String id, String rcont, Date rdate, int removedOk) {
        this.rno = rno;
        this.no = no;
        this.id = id;
        this.rcont = rcont;
        this.rdate = rdate;
        this.removedOk = removedOk;
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRcont() {
        return rcont;
    }

    public void setRcont(String rcont) {
        this.rcont = rcont;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public int getRemovedOk() {
        return removedOk;
    }

    public void setRemovedOk(int removedOk) {
        this.removedOk = removedOk;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Comments{" +
                "rno=" + rno +
                ", no=" + no +
                ", id='" + id + '\'' +
                ", rcont='" + rcont + '\'' +
                ", rdate=" + rdate +
                ", removedOk=" + removedOk +
                '}';
    }

}
