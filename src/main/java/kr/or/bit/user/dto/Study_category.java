package kr.or.bit.user.dto;

public class Study_category {
    private int st_categorynum;
    private String st_category;

    public int getSt_categorynum() {
        return st_categorynum;
    }

    public void setSt_categorynum(int st_categorynum) {
        this.st_categorynum = st_categorynum;
    }

    public String getSt_category() {
        return st_category;
    }

    public void setSt_category(String st_category) {
        this.st_category = st_category;
    }

    @Override
    public String toString() {
        return "Study_category{" +
                "st_categorynum=" + st_categorynum +
                ", st_category='" + st_category + '\'' +
                '}';
    }
}
