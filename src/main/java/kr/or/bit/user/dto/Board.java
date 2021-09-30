package kr.or.bit.user.dto;

import java.util.Date;

    public class Board {
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

        public Board(){

        }

        public Board(int no, int bno, String id, String title, String cont, int hit, Date writedate, int good, int removedOk, int scrapNum) {
            this.no = no;
            this.bno = bno;
            this.id = id;
            this.title = title;
            this.cont = cont;
            this.hit = hit;
            this.writedate = writedate;
            this.good = good;
            this.removedOk = removedOk;
            this.scrapNum = scrapNum;
        }

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

        @Override
        public String toString() {
            return "ColumnDto{" +
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
                    '}';
        }
    }

