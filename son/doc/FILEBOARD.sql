CREATE TABLE fileboard(
    fbno NUMBER(6)
        CONSTRAINT FBRD_NO_PK PRIMARY KEY,
    title VARCHAR2(30 CHAR)
        CONSTRAINT FBRD_TITLE_NN NOT NULL,
    writer NUMBER(4)
        CONSTRAINT FBRD_MNO_FK REFERENCES member(mno)
        CONSTRAINT FBRD_MNO_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT FBRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT FBRD_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT FBRD_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT FBRD_SHOW_NN NOT NULL
);

-- 파일 게시판 글번호 시퀀스
CREATE SEQUENCE fbrdseq
    START WITH 1001
    MAXVALUE 999999
    NOCACHE
    NOCYCLE
;

CREATE TABLE fileinfo(
    fileno NUMBER(7) 
        CONSTRAINT FINFO_NO_PK PRIMARY KEY,
    fbno NUMBER(6)
        CONSTRAINT FINFO_FBNO_FK REFERENCES fileboard(fbno)
        CONSTRAINT FINFO_FBNO_NN NOT NULL,
    upname VARCHAR2(50 CHAR)
        CONSTRAINT FINFO_UNAME_NN NOT NULL,
    savename VARCHAR2(50 CHAR)
        CONSTRAINT FINFO_SNAME_UK UNIQUE
        CONSTRAINT FINFO_SNAME_NN NOT NULL,
    dir VARCHAR2(200 CHAR) DEFAULT '/upload/'
        CONSTRAINT FINFO_DIR_NN NOT NULL,
    len NUMBER,
    savedate DATE DEFAULT sysdate
        CONSTRAINT FINFO_SDATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT FINFO_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT FINFO_SHOW_NN NOT NULL
);