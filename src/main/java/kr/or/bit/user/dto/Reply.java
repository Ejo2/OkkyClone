package kr.or.bit.user.dto;

import java.util.Date;

public class Reply {
    private int no;
    private String id;
    private String userid;
    private String pwd;
    private String content;
    private Date writedate;
    private int idx_fk;

    public Reply(){

    }

    public Reply(int no, String id, String userid, String pwd, String content, Date writedate, int idx_fk) {
        this.no = no;
        this.id = id;
        this.userid = userid;
        this.pwd = pwd;
        this.content = content;
        this.writedate = writedate;
        this.idx_fk = idx_fk;
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

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public int getIdx_fk() {
        return idx_fk;
    }

    public void setIdx_fk(int idx_fk) {
        this.idx_fk = idx_fk;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "no=" + no +
                ", id='" + id + '\'' +
                ", userid='" + userid + '\'' +
                ", pwd='" + pwd + '\'' +
                ", content='" + content + '\'' +
                ", writedate=" + writedate +
                ", idx_fk=" + idx_fk +
                '}';
    }
}
