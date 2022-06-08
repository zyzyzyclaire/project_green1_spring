drop  table review cascade constraints;
drop  table user_t cascade constraints;
drop  table cart cascade constraints;
drop  table theather cascade constraints;
drop  table price cascade constraints;
drop  table goods cascade constraints;
drop  table hall cascade constraints;
drop  table seat cascade constraints;
drop  table movie cascade constraints;
drop table screen  cascade constraints;
drop table  book  cascade constraints;
drop table  history  cascade constraints;
drop table  notice_t  cascade constraints;
drop table  FAQ  cascade constraints;
drop  table hall_time cascade constraints;

CREATE TABLE book (
                      b_code  NUMBER(10) NOT NULL,
                      b_yn    VARCHAR2(100),
                      sc_code NUMBER(10) NOT NULL,
                      h_code  NUMBER(10) NOT NULL,
                      se_code varchar2(5) NOT NULL,
                      u_id    VARCHAR2(100 BYTE) NOT NULL,
                      m_code NVARCHAR2(10),
                      b_date DATE NOT NULL,
                      p_code NUMBER(10) NOT NULL,
                      h_time VARCHAR2(10) NOT NULL
);
ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( b_code );

CREATE TABLE cart (
                      c_code   NUMBER(10) NOT NULL,
                      c_amount NUMBER(10),
                      g_code   NUMBER(10) NOT NULL,
                      u_id     VARCHAR2(100 BYTE) NOT NULL,
                      g_price   number(10)
);
ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( c_code );

CREATE TABLE FAQ(
    F_CODE NUMBER(3) CONSTRAINT FAQ_F_CODE_PK PRIMARY KEY
    ,U_ID VARCHAR2(10) -- CONSTRAINT FAQ_U_ID_FK REFERENCES USER_T(U_ID)
    ,F_CATEGORY VARCHAR2(20 BYTE)
    ,F_TITLE VARCHAR2(200 BYTE)
    ,F_CONTENT VARCHAR2(3500 BYTE)
    ,F_DATE DATE DEFAULT SYSDATE
    ,F_NUM NUMBER (3) DEFAULT 0
);
ALTER TABLE faq ADD CONSTRAINT faq_pk PRIMARY KEY ( f_code );
CREATE TABLE goods (
                       g_code  NUMBER(10) NOT NULL,
                       g_name  VARCHAR2(100 BYTE),
                       g_price NUMBER(10),
                       img_origin VARCHAR2(100 BYTE),
                       img_1  VARCHAR2(100 BYTE)
);
ALTER TABLE goods ADD CONSTRAINT goods_pk PRIMARY KEY ( g_code );
CREATE TABLE goodsimg (
                          g_code  NUMBER(10) NOT NULL,
                          img_code  NUMBER(10) NOT NULL,
                          img_origin VARCHAR2(100 BYTE),
                          img_2  VARCHAR2(100 BYTE)
);
ALTER TABLE goodsimg ADD CONSTRAINT goodsimg_pk PRIMARY KEY ( img_code );
CREATE TABLE hall (
                      h_code NUMBER(10) NOT NULL,
                      h_name VARCHAR2(100),
                      t_code NUMBER(10) NOT NULL
);
ALTER TABLE hall ADD CONSTRAINT hall_pk PRIMARY KEY ( h_code );
CREATE TABLE history (
                         h_code   NVARCHAR2(10) NOT NULL,
                         c_amount NUMBER(10),
                         u_id     VARCHAR2(100 BYTE) NOT NULL,
                         g_code   NUMBER(10) NOT NULL,
                         g_price number(10)
);
ALTER TABLE history ADD CONSTRAINT history_pk PRIMARY KEY ( h_code );
CREATE TABLE movie (
                       m_code   VARCHAR2(10) NOT NULL,
                       m_date   DATE,
                       m_title  VARCHAR2(1000),
                       m_intro  VARCHAR2(1000 BYTE),
                       m_detail  VARCHAR2(4000 BYTE),
                       m_time   NUMBER(10,0),
                       m_period  DATE,
                       m_grade  NUMBER(10,0),
                       m_genre  VARCHAR2(1000),
                       m_director VARCHAR2(1000),
                       m_actor VARCHAR2(1000),
                       m_rate   NUMBER(10) default 0,
                       m_originimg VARCHAR2(1000),
                       m_position VARCHAR2(1000),
                       m_pics   VARCHAR2(1000)
);
CREATE TABLE movieimg (
                          m_imgcode     VARCHAR2(10) NOT NULL,
                          m_code     VARCHAR2(10) NOT NULL,
                          m_originimg VARCHAR2(1000),
                          m_pics     VARCHAR2(1000)
);
ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( m_code );
CREATE TABLE notice_t (
                          n_code    NUMBER(5),
                          n_title   VARCHAR2(50),
                          n_content VARCHAR2(3000),
                          n_date    DATE,
                          n_view    NUMBER(5),
                          u_id      VARCHAR2(100 BYTE) NOT NULL
);
CREATE TABLE price (
                       p_code  NUMBER(10) NOT NULL,
                       p_price NUMBER(10)
);
ALTER TABLE price ADD CONSTRAINT price_pk PRIMARY KEY ( p_code );
CREATE TABLE review (
                        r_code    NUMBER(10) NOT NULL,
                        r_name    VARCHAR2(100 BYTE),
                        r_content VARCHAR2(100 BYTE),
                        r_date    DATE
);
ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( r_code );
CREATE TABLE screen (
                        sc_code NUMBER(10) NOT NULL,
                        m_code  NUMBER(10) NOT NULL,
                        h_num NUMBER(2),
                        m_date DATE,
                        m_period DATE
);
ALTER TABLE screen ADD CONSTRAINT screen_pk PRIMARY KEY ( sc_code );
CREATE TABLE seat (
                      h_num NUMBER(2) NOT NULL,
                      se_code VARCHAR2(5) NOT NULL
);
CREATE TABLE theather (
                          t_code NUMBER(10) NOT NULL,
                          t_name VARCHAR2(100 BYTE),
                          t_addr VARCHAR2(300 BYTE),
                          t_tel  VARCHAR2(100 BYTE)
);
ALTER TABLE theather ADD CONSTRAINT theather_pk PRIMARY KEY ( t_code );
CREATE TABLE USER_T(
U_ID VARCHAR2(100)NOT NULL
    ,U_NAME VARCHAR2(100)NOT NULL
    ,U_PWD VARCHAR2(100)NOT NULL
    ,U_ADDR1 VARCHAR2(1000)NOT NULL
    ,U_ADDR2 VARCHAR2(1000)NOT NULL
    ,U_ADDR3 VARCHAR2(1000)NOT NULL
    ,U_DATE DATE
    ,U_BIRTH VARCHAR2(100)NOT NULL
    ,U_tel VARCHAR2(100)NOT NULL
    ,U_EMAIL VARCHAR2(100)NOT NULL
    ,U_AUTH VARCHAR2(10)default 'C'
    ,U_POINT NUMBER(30)default 0
    ,U_MONEY NUMBER(30)default 0
);
CREATE TABLE REVIEW
(R_CODE NUMBER(10) CONSTRAINT REVIEW_R_CODE_PK PRIMARY KEY
    ,R_NAME VARCHAR2(1000 BYTE)
    ,U_ID VARCHAR(100)
    ,B_CODE NUMBER(10)
    ,B_YN NUMBER(1)
    ,R_DATE DATE DEFAULT SYSDATE
    ,R_RATE NUMBER(2));
ALTER TABLE user_t ADD CONSTRAINT user_t_pk PRIMARY KEY ( u_id );
ALTER TABLE REVIEW DROP COLUMN B_YN;
ALTER TABLE REVIEW ADD R_GOOD NUMBER(4) DEFAULT 0;

CREATE TABLE GOOD
(GO_CODE NUMBER(10) CONSTRAINT GOOD_GO_CODE_PK PRIMARY KEY
    ,U_ID VARCHAR2(100)
    ,R_CODE NUMBER(10)
    ,GO_YN NUMBER(1) DEFAULT 0
);
CREATE TABLE QNA
(Q_CODE NUMBER (5) CONSTRAINT QNA_Q_CODE_PK PRIMARY KEY
    ,U_ID VARCHAR2(10)-- CONSTRAINT FAQ_U_ID_FK REFERENCES USER_T(U_ID)
    ,Q_CATEGORY VARCHAR2(30 BYTE)
    ,Q_TITLE VARCHAR2 (100 BYTE)
    ,Q_CONTENT VARCHAR2 (3000 BYTE)
    ,Q_DATE DATE DEFAULT SYSDATE
    ,Q_NUM NUMBER (3) DEFAULT 0
    ,Q_EMAIL  VARCHAR2(30 BYTE)
    ,Q_ANSWER VARCHAR2(3500 BYTE)
);
CREATE TABLE NOTICE_T
(N_CODE NUMBER (5) CONSTRAINT NOTICE_N_CODE_PK PRIMARY KEY
    ,U_ID VARCHAR2(10)-- CONSTRAINT FAQ_U_ID_FK REFERENCES USER_T(U_ID)
    ,N_TITLE VARCHAR2 (50 BYTE)
    ,N_CONTENT VARCHAR2(3000 BYTE)
    ,N_DATE DATE DEFAULT SYSDATE
    ,N_VIEW NUMBER (5)
    ,N_NUM NUMBER (3) DEFAULT 0
);
create table hall_time(
                          h_num NUMBER(2) NOT NULL,
                          h_time VARCHAR2(10) NOT NULL,
                          h_st NUMBER(2) NOT NULL
);



ALTER TABLE book
    ADD CONSTRAINT book_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_screen_fk FOREIGN KEY ( sc_code )
        REFERENCES screen ( sc_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_seat_fk FOREIGN KEY ( se_code )
        REFERENCES seat ( se_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_price_fk FOREIGN KEY ( p_code )
        REFERENCES price ( p_code ) ON DELETE CASCADE;
ALTER TABLE book
    ADD CONSTRAINT book_hall_time_fk FOREIGN KEY ( h_time )
        REFERENCES hall_time ( h_time ) ON DELETE CASCADE;


ALTER TABLE cart
    ADD CONSTRAINT cart_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE faq
    ADD CONSTRAINT faq_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE cart
    ADD CONSTRAINT g_code FOREIGN KEY ( g_code )
        REFERENCES goods ( g_code ) ON DELETE CASCADE;
ALTER TABLE history
    ADD CONSTRAINT history_goods_fk FOREIGN KEY ( g_code )
        REFERENCES goods ( g_code ) ON DELETE CASCADE;
ALTER TABLE history
    ADD CONSTRAINT history_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;
ALTER TABLE notice_t
    ADD CONSTRAINT notice_t_user_t_fk FOREIGN KEY ( u_id )
        REFERENCES user_t ( u_id ) ON DELETE CASCADE;


ALTER TABLE screen
    ADD CONSTRAINT screen_hall_fk FOREIGN KEY ( h_code )
        REFERENCES hall ( h_code ) ON DELETE CASCADE;
ALTER TABLE screen
    ADD CONSTRAINT screen_theather_fk FOREIGN KEY ( m_code )
        REFERENCES theather ( t_code ) ON DELETE CASCADE;




ALTER TABLE hall
    ADD CONSTRAINT t_code FOREIGN KEY ( t_code )
        REFERENCES theather ( t_code ) ON DELETE CASCADE;

--비활성화
--ALTER TABLE 유저명.테이블명 DISABLE CONSTRAINT 제약조건명;
ALTER TABLE book  DISABLE CONSTRAINT book_hall_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_screen_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_seat_fk;
ALTER TABLE book  DISABLE CONSTRAINT book_user_t_fk;
ALTER TABLE cart  DISABLE CONSTRAINT cart_user_t_fk;
ALTER TABLE faq  DISABLE CONSTRAINT faq_user_t_fk;
ALTER TABLE cart  DISABLE CONSTRAINT g_code;
ALTER TABLE history  DISABLE CONSTRAINT history_goods_fk;
ALTER TABLE history  DISABLE CONSTRAINT history_user_t_fk;
ALTER TABLE notice_t  DISABLE CONSTRAINT notice_t_user_t_fk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_hall_fk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_theather_fk;
ALTER TABLE hall  DISABLE CONSTRAINT t_code;
ALTER TABLE book DISABLE CONSTRAINT book_pk;
ALTER TABLE cart  DISABLE CONSTRAINT cart_pk;
ALTER TABLE faq  DISABLE CONSTRAINT faq_pk;
ALTER TABLE goods  DISABLE CONSTRAINT goods_pk;
ALTER TABLE goodsimg  DISABLE CONSTRAINT goodsimg_pk;
ALTER TABLE hall  DISABLE CONSTRAINT hall_pk;
ALTER TABLE history  DISABLE CONSTRAINT history_pk;
ALTER TABLE movie  DISABLE CONSTRAINT movie_pk;
ALTER TABLE price  DISABLE CONSTRAINT price_pk;
ALTER TABLE review  DISABLE CONSTRAINT review_pk;
ALTER TABLE screen  DISABLE CONSTRAINT screen_pk;
ALTER TABLE seat  DISABLE CONSTRAINT seat_pk;
ALTER TABLE theather   DISABLE CONSTRAINT theather_pk;
ALTER TABLE user_t   DISABLE CONSTRAINT user_t_pk;
ALTER TABLE user_t   DISABLE CONSTRAINT goodsimg_pk;
--제약조건활성화
--ALTER TABLE 유저명.테이블명 ENABLE NOVALIDATE CONSTRAINT 제약조건명; /*기존 데이터에 대한 정합성 체크 없
ALTER TABLE NOTICE_T MODIFY N_DATE DEFAULT SYSDATE;
ALTER TABLE FAQ MODIFY F_DATE DEFAULT SYSDATE;
ALTER TABLE QNA MODIFY Q_DATE DEFAULT SYSDATE;

insert into book values(1,1,1,1,1,'wjdcksgml',1,'1997-12-19');
insert into review values(1,1,'wjdcksgml',1,1,'1997-12-19',1);
insert into faq values(1,'wjdcksgml',1,1,1,'1997-12-19',1);
insert into NOTICE_T values(1,'wjdcksgml',1,1,'1997-12-19',1,1);
insert into QNA values(1,'wjdcksgml',1,1,1,'1997-12-19',1,1,1);
insert into history values(1,1,'wjdcksgml',1,1);
insert into movie values(1,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(2,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(3,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(4,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(5,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(6,'2022-06-03','제목','소개','영화상세설명',1,'2022-06-02',1,'장르','감독명','배우',1,'3.jpg','16542335726743.jpg',null);

--hall_time

INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'09:00',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'11:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'13:30',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'15:45',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'18:00',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'20:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(1,'22:30',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'09:10',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'12:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'15:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'18:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(2,'21:10',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'09:45',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'12:55',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'16:05',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'19:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(3,'22:25',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'09:30',1);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'12:25',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'15:20',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'18:15',0);
INSERT INTO hall_time(h_num,h_time,h_st) VALUES(4,'21:10',0);

--hall
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1101,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1102,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1103,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1104,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1111,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1112,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1113,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1114,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1121,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1122,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1123,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1124,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1131,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1132,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1133,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1134,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1141,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1142,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1143,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1144,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1151,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1152,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1153,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1154,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1161,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1162,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1163,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1164,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1171,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1172,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1173,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1174,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1181,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1182,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1183,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1184,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2101,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2102,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2103,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2104,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2111,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2112,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2113,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2114,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2121,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2122,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2123,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2124,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2131,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2132,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2133,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2134,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2141,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2142,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2143,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2144,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2151,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2152,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2153,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2154,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2161,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2162,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2163,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2164,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2171,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2172,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2173,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2174,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2181,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2182,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2183,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2184,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2191,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2192,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2193,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2194,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2201,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2202,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2203,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2204,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2211,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2212,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2213,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2214,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9011,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9012,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9013,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9014,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9021,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9022,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9023,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9024,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9031,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9032,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9033,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9034,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9041,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9042,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9043,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9044,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9051,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9052,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9053,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9054,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9061,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9062,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9063,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9064,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9071,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9072,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9073,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9074,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9081,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9082,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9083,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9084,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9091,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9092,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9093,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9094,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9101,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9102,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9103,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9104,'4관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9111,'1관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9112,'2관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9113,'3관');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9114,'4관');

--price
INSERT INTO price(p_code, p_price) VALUES(20001,8000);
INSERT INTO price(p_code, p_price) VALUES(20002,10000);
INSERT INTO price(p_code, p_price) VALUES(20101,11000);
INSERT INTO price(p_code, p_price) VALUES(20102,14000);

--seat
INSERT INTO seat(h_num, se_code) VALUES(1,'a1');
INSERT INTO seat(h_num, se_code) VALUES(1,'a2');
INSERT INTO seat(h_num, se_code) VALUES(1,'a3');
INSERT INTO seat(h_num, se_code) VALUES(1,'a4');
INSERT INTO seat(h_num, se_code) VALUES(1,'a5');
INSERT INTO seat(h_num, se_code) VALUES(1,'a6');
INSERT INTO seat(h_num, se_code) VALUES(1,'a7');
INSERT INTO seat(h_num, se_code) VALUES(1,'a8');
INSERT INTO seat(h_num, se_code) VALUES(1,'a9');
INSERT INTO seat(h_num, se_code) VALUES(1,'a10');
INSERT INTO seat(h_num, se_code) VALUES(1,'b1');
INSERT INTO seat(h_num, se_code) VALUES(1,'b2');
INSERT INTO seat(h_num, se_code) VALUES(1,'b3');
INSERT INTO seat(h_num, se_code) VALUES(1,'b4');
INSERT INTO seat(h_num, se_code) VALUES(1,'b5');
INSERT INTO seat(h_num, se_code) VALUES(1,'b6');
INSERT INTO seat(h_num, se_code) VALUES(1,'b7');
INSERT INTO seat(h_num, se_code) VALUES(1,'b8');
INSERT INTO seat(h_num, se_code) VALUES(1,'b9');
INSERT INTO seat(h_num, se_code) VALUES(1,'b10');
INSERT INTO seat(h_num, se_code) VALUES(1,'c1');
INSERT INTO seat(h_num, se_code) VALUES(1,'c2');
INSERT INTO seat(h_num, se_code) VALUES(1,'c3');
INSERT INTO seat(h_num, se_code) VALUES(1,'c4');
INSERT INTO seat(h_num, se_code) VALUES(1,'c5');
INSERT INTO seat(h_num, se_code) VALUES(1,'c6');
INSERT INTO seat(h_num, se_code) VALUES(1,'c7');
INSERT INTO seat(h_num, se_code) VALUES(1,'c8');
INSERT INTO seat(h_num, se_code) VALUES(1,'c9');
INSERT INTO seat(h_num, se_code) VALUES(1,'c10');
INSERT INTO seat(h_num, se_code) VALUES(1,'d1');
INSERT INTO seat(h_num, se_code) VALUES(1,'d2');
INSERT INTO seat(h_num, se_code) VALUES(1,'d3');
INSERT INTO seat(h_num, se_code) VALUES(1,'d4');
INSERT INTO seat(h_num, se_code) VALUES(1,'d5');
INSERT INTO seat(h_num, se_code) VALUES(1,'d6');
INSERT INTO seat(h_num, se_code) VALUES(1,'d7');
INSERT INTO seat(h_num, se_code) VALUES(1,'d8');
INSERT INTO seat(h_num, se_code) VALUES(1,'d9');
INSERT INTO seat(h_num, se_code) VALUES(1,'d10');
INSERT INTO seat(h_num, se_code) VALUES(1,'e1');
INSERT INTO seat(h_num, se_code) VALUES(1,'e2');
INSERT INTO seat(h_num, se_code) VALUES(1,'e3');
INSERT INTO seat(h_num, se_code) VALUES(1,'e4');
INSERT INTO seat(h_num, se_code) VALUES(1,'e5');
INSERT INTO seat(h_num, se_code) VALUES(1,'e6');
INSERT INTO seat(h_num, se_code) VALUES(1,'e7');
INSERT INTO seat(h_num, se_code) VALUES(1,'e8');
INSERT INTO seat(h_num, se_code) VALUES(1,'e9');
INSERT INTO seat(h_num, se_code) VALUES(1,'e10');
INSERT INTO seat(h_num, se_code) VALUES(1,'f1');
INSERT INTO seat(h_num, se_code) VALUES(1,'f2');
INSERT INTO seat(h_num, se_code) VALUES(1,'f3');
INSERT INTO seat(h_num, se_code) VALUES(1,'f4');
INSERT INTO seat(h_num, se_code) VALUES(1,'f5');
INSERT INTO seat(h_num, se_code) VALUES(1,'f6');
INSERT INTO seat(h_num, se_code) VALUES(1,'f7');
INSERT INTO seat(h_num, se_code) VALUES(1,'f8');
INSERT INTO seat(h_num, se_code) VALUES(1,'f9');
INSERT INTO seat(h_num, se_code) VALUES(1,'f10');
INSERT INTO seat(h_num, se_code) VALUES(1,'g1');
INSERT INTO seat(h_num, se_code) VALUES(1,'g2');
INSERT INTO seat(h_num, se_code) VALUES(1,'g3');
INSERT INTO seat(h_num, se_code) VALUES(1,'g4');
INSERT INTO seat(h_num, se_code) VALUES(1,'g5');
INSERT INTO seat(h_num, se_code) VALUES(1,'g6');
INSERT INTO seat(h_num, se_code) VALUES(1,'g7');
INSERT INTO seat(h_num, se_code) VALUES(1,'g8');
INSERT INTO seat(h_num, se_code) VALUES(1,'g9');
INSERT INTO seat(h_num, se_code) VALUES(1,'g10');
INSERT INTO seat(h_num, se_code) VALUES(2,'a1');
INSERT INTO seat(h_num, se_code) VALUES(2,'a2');
INSERT INTO seat(h_num, se_code) VALUES(2,'a3');
INSERT INTO seat(h_num, se_code) VALUES(2,'a4');
INSERT INTO seat(h_num, se_code) VALUES(2,'a5');
INSERT INTO seat(h_num, se_code) VALUES(2,'a6');
INSERT INTO seat(h_num, se_code) VALUES(2,'a7');
INSERT INTO seat(h_num, se_code) VALUES(2,'a8');
INSERT INTO seat(h_num, se_code) VALUES(2,'a9');
INSERT INTO seat(h_num, se_code) VALUES(2,'a10');
INSERT INTO seat(h_num, se_code) VALUES(2,'b1');
INSERT INTO seat(h_num, se_code) VALUES(2,'b2');
INSERT INTO seat(h_num, se_code) VALUES(2,'b3');
INSERT INTO seat(h_num, se_code) VALUES(2,'b4');
INSERT INTO seat(h_num, se_code) VALUES(2,'b5');
INSERT INTO seat(h_num, se_code) VALUES(2,'b6');
INSERT INTO seat(h_num, se_code) VALUES(2,'b7');
INSERT INTO seat(h_num, se_code) VALUES(2,'b8');
INSERT INTO seat(h_num, se_code) VALUES(2,'b9');
INSERT INTO seat(h_num, se_code) VALUES(2,'b10');
INSERT INTO seat(h_num, se_code) VALUES(2,'c1');
INSERT INTO seat(h_num, se_code) VALUES(2,'c2');
INSERT INTO seat(h_num, se_code) VALUES(2,'c3');
INSERT INTO seat(h_num, se_code) VALUES(2,'c4');
INSERT INTO seat(h_num, se_code) VALUES(2,'c5');
INSERT INTO seat(h_num, se_code) VALUES(2,'c6');
INSERT INTO seat(h_num, se_code) VALUES(2,'c7');
INSERT INTO seat(h_num, se_code) VALUES(2,'c8');
INSERT INTO seat(h_num, se_code) VALUES(2,'c9');
INSERT INTO seat(h_num, se_code) VALUES(2,'c10');
INSERT INTO seat(h_num, se_code) VALUES(2,'d1');
INSERT INTO seat(h_num, se_code) VALUES(2,'d2');
INSERT INTO seat(h_num, se_code) VALUES(2,'d3');
INSERT INTO seat(h_num, se_code) VALUES(2,'d4');
INSERT INTO seat(h_num, se_code) VALUES(2,'d5');
INSERT INTO seat(h_num, se_code) VALUES(2,'d6');
INSERT INTO seat(h_num, se_code) VALUES(2,'d7');
INSERT INTO seat(h_num, se_code) VALUES(2,'d8');
INSERT INTO seat(h_num, se_code) VALUES(2,'d9');
INSERT INTO seat(h_num, se_code) VALUES(2,'d10');
INSERT INTO seat(h_num, se_code) VALUES(2,'e1');
INSERT INTO seat(h_num, se_code) VALUES(2,'e2');
INSERT INTO seat(h_num, se_code) VALUES(2,'e3');
INSERT INTO seat(h_num, se_code) VALUES(2,'e4');
INSERT INTO seat(h_num, se_code) VALUES(2,'e5');
INSERT INTO seat(h_num, se_code) VALUES(2,'e6');
INSERT INTO seat(h_num, se_code) VALUES(2,'e7');
INSERT INTO seat(h_num, se_code) VALUES(2,'e8');
INSERT INTO seat(h_num, se_code) VALUES(2,'e9');
INSERT INTO seat(h_num, se_code) VALUES(2,'e10');
INSERT INTO seat(h_num, se_code) VALUES(2,'f1');
INSERT INTO seat(h_num, se_code) VALUES(2,'f2');
INSERT INTO seat(h_num, se_code) VALUES(2,'f3');
INSERT INTO seat(h_num, se_code) VALUES(2,'f4');
INSERT INTO seat(h_num, se_code) VALUES(2,'f5');
INSERT INTO seat(h_num, se_code) VALUES(2,'f6');
INSERT INTO seat(h_num, se_code) VALUES(2,'f7');
INSERT INTO seat(h_num, se_code) VALUES(2,'f8');
INSERT INTO seat(h_num, se_code) VALUES(2,'f9');
INSERT INTO seat(h_num, se_code) VALUES(2,'f10');
INSERT INTO seat(h_num, se_code) VALUES(2,'g1');
INSERT INTO seat(h_num, se_code) VALUES(2,'g2');
INSERT INTO seat(h_num, se_code) VALUES(2,'g3');
INSERT INTO seat(h_num, se_code) VALUES(2,'g4');
INSERT INTO seat(h_num, se_code) VALUES(2,'g5');
INSERT INTO seat(h_num, se_code) VALUES(2,'g6');
INSERT INTO seat(h_num, se_code) VALUES(2,'g7');
INSERT INTO seat(h_num, se_code) VALUES(2,'g8');
INSERT INTO seat(h_num, se_code) VALUES(2,'g9');
INSERT INTO seat(h_num, se_code) VALUES(2,'g10');
INSERT INTO seat(h_num, se_code) VALUES(3,'a1');
INSERT INTO seat(h_num, se_code) VALUES(3,'a2');
INSERT INTO seat(h_num, se_code) VALUES(3,'a3');
INSERT INTO seat(h_num, se_code) VALUES(3,'a4');
INSERT INTO seat(h_num, se_code) VALUES(3,'a5');
INSERT INTO seat(h_num, se_code) VALUES(3,'a6');
INSERT INTO seat(h_num, se_code) VALUES(3,'a7');
INSERT INTO seat(h_num, se_code) VALUES(3,'a8');
INSERT INTO seat(h_num, se_code) VALUES(3,'a9');
INSERT INTO seat(h_num, se_code) VALUES(3,'a10');
INSERT INTO seat(h_num, se_code) VALUES(3,'b1');
INSERT INTO seat(h_num, se_code) VALUES(3,'b2');
INSERT INTO seat(h_num, se_code) VALUES(3,'b3');
INSERT INTO seat(h_num, se_code) VALUES(3,'b4');
INSERT INTO seat(h_num, se_code) VALUES(3,'b5');
INSERT INTO seat(h_num, se_code) VALUES(3,'b6');
INSERT INTO seat(h_num, se_code) VALUES(3,'b7');
INSERT INTO seat(h_num, se_code) VALUES(3,'b8');
INSERT INTO seat(h_num, se_code) VALUES(3,'b9');
INSERT INTO seat(h_num, se_code) VALUES(3,'b10');
INSERT INTO seat(h_num, se_code) VALUES(3,'c1');
INSERT INTO seat(h_num, se_code) VALUES(3,'c2');
INSERT INTO seat(h_num, se_code) VALUES(3,'c3');
INSERT INTO seat(h_num, se_code) VALUES(3,'c4');
INSERT INTO seat(h_num, se_code) VALUES(3,'c5');
INSERT INTO seat(h_num, se_code) VALUES(3,'c6');
INSERT INTO seat(h_num, se_code) VALUES(3,'c7');
INSERT INTO seat(h_num, se_code) VALUES(3,'c8');
INSERT INTO seat(h_num, se_code) VALUES(3,'c9');
INSERT INTO seat(h_num, se_code) VALUES(3,'c10');
INSERT INTO seat(h_num, se_code) VALUES(3,'d1');
INSERT INTO seat(h_num, se_code) VALUES(3,'d2');
INSERT INTO seat(h_num, se_code) VALUES(3,'d3');
INSERT INTO seat(h_num, se_code) VALUES(3,'d4');
INSERT INTO seat(h_num, se_code) VALUES(3,'d5');
INSERT INTO seat(h_num, se_code) VALUES(3,'d6');
INSERT INTO seat(h_num, se_code) VALUES(3,'d7');
INSERT INTO seat(h_num, se_code) VALUES(3,'d8');
INSERT INTO seat(h_num, se_code) VALUES(3,'d9');
INSERT INTO seat(h_num, se_code) VALUES(3,'d10');
INSERT INTO seat(h_num, se_code) VALUES(3,'e1');
INSERT INTO seat(h_num, se_code) VALUES(3,'e2');
INSERT INTO seat(h_num, se_code) VALUES(3,'e3');
INSERT INTO seat(h_num, se_code) VALUES(3,'e4');
INSERT INTO seat(h_num, se_code) VALUES(3,'e5');
INSERT INTO seat(h_num, se_code) VALUES(3,'e6');
INSERT INTO seat(h_num, se_code) VALUES(3,'e7');
INSERT INTO seat(h_num, se_code) VALUES(3,'e8');
INSERT INTO seat(h_num, se_code) VALUES(3,'e9');
INSERT INTO seat(h_num, se_code) VALUES(3,'e10');
INSERT INTO seat(h_num, se_code) VALUES(3,'f1');
INSERT INTO seat(h_num, se_code) VALUES(3,'f2');
INSERT INTO seat(h_num, se_code) VALUES(3,'f3');
INSERT INTO seat(h_num, se_code) VALUES(3,'f4');
INSERT INTO seat(h_num, se_code) VALUES(3,'f5');
INSERT INTO seat(h_num, se_code) VALUES(3,'f6');
INSERT INTO seat(h_num, se_code) VALUES(3,'f7');
INSERT INTO seat(h_num, se_code) VALUES(3,'f8');
INSERT INTO seat(h_num, se_code) VALUES(3,'f9');
INSERT INTO seat(h_num, se_code) VALUES(3,'f10');
INSERT INTO seat(h_num, se_code) VALUES(3,'g1');
INSERT INTO seat(h_num, se_code) VALUES(3,'g2');
INSERT INTO seat(h_num, se_code) VALUES(3,'g3');
INSERT INTO seat(h_num, se_code) VALUES(3,'g4');
INSERT INTO seat(h_num, se_code) VALUES(3,'g5');
INSERT INTO seat(h_num, se_code) VALUES(3,'g6');
INSERT INTO seat(h_num, se_code) VALUES(3,'g7');
INSERT INTO seat(h_num, se_code) VALUES(3,'g8');
INSERT INTO seat(h_num, se_code) VALUES(3,'g9');
INSERT INTO seat(h_num, se_code) VALUES(3,'g10');
INSERT INTO seat(h_num, se_code) VALUES(4,'a1');
INSERT INTO seat(h_num, se_code) VALUES(4,'a2');
INSERT INTO seat(h_num, se_code) VALUES(4,'a3');
INSERT INTO seat(h_num, se_code) VALUES(4,'a4');
INSERT INTO seat(h_num, se_code) VALUES(4,'a5');
INSERT INTO seat(h_num, se_code) VALUES(4,'a6');
INSERT INTO seat(h_num, se_code) VALUES(4,'a7');
INSERT INTO seat(h_num, se_code) VALUES(4,'a8');
INSERT INTO seat(h_num, se_code) VALUES(4,'a9');
INSERT INTO seat(h_num, se_code) VALUES(4,'a10');
INSERT INTO seat(h_num, se_code) VALUES(4,'b1');
INSERT INTO seat(h_num, se_code) VALUES(4,'b2');
INSERT INTO seat(h_num, se_code) VALUES(4,'b3');
INSERT INTO seat(h_num, se_code) VALUES(4,'b4');
INSERT INTO seat(h_num, se_code) VALUES(4,'b5');
INSERT INTO seat(h_num, se_code) VALUES(4,'b6');
INSERT INTO seat(h_num, se_code) VALUES(4,'b7');
INSERT INTO seat(h_num, se_code) VALUES(4,'b8');
INSERT INTO seat(h_num, se_code) VALUES(4,'b9');
INSERT INTO seat(h_num, se_code) VALUES(4,'b10');
INSERT INTO seat(h_num, se_code) VALUES(4,'c1');
INSERT INTO seat(h_num, se_code) VALUES(4,'c2');
INSERT INTO seat(h_num, se_code) VALUES(4,'c3');
INSERT INTO seat(h_num, se_code) VALUES(4,'c4');
INSERT INTO seat(h_num, se_code) VALUES(4,'c5');
INSERT INTO seat(h_num, se_code) VALUES(4,'c6');
INSERT INTO seat(h_num, se_code) VALUES(4,'c7');
INSERT INTO seat(h_num, se_code) VALUES(4,'c8');
INSERT INTO seat(h_num, se_code) VALUES(4,'c9');
INSERT INTO seat(h_num, se_code) VALUES(4,'c10');
INSERT INTO seat(h_num, se_code) VALUES(4,'d1');
INSERT INTO seat(h_num, se_code) VALUES(4,'d2');
INSERT INTO seat(h_num, se_code) VALUES(4,'d3');
INSERT INTO seat(h_num, se_code) VALUES(4,'d4');
INSERT INTO seat(h_num, se_code) VALUES(4,'d5');
INSERT INTO seat(h_num, se_code) VALUES(4,'d6');
INSERT INTO seat(h_num, se_code) VALUES(4,'d7');
INSERT INTO seat(h_num, se_code) VALUES(4,'d8');
INSERT INTO seat(h_num, se_code) VALUES(4,'d9');
INSERT INTO seat(h_num, se_code) VALUES(4,'d10');
INSERT INTO seat(h_num, se_code) VALUES(4,'e1');
INSERT INTO seat(h_num, se_code) VALUES(4,'e2');
INSERT INTO seat(h_num, se_code) VALUES(4,'e3');
INSERT INTO seat(h_num, se_code) VALUES(4,'e4');
INSERT INTO seat(h_num, se_code) VALUES(4,'e5');
INSERT INTO seat(h_num, se_code) VALUES(4,'e6');
INSERT INTO seat(h_num, se_code) VALUES(4,'e7');
INSERT INTO seat(h_num, se_code) VALUES(4,'e8');
INSERT INTO seat(h_num, se_code) VALUES(4,'e9');
INSERT INTO seat(h_num, se_code) VALUES(4,'e10');
INSERT INTO seat(h_num, se_code) VALUES(4,'f1');
INSERT INTO seat(h_num, se_code) VALUES(4,'f2');
INSERT INTO seat(h_num, se_code) VALUES(4,'f3');
INSERT INTO seat(h_num, se_code) VALUES(4,'f4');
INSERT INTO seat(h_num, se_code) VALUES(4,'f5');
INSERT INTO seat(h_num, se_code) VALUES(4,'f6');
INSERT INTO seat(h_num, se_code) VALUES(4,'f7');
INSERT INTO seat(h_num, se_code) VALUES(4,'f8');
INSERT INTO seat(h_num, se_code) VALUES(4,'f9');
INSERT INTO seat(h_num, se_code) VALUES(4,'f10');
INSERT INTO seat(h_num, se_code) VALUES(4,'g1');
INSERT INTO seat(h_num, se_code) VALUES(4,'g2');
INSERT INTO seat(h_num, se_code) VALUES(4,'g3');
INSERT INTO seat(h_num, se_code) VALUES(4,'g4');
INSERT INTO seat(h_num, se_code) VALUES(4,'g5');
INSERT INTO seat(h_num, se_code) VALUES(4,'g6');
INSERT INTO seat(h_num, se_code) VALUES(4,'g7');
INSERT INTO seat(h_num, se_code) VALUES(4,'g8');
INSERT INTO seat(h_num, se_code) VALUES(4,'g9');
INSERT INTO seat(h_num, se_code) VALUES(4,'g10');

--theather
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(101,'강남','서울특별시 강남구 역삼동','02)101');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(102,'강변','서울특별시 광진구 구의동','02)102');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(103,'건대입구','서울특별시 광진구 자양동','02)103');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(104,'구로','서울특별시 구로구 구로5동','02)104');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(105,'대학로','서울특별시 종로구 명륜2가','02)105');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(106,'동대문','서울특별시 중구 을지로6가','02)106');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(107,'등촌','서울특별시 강서구 등촌동','02)107');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(108,'명동','서울특별시 중구 명동2가','02)108');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(109,'목동','서울특별시 양천구 목동','02)109');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(110,'미아','서울특별시 강북구 미아동','02)110');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(111,'방학','서울특별시 도봉구 방학동','02)111');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(112,'송파','서울특별시 송파구 장지동','02)112');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(113,'수유','서울시 강북구 수유동','02)113');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(114,'압구정','서울특별시 강남구 신사동','02)114');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(115,'여의도','서울특별시 영등포구 여의도동','02)115');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(116,'연남','서울 마포구 동교동','02)116');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(117,'영등포','서울특별시 영등포구 영등포동','02)117');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(118,'홍대','서울특별시 마포구 동교동','02)118');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(201,'경기광주','경기도 광주시 역동','031)201');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(202,'고양행신','경기도 고양시 덕양구 행신동','031)202');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(203,'광교','경기도 수원시 영통구 하동','031)203');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(204,'광명역','경기도 광명시 일직동','031)204');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(205,'구리','경기도 구리시 인창동','031)205');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(206,'기흥','경기도 용인시 기흥구 구갈동','031)206');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(207,'김포','경기도 김포시 풍무동','031)207');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(208,'동수원','경기도 수원시 팔달구 인계동?','031)208');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(209,'동탄','경기도 화성시 반송동','031)209');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(210,'부천','부천시 중동 1164번지','031)210');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(211,'산본','군포시 산본동','031)211');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(212,'수원','경기도 수원시 팔달구','031)212');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(213,'스파틸드시티위례','경기도 하남시 학암동','031)213');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(214,'시흥','경기도 시흥시 대야동','031)214');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(215,'용인','경기도 용인시 처인구 김량장동','031)215');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(216,'의정부','경기도 의정부시 의정부동','031)216');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(217,'일산','경기도 고양시 일산동구 장항동','031)217');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(218,'판교','경기도 성남시 분당구 백현동?','031)218');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(219,'평촌','경기도 안양시 동안구 관양동','031)219');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(220,'평택','경기도 평택시 평택동','031)220');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(221,'포천','경기도 포천시 소흘읍','031)221');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(301,'계양','인천광역시 계양구 작전동','032)301');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(302,'부평','인천 광역시 부평구 청천동','032)302');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(303,'송도타임스페이스','인천광역시 연수구 송도동','032)303');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(304,'인천','인천광역시 남동구 구월동','032)304');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(305,'인천논현','인천광역시 남동구 논현동','032)305');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(306,'주안','인천광역시 미추홀구 주안동','032)306');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(307,'청라','인천광역시 서구 청라동','032)307');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(401,'강릉','강원도 강릉시 옥천동','033)401');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(402,'원주','강원도 원주시 단계동','033)402');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(403,'인제','강원도 인제군 인제읍','033)403');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(404,'춘천','강원도 춘천시','033)404');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(501,'논산','충남 논산시 내동','043)501');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(502,'당진','충남 당진시 우두1로','043)502');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(503,'대전','대전광역시 중구 문화동','042)503');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(504,'대전탄방','대전광역시 서구 탄방동','042)504');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(505,'세종','세종특별자치시 종촌동','041)505');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(506,'천안','충청남도 천안시 대흥동','041)506');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(507,'청주','충청북도 청주시 상당구','041)507');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(508,'청주터미널','충청북도 청주시 흥덕구 가경동','041)508');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(509,'홍성','충청남도 홍성군 홍성읍 고암리','041)509');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(601,'대구수성','대구광역시 수성구 범물동','053)601');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(602,'대구스타디움','대구시 수성구 대흥동','053)602');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(603,'대구연경','대구광역시 북구 연경동','053)603');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(604,'대구한일','대구광역시 중구 동성로 2가','053)604');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(701,'동래','부산광역시 동래구 온천동','051)701');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(702,'부산명지','부산광역시 강서구 명지동','051)702');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(703,'서면','부산광역시 진구 전포3동','051)703');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(704,'센텀시티','부산광역시 해운대구 우동','051)704');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(705,'울산동구','울산광역시 동구 방어동','051)705');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(706,'울산신천','울산광역시 북구 신천동','051)706');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(707,'정관','부산시 기장군 정관읍 매학리','051)707');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(708,'해운대','부산광역시 해운대구 우동','051)708');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(709,'화명','부산광역시 북구 화명동','051)709');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(801,'거제','경상남도 거제시 고현동','055)801');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(802,'고성','경상남도 고성군 고성읍','055)802');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(803,'김해','김해시 내동','055)803');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(804,'김해율하','경남 김해시 율하동','055)804');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(805,'김해장유','경상남도 김해시 대청동','055)805');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(806,'마산','경남 창원시 마산 회원구 합성동','055)806');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(807,'진주혁신','경남 진주시 충무공동','055)807');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(808,'창원','경상남도 창원시 팔용동','055)808');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(809,'통영','경상남도 통영시 북신동','055)809');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(901,'광양','전라남도 광양시 금호동','064)901');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(902,'광주상무','광주광역시 서구 치평동','064)902');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(903,'광주첨단','광주광역시 광산구 쌍암동 첨단지구','064)903');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(904,'광주터미널','광주광역시 서구 광천동','064)904');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(905,'군산','전라북도 군산시 나운동','064)905');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(906,'나주','전라남도 나주시 빛가람동','064)906');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(907,'목포','전라남도 목포시 상동','064)907');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(908,'순천','전라남도 순천시 장천동','064)908');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(909,'익산','전라북도 익산시 영등동','064)909');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(910,'정읍','전라북도 정읍시 수성동','064)910');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(911,'제주','제주특별자치도 제주시','064)911');

--screen
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(1,1,1,'2022-05-30','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(2,1,3,'2022-05-31','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(3,2,2,'2022-06-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(4,2,3,'2022-06-02','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(5,2,4,'2022-06-03','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(6,3,1,'2022-08-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(7,3,2,'2022-08-02','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(8,4,1,'2022-07-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(9,4,4,'2022-07-02','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(10,5,2,'2022-09-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(11,5,3,'2022-09-02','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(12,6,4,'2022-10-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(13,6,3,'2022-10-02','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(14,7,1,'2022-11-01','2022-12-31');
INSERT INTO screen(sc_code,m_code,h_num,m_date,m_period) VALUES(15,7,2,'2022-11-01','2022-12-31');

CREATE SEQUENCE  "TEAM"."CART_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."HISTORY_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE;
CREATE SEQUENCE  "TEAM"."GOODS_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."GOODSIMG_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."MOVIE_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."MOVIEIMG_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."REVIEW_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."QNA_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."FAQ_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."GOOD_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
CREATE SEQUENCE  "TEAM"."SCREEN_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 10 NOCYCLE ;
commit;

-- add_movies_detail
insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(41, '2022-06-08', '브로커 Broker', '한국', '세탁소를 운영하지만 늘 빚에 시달리는 ‘상현’(송강호)과
베이비 박스 시설에서 일하는 보육원 출신의 ‘동수’(강동원).
거센 비가 내리는 어느 날 밤,
그들은 베이비 박스에 놓인 한 아기를 몰래 데려간다.
하지만 이튿날, 생각지 못하게 엄마 ‘소영’(이지은)이 아기 ‘우성’을 찾으러 돌아온다.
아기가 사라진 것을 안 소영이 경찰에 신고하려 하자 솔직하게 털어놓는 두 사람.
우성이를 잘 키울 적임자를 찾아 주기 위해서 그랬다는 변명이 기가 막히지만
소영은 우성이의 새 부모를 찾는 여정에 상현, 동수와 함께하기로 한다.

한편 이 모든 과정을 지켜본 형사 ‘수진’(배두나)과 후배 ‘이형사’(이주영).
이들을 현행범으로 잡고 반 년째 이어온 수사를 마무리하기 위해 조용히 뒤를 쫓는다.

베이비 박스,
그곳에서 의도치 않게 만난 이들의
예기치 못한 특별한 여정이 시작된다.', 129, '2022-10-23', 12, '드라마', '고레에다 히로카즈' , '송강호 ,  강동원 ,  배두나 ,  이지은 ,  이주영', 0, '165415847703885829_320.jpg', '85829_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(53, '2022-06-01', '쥬라기 월드-도미니언 Jurassic World: Dominion', '미국', 147, '2022-10-23', 12, '액션, 어드벤처', '콜린 트레보로우', '크리스 프랫 ,  브라이스 달라스 하워드 ,  드완다 와이즈 ,  로라 던 ,  제프 골드브럼 ,  샘 닐', 0, '165423536042885689_320.jpg', '85689_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(54, '2022-05-18', '범죄도시 2', '한국', '“느낌 오지? 이 놈 잡아야 하는 거”

가리봉동 소탕작전 후 4년 뒤,
금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 미션을 받는다.

괴물형사 ‘마석도’(마동석)와 ‘전일만’(최귀화) 반장은 현지 용의자에게서 수상함을 느끼고,
그의 뒤에 무자비한 악행을 벌이는 ‘강해상’(손석구)이 있음을 알게 된다.

‘마석도’와 금천서 강력반은 한국과 베트남을 오가며
 역대급 범죄를 저지르는 ‘강해상’을 본격적으로 쫓기 시작하는데...

나쁜 놈들 잡는 데 국경 없다!
통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!', 106, '2022-10-23', 15, '범죄, 액션', '이상용', '마동석 ,  손석구 ,  최귀화 ,  박지환 ,  허동원 ,  하준 ,  정재광', 0, '165424133884585813_320.jpg', '85813_320.jpg');


insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(55, '2022-06-01', '극장판 포켓몬스터DP-기라티나와 하늘의 꽃다발 쉐이미', '일본', '끝나지 않은 전설의 포켓몬들의 배틀로
위험에 빠진 반전 세계와 현실 세계를 구하기 위해
감사포켓몬 ‘쉐이미’와 ‘지우’, ‘피카츄’가 나서면서 시작되는 모험 이야기', 96, '2022-10-23', 1, '애니메이션', '유야마 쿠니히코', '이선호 ,  김영선', 0, '165424158096385833_1000.jpg', '85833_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(59, '2022-05-04', '닥터 스트레인지-대혼돈의 멀티버스', '미국', '지금껏 본 적 없는 마블의 극한 상상력!
5월, 광기의 멀티버스가 깨어난다!
  
끝없이 균열되는 차원과 뒤엉킨 시공간의 멀티버스가 열리며
오랜 동료들, 그리고 차원을 넘어 들어온 새로운 존재들을 맞닥뜨리게 된 ‘닥터 스트레인지’.
대혼돈 속, 그는 예상치 못한 극한의 적과 맞서 싸워야만 하는데….', 126, '2022-10-23', 12, '액션, 어드벤처, 환타지', '샘 레이미', '베네딕트 컴버배치 ,  엘리자베스 올슨 ,  베네딕트 웡 ,  레이첼 맥아담스 ,  치웨텔 에지오포 ,  소치틀 고메즈', 0, '165424276409585715_1000.jpg', '85715_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(57, '2022-06-01', '애프터 양 After Yang', '미국', '함께 살던 안드로이드 인간 ‘양’이 어느 날 작동을 멈추자
제이크 가족은 그를 수리할 방법을 찾는다.
그러던 중, ‘양’에게서 특별한 메모리 뱅크를 발견하고
그의 기억을 탐험하기 시작하는데…

무엇을 남기고 싶었어, 양?', 96, '2022-10-23', 1, '드라마', '코고나다', '콜린 파렐 ,  조디 터너 스미스 ,  저스틴 H.민 ,  말레아 엠마 찬드로위자야', 0, '165424207674785884_1000.jpg', '85884_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(58, '2022-06-01', '카시오페아' , '한국', '이혼 후 변호사, 엄마로 완벽한 삶을 살아가려고 노력하는 수진은 하나뿐인 딸 지나의 미국 유학을 준비하고 있다. 
정신없이 바쁜 수진을 위해 아빠 인우가 손녀를 돌보게 되면서 세 사람은 함께 살게 된다. 
얼마 후 수진은 교통사고를 당하고, 병원에서 알츠하이머라는 뜻밖의 결과를 듣게 된다. 
사랑하는 딸을 잊을까 봐 두려워하는 수진을 위해 아빠 인우는 수진의 곁을 지키고, 
기억을 잊어도 살아갈 수 있도록 이들 부녀만의 애틋한 동행이 시작된다.', 101, '2022-10-23', 12, '드라마', '신연식', '안성기 ,  서현진 ,  주예림', 0, '165424251539685882_320.jpg', '85882_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(60, '2022-06-15', '마녀(魔女) Part2. The Other One', '한국', '통제불능의 존재가 세상 밖으로 나왔다!
 
‘자윤’이 사라진 뒤, 정체불명의 집단의 무차별 습격으로 마녀 프로젝트가 진행되고 있는 ‘아크’가 초토화된다.
그곳에서 홀로 살아남은 ‘소녀’는 생애 처음 세상 밖으로 발을 내딛고
우연히 만난 ‘경희’의 도움으로 농장에서 지내며 따뜻한 일상에 적응해간다.
한편, ‘소녀’가 망실되자 행방을 쫓는 책임자 ‘장’과
마녀 프로젝트의 창시자 ‘백총괄’의 지령을 받고 제거에 나선 본사 요원 ‘조현’,
‘경희’의 농장 소유권을 노리는 조직의 보스 ‘용두’와
상해에서 온 의문의 4인방까지
각기 다른 목적을 지닌 세력이 하나 둘 모여들기 시작하면서 ‘소녀’ 안에 숨겨진 본성이 깨어나는데…
 
모든 것의 시작,
더욱 거대하고 강력해진 마녀가 온다.', 137, '2022-10-23', 15, '액션', '박훈정', '신시아 ,  박은빈 ,  서은수 ,  진구 ,  성유빈 ,  조민수 ,  이종석 ,  김다미', 0, '165424307441185871_1000.jpg', '85871_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(61, '2022-05-25', '피는 물보다 진하다 The Goblin', '한국', '`도깨비`라 불린 남자 VS `도깨비`가 되고 싶었던 남자 
오직 진짜만이 살아남는다! 

최대 청부폭력조직 `백정파`는  
무자비함으로 악명 높은 해결사,  
일명 `도깨비`를 앞세워 일대를 장악한다. 
 
그러나, 베일에 싸인 `도깨비` 두현은
친형제 같았던 영민의 죄를 뒤집어쓰고
10년의 수감생활을 하게 된다.
 
한편, 두현이 사라진 사이,
`도깨비` 행세를 하며 조직을 차지한 영민은
두현의 출소 소식을 듣고 불안에 휩싸인다.
 
영민은 두현을 먼저 치기로 하고
새 삶을 시작하려던 두현은 결국,
진짜 `도깨비`의 부활을 선언하며
영민과 조직을 상대로 싸움을 시작하는데...', 90, '2022-10-23', 15, '액션, 범죄', '김희성', '조동혁 ,  이완 ,  임정은', 0, '165424353273985790_320.jpg', '85790_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(62, '2022-05-25', '그대가 조국 The Red Herring', '한국', '대한민국은 민주공화국인가 검찰공화국인가
검찰의 칼날이 그대에게 향하지 않는다고 자신할 수 있는가

사냥이 시작됐다. 검찰이 던진 좌표를 따라 언론은 몰려들고 소문은 꼬리를 문다. 
분노한 대중 앞에 검찰은 칼을 휘두른다. 저기 쫓기는 자는 누구인가. 
그대가 아니라고 자신할 수 있는가.', 124, '2022-10-23', 12, '다큐멘터리', '이승준 / 프로듀서 : 감병석 ,  양희 ,  진모영', '조국', 0, '165424377175185886_1000.jpg', '85886_1000.jpg');

-- add_movieimg
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(12, 41, '85829202956_727.jpg', '165415847707185829202956_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(13, 41, '85829202957_727.jpg', '165415847708185829202957_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(14, 41, '85829202958_727.jpg', '165415847708985829202958_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(15, 41, '85829202959_727.jpg', '165415847709985829202959_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(16, 41, '85829202960_727.jpg', '165415847710885829202960_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(17, 41, '85829202962_727.jpg', '165415847711685829202962_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(21, 51, '85813202806_727.jpg', '165421602671085813202806_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(23, 53, '85689203366_727.jpg', '165423536044585689203366_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(24, 53, '85689203368_727.jpg', '165423536045485689203368_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(25, 53, '85689203369_727.jpg','165423536046385689203369_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(26, 53, '85689203370_727.jpg', '165423536047185689203370_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(27, 53, '85689203371_727.jpg', '165423536048085689203371_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(28, 54, '85813202804_727.jpg', '165424133886585813202804_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(29, 54, '85813202805_727.jpg', '165424133887485813202805_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(30, 54, '85813202806_727.jpg', '165424133888385813202806_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(31, 54, '85813202807_727.jpg', '165424133889285813202807_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(32, 54, '85813202808_727.jpg', '165424133890185813202808_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(33, 55, '85833203080_727.jpg', '165424158098085833203080_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(34, 55, '85833203081_727.jpg', '165424158098985833203081_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(35, 55, '85833203082_727.jpg', '165424158099885833203082_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(36, 55, '85833203083_727.jpg', '165424158100785833203083_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(37, 55, '85833203084_727.jpg', '165424158101585833203084_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(39, 57, '85884203004_727.jpg', '165424207676585884203004_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(40, 57, '85884203005_727.jpg', '165424207677285884203005_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(41, 57, '85884203006_727.jpg', '165424207678185884203006_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(42, 57, '85884203007_727.jpg', '165424207678985884203007_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(43, 57, '85884203008_727.jpg', '165424207679885884203008_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(44, 58, '85882203230_727.jpg', '165424251541385882203230_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(45, 58, '85882203231_727.jpg', '165424251542285882203231_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(46, 58, '85882203232_727.jpg', '165424251543085882203232_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(47, 58, '85882203233_727.jpg', '165424251543985882203233_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(48, 58, '85882203234_727.jpg', '165424251544785882203234_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(49, 59, '85715201965_727.jpg', '165424276411385715201965_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(50, 59, '85715201966_727.jpg', '165424276412285715201966_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(51, 59, '85715201967_727.jpg', '165424276413285715201967_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(52, 59, '85715201968_727.jpg', '165424276414085715201968_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(53, 59, '85715201969_727.jpg', '165424276414985715201969_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(54, 60, '85871203581_727.jpg', '165424307442985871203581_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(55, 60, '85871203582_727.jpg', '165424307443785871203582_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(56, 60, '85871203583_727.jpg', '165424307444585871203583_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(57, 60, '85871203584_727.jpg', '165424307445485871203584_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(58, 60, '85871203585_727.jpg', '165424307446385871203585_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(59, 61, '85790201854_727.jpg', '165424353275785790201854_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(60, 61, '85790201859_727.jpg', '165424353276685790201859_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(61, 61, '85790201860_727.jpg', '165424353277385790201860_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(62, 61, '85790201861_727.jpg', '165424353278385790201861_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(63, 61, '85790201862_727.jpg', '165424353279185790201862_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(64, 62, '85886202991_727.jpg', '165424377176985886202991_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(65, 62, '85886202992_727.jpg', '165424377177785886202992_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(66, 62, '85886202993_727.jpg', '165424377178685886202993_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(67, 62, '85886202994_727.jpg', '165424377179485886202994_727.jpg');
insert into movieimg(M_IMGCODE, M_CODE, M_ORIGINIMG, M_PICS)
values(68, 62, '85886202995_727.jpg', '165424377180385886202995_727.jpg');

COMMIT;

select * from movie;
select * from movieimg;

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'고소팝콘',5000,'15463244796940.jpg','15463244796940.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'달콤팝콘',5000,'15463244213800.jpg','15463244213800.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'더블치즈팝콘',6000,'15463247055100.jpg','15463247055100.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'탄산음료',2500,'15464083668990.jpg','15464083668990.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'아메리카노(HOT)',3500,'15464096039760.jpg','15464096039760.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'아메리카노(ICE)',4000,'15464105893180.jpg','15464105893180.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'칠리치즈나쵸',4900,'15459092398190.jpg','15459092398190.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'플레인핫도그',4500,'15464120856450.jpg','15464120856450.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'오징어(완제품)',3500,'15459089330830.jpg','15459089330830.jpg');

insert into goodsimg(g_code, img_code, img_origin, img_2)
values(1, goodsimg_seq.nextval,'15463244796940.jpg','15463244796940.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(2, goodsimg_seq.nextval,'15463244213800.jpg','15463244213800.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(3, goodsimg_seq.nextval,'15463247055100.jpg','15463247055100.jpg');

insert into goodsimg(g_code, img_code, img_origin, img_2)
values(4, goodsimg_seq.nextval, '15464083668990.jpg','15464083668990.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(5, goodsimg_seq.nextval,'15464096039760.jpg','15464096039760.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(6, goodsimg_seq.nextval,'15464105893180.jpg','15464105893180.jpg');

insert into goodsimg(g_code, img_code, img_origin, img_2)
values(7, goodsimg_seq.nextval,'15459092398190.jpg','15459092398190.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(8, goodsimg_seq.nextval,'15464120856450.jpg','15464120856450.jpg');
insert into goodsimg(g_code, img_code, img_origin, img_2)
values(9, goodsimg_seq.nextval,'15459089330830.jpg','15459089330830.jpg');

select * from goods;
select * from goodsimg;

commit;