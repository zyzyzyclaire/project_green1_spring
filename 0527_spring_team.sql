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

--厚劝己拳
--ALTER TABLE 蜡历疙.抛捞喉疙 DISABLE CONSTRAINT 力距炼扒疙;
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
--力距炼扒劝己拳
--ALTER TABLE 蜡历疙.抛捞喉疙 ENABLE NOVALIDATE CONSTRAINT 力距炼扒疙; /*扁粮 单捞磐俊 措茄 沥钦己 眉农 绝
ALTER TABLE NOTICE_T MODIFY N_DATE DEFAULT SYSDATE;
ALTER TABLE FAQ MODIFY F_DATE DEFAULT SYSDATE;
ALTER TABLE QNA MODIFY Q_DATE DEFAULT SYSDATE;

insert into book values(1,1,1,1,1,'wjdcksgml',1,'1997-12-19');
insert into review values(1,1,'wjdcksgml',1,1,'1997-12-19',1);
insert into faq values(1,'wjdcksgml',1,1,1,'1997-12-19',1);
insert into NOTICE_T values(1,'wjdcksgml',1,1,'1997-12-19',1,1);
insert into QNA values(1,'wjdcksgml',1,1,1,'1997-12-19',1,1,1);
insert into history values(1,1,'wjdcksgml',1,1);
insert into movie values(1,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(2,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(3,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(4,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(5,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(6,'2022-06-03','力格','家俺','康拳惑技汲疙',1,'2022-06-02',1,'厘福','皑刀疙','硅快',1,'3.jpg','16542335726743.jpg',null);

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
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1101,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1102,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1103,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1104,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1111,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1112,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1113,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1114,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1121,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1122,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1123,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1124,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1131,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1132,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1133,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1134,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1141,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1142,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1143,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1144,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1151,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1152,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1153,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1154,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1161,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1162,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1163,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1164,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1171,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1172,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1173,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1174,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1181,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1182,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1183,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1184,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2101,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2102,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2103,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2104,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2111,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2112,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2113,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2114,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2121,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2122,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2123,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2124,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2131,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2132,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2133,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2134,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2141,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2142,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2143,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2144,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2151,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2152,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2153,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2154,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2161,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2162,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2163,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2164,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2171,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2172,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2173,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2174,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2181,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2182,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2183,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2184,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2191,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2192,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2193,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2194,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2201,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2202,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2203,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2204,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2211,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2212,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2213,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2214,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9011,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9012,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9013,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9014,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9021,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9022,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9023,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9024,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9031,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9032,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9033,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9034,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9041,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9042,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9043,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9044,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9051,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9052,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9053,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9054,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9061,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9062,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9063,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9064,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9071,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9072,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9073,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9074,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9081,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9082,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9083,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9084,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9091,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9092,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9093,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9094,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9101,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9102,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9103,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9104,'4包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9111,'1包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9112,'2包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9113,'3包');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9114,'4包');

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
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(101,'碍巢','辑匡漂喊矫 碍巢备 开伙悼','02)101');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(102,'碍函','辑匡漂喊矫 堡柳备 备狼悼','02)102');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(103,'扒措涝备','辑匡漂喊矫 堡柳备 磊剧悼','02)103');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(104,'备肺','辑匡漂喊矫 备肺备 备肺5悼','02)104');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(105,'措切肺','辑匡漂喊矫 辆肺备 疙符2啊','02)105');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(106,'悼措巩','辑匡漂喊矫 吝备 阑瘤肺6啊','02)106');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(107,'殿锰','辑匡漂喊矫 碍辑备 殿锰悼','02)107');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(108,'疙悼','辑匡漂喊矫 吝备 疙悼2啊','02)108');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(109,'格悼','辑匡漂喊矫 剧玫备 格悼','02)109');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(110,'固酒','辑匡漂喊矫 碍合备 固酒悼','02)110');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(111,'规切','辑匡漂喊矫 档豪备 规切悼','02)111');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(112,'价颇','辑匡漂喊矫 价颇备 厘瘤悼','02)112');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(113,'荐蜡','辑匡矫 碍合备 荐蜡悼','02)113');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(114,'拘备沥','辑匡漂喊矫 碍巢备 脚荤悼','02)114');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(115,'咯狼档','辑匡漂喊矫 康殿器备 咯狼档悼','02)115');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(116,'楷巢','辑匡 付器备 悼背悼','02)116');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(117,'康殿器','辑匡漂喊矫 康殿器备 康殿器悼','02)117');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(118,'全措','辑匡漂喊矫 付器备 悼背悼','02)118');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(201,'版扁堡林','版扁档 堡林矫 开悼','031)201');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(202,'绊剧青脚','版扁档 绊剧矫 傣剧备 青脚悼','031)202');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(203,'堡背','版扁档 荐盔矫 康烹备 窍悼','031)203');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(204,'堡疙开','版扁档 堡疙矫 老流悼','031)204');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(205,'备府','版扁档 备府矫 牢芒悼','031)205');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(206,'扁蕊','版扁档 侩牢矫 扁蕊备 备哎悼','031)206');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(207,'辫器','版扁档 辫器矫 浅公悼','031)207');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(208,'悼荐盔','版扁档 荐盔矫 迫崔备 牢拌悼?','031)208');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(209,'悼藕','版扁档 拳己矫 馆价悼','031)209');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(210,'何玫','何玫矫 吝悼 1164锅瘤','031)210');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(211,'魂夯','焙器矫 魂夯悼','031)211');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(212,'荐盔','版扁档 荐盔矫 迫崔备','031)212');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(213,'胶颇瓶靛矫萍困肥','版扁档 窍巢矫 切鞠悼','031)213');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(214,'矫蕊','版扁档 矫蕊矫 措具悼','031)214');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(215,'侩牢','版扁档 侩牢矫 贸牢备 辫樊厘悼','031)215');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(216,'狼沥何','版扁档 狼沥何矫 狼沥何悼','031)216');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(217,'老魂','版扁档 绊剧矫 老魂悼备 厘亲悼','031)217');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(218,'魄背','版扁档 己巢矫 盒寸备 归泅悼?','031)218');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(219,'乞锰','版扁档 救剧矫 悼救备 包剧悼','031)219');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(220,'乞琶','版扁档 乞琶矫 乞琶悼','031)220');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(221,'器玫','版扁档 器玫矫 家汝谰','031)221');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(301,'拌剧','牢玫堡开矫 拌剧备 累傈悼','032)301');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(302,'何乞','牢玫 堡开矫 何乞备 没玫悼','032)302');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(303,'价档鸥烙胶其捞胶','牢玫堡开矫 楷荐备 价档悼','032)303');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(304,'牢玫','牢玫堡开矫 巢悼备 备岿悼','032)304');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(305,'牢玫稠泅','牢玫堡开矫 巢悼备 稠泅悼','032)305');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(306,'林救','牢玫堡开矫 固眠圈备 林救悼','032)306');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(307,'没扼','牢玫堡开矫 辑备 没扼悼','032)307');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(401,'碍釜','碍盔档 碍釜矫 苛玫悼','033)401');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(402,'盔林','碍盔档 盔林矫 窜拌悼','033)402');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(403,'牢力','碍盔档 牢力焙 牢力谰','033)403');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(404,'冕玫','碍盔档 冕玫矫','033)404');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(501,'稠魂','面巢 稠魂矫 郴悼','043)501');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(502,'寸柳','面巢 寸柳矫 快滴1肺','043)502');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(503,'措傈','措傈堡开矫 吝备 巩拳悼','042)503');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(504,'措傈藕规','措傈堡开矫 辑备 藕规悼','042)504');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(505,'技辆','技辆漂喊磊摹矫 辆锰悼','041)505');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(506,'玫救','面没巢档 玫救矫 措蕊悼','041)506');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(507,'没林','面没合档 没林矫 惑寸备','041)507');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(508,'没林磐固澄','面没合档 没林矫 蕊傣备 啊版悼','041)508');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(509,'全己','面没巢档 全己焙 全己谰 绊鞠府','041)509');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(601,'措备荐己','措备堡开矫 荐己备 裹拱悼','053)601');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(602,'措备胶鸥叼框','措备矫 荐己备 措蕊悼','053)602');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(603,'措备楷版','措备堡开矫 合备 楷版悼','053)603');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(604,'措备茄老','措备堡开矫 吝备 悼己肺 2啊','053)604');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(701,'悼贰','何魂堡开矫 悼贰备 柯玫悼','051)701');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(702,'何魂疙瘤','何魂堡开矫 碍辑备 疙瘤悼','051)702');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(703,'辑搁','何魂堡开矫 柳备 傈器3悼','051)703');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(704,'季乓矫萍','何魂堡开矫 秦款措备 快悼','051)704');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(705,'匡魂悼备','匡魂堡开矫 悼备 规绢悼','051)705');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(706,'匡魂脚玫','匡魂堡开矫 合备 脚玫悼','051)706');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(707,'沥包','何魂矫 扁厘焙 沥包谰 概切府','051)707');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(708,'秦款措','何魂堡开矫 秦款措备 快悼','051)708');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(709,'拳疙','何魂堡开矫 合备 拳疙悼','051)709');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(801,'芭力','版惑巢档 芭力矫 绊泅悼','055)801');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(802,'绊己','版惑巢档 绊己焙 绊己谰','055)802');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(803,'辫秦','辫秦矫 郴悼','055)803');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(804,'辫秦啦窍','版巢 辫秦矫 啦窍悼','055)804');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(805,'辫秦厘蜡','版惑巢档 辫秦矫 措没悼','055)805');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(806,'付魂','版巢 芒盔矫 付魂 雀盔备 钦己悼','055)806');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(807,'柳林酋脚','版巢 柳林矫 面公傍悼','055)807');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(808,'芒盔','版惑巢档 芒盔矫 迫侩悼','055)808');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(809,'烹康','版惑巢档 烹康矫 合脚悼','055)809');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(901,'堡剧','傈扼巢档 堡剧矫 陛龋悼','064)901');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(902,'堡林惑公','堡林堡开矫 辑备 摹乞悼','064)902');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(903,'堡林梅窜','堡林堡开矫 堡魂备 街鞠悼 梅窜瘤备','064)903');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(904,'堡林磐固澄','堡林堡开矫 辑备 堡玫悼','064)904');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(905,'焙魂','傈扼合档 焙魂矫 唱款悼','064)905');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(906,'唱林','傈扼巢档 唱林矫 蝴啊恩悼','064)906');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(907,'格器','傈扼巢档 格器矫 惑悼','064)907');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(908,'鉴玫','傈扼巢档 鉴玫矫 厘玫悼','064)908');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(909,'劳魂','傈扼合档 劳魂矫 康殿悼','064)909');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(910,'沥谰','傈扼合档 沥谰矫 荐己悼','064)910');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(911,'力林','力林漂喊磊摹档 力林矫','064)911');

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
values(41, '2022-06-08', '宏肺目 Broker', '茄惫', '技殴家甫 款康窍瘤父 疵 胡俊 矫崔府绰 ‘惑泅’(价碍龋)苞
海捞厚 冠胶 矫汲俊辑 老窍绰 焊腊盔 免脚狼 ‘悼荐’(碍悼盔).
芭季 厚啊 郴府绰 绢蠢 朝 广,
弊甸篮 海捞厚 冠胶俊 初牢 茄 酒扁甫 隔贰 单妨埃促.
窍瘤父 捞票朝, 积阿瘤 给窍霸 决付 ‘家康’(捞瘤篮)捞 酒扁 ‘快己’阑 茫栏矾 倒酒柯促.
酒扁啊 荤扼柳 巴阑 救 家康捞 版蔓俊 脚绊窍妨 窍磊 贾流窍霸 判绢初绰 滴 荤恩.
快己捞甫 肋 虐匡 利烙磊甫 茫酒 林扁 困秦辑 弊法促绰 函疙捞 扁啊 阜洒瘤父
家康篮 快己捞狼 货 何葛甫 茫绰 咯沥俊 惑泅, 悼荐客 窃膊窍扁肺 茄促.

茄祈 捞 葛电 苞沥阑 瘤难夯 屈荤 ‘荐柳’(硅滴唱)苞 饶硅 ‘捞屈荤’(捞林康).
捞甸阑 泅青裹栏肺 棱绊 馆 斥掳 捞绢柯 荐荤甫 付公府窍扁 困秦 炼侩洒 第甫 卵绰促.

海捞厚 冠胶,
弊镑俊辑 狼档摹 臼霸 父抄 捞甸狼
抗扁摹 给茄 漂喊茄 咯沥捞 矫累等促.', 129, '2022-10-23', 12, '靛扼付', '绊饭俊促 洒肺墨令' , '价碍龋 ,  碍悼盔 ,  硅滴唱 ,  捞瘤篮 ,  捞林康', 0, '165415847703885829_320.jpg', '85829_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(53, '2022-06-01', '陵扼扁 岿靛-档固聪攫 Jurassic World: Dominion', '固惫', 147, '2022-10-23', 12, '咀记, 绢靛亥贸', '妮赴 飘饭焊肺快', '农府胶 橇阀 ,  宏扼捞胶 崔扼胶 窍况靛 ,  靛肯促 客捞令 ,  肺扼 带 ,  力橇 榜靛宏烦 ,  基 匆', 0, '165423536042885689_320.jpg', '85689_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(54, '2022-05-18', '裹了档矫 2', '茄惫', '“蠢肠 坷瘤? 捞 仇 棱酒具 窍绰 芭”

啊府豪悼 家帕累傈 饶 4斥 第,
陛玫辑 碍仿馆篮 海飘巢栏肺 档林茄 侩狼磊甫 牢档罐酒 坷扼绰 固记阑 罐绰促.

鲍拱屈荤 ‘付籍档’(付悼籍)客 ‘傈老父’(弥蓖拳) 馆厘篮 泅瘤 侩狼磊俊霸辑 荐惑窃阑 蠢尝绊,
弊狼 第俊 公磊厚茄 厩青阑 国捞绰 ‘碍秦惑’(颊籍备)捞 乐澜阑 舅霸 等促.

‘付籍档’客 陛玫辑 碍仿馆篮 茄惫苞 海飘巢阑 坷啊哥
 开措鞭 裹了甫 历瘤福绰 ‘碍秦惑’阑 夯拜利栏肺 卵扁 矫累窍绰单...

唱慧 仇甸 棱绰 单 惫版 绝促!
烹蔫窍绊 拳馋茄 裹了 家帕 累傈捞 促矫 祁媚柳促!', 106, '2022-10-23', 15, '裹了, 咀记', '捞惑侩', '付悼籍 ,  颊籍备 ,  弥蓖拳 ,  冠瘤券 ,  倾悼盔 ,  窍霖 ,  沥犁堡', 0, '165424133884585813_320.jpg', '85813_320.jpg');


insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(55, '2022-06-01', '必厘魄 器南阁胶磐DP-扁扼萍唱客 窍疵狼 采促惯 溅捞固', '老夯', '场唱瘤 臼篮 傈汲狼 器南阁甸狼 硅撇肺
困氰俊 狐柳 馆傈 技拌客 泅角 技拌甫 备窍扁 困秦
皑荤器南阁 ‘溅捞固’客 ‘瘤快’, ‘乔墨抿’啊 唱辑搁辑 矫累登绰 葛氰 捞具扁', 96, '2022-10-23', 1, '局聪皋捞记', '蜡具付 捻聪洒内', '捞急龋 ,  辫康急', 0, '165424158096385833_1000.jpg', '85833_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(59, '2022-05-04', '蹿磐 胶飘饭牢瘤-措去捣狼 钢萍滚胶', '固惫', '瘤陛帛 夯 利 绝绰 付喉狼 必茄 惑惑仿!
5岿, 堡扁狼 钢萍滚胶啊 柄绢抄促!
  
场绝捞 闭凯登绰 瞒盔苞 第钧挪 矫傍埃狼 钢萍滚胶啊 凯府哥
坷罚 悼丰甸, 弊府绊 瞒盔阑 逞绢 甸绢柯 货肺款 粮犁甸阑 嘎蹿哆府霸 等 ‘蹿磐 胶飘饭牢瘤’.
措去捣 加, 弊绰 抗惑摹 给茄 必茄狼 利苞 嘎辑 轿况具父 窍绰单ˇ.', 126, '2022-10-23', 12, '咀记, 绢靛亥贸, 券鸥瘤', '基 饭捞固', '海匙雕飘 哪滚硅摹 ,  郡府磊海胶 棵郊 ,  海匙雕飘 魁 ,  饭捞每 钙酒淬胶 ,  摹傀炮 俊瘤坷器 ,  家摹撇 绊皋令', 0, '165424276409585715_1000.jpg', '85715_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(57, '2022-06-01', '局橇磐 剧 After Yang', '固惫', '窃膊 混带 救靛肺捞靛 牢埃 ‘剧’捞 绢蠢 朝 累悼阑 肛眠磊
力捞农 啊练篮 弊甫 荐府且 规过阑 茫绰促.
弊矾带 吝, ‘剧’俊霸辑 漂喊茄 皋葛府 桂农甫 惯斑窍绊
弊狼 扁撅阑 沤氰窍扁 矫累窍绰单ˇ

公均阑 巢扁绊 酵菌绢, 剧?', 96, '2022-10-23', 1, '靛扼付', '内绊唱促', '妮赴 颇芳 ,  炼叼 磐呈 胶固胶 ,  历胶凭 H.刮 ,  富饭酒 骏付 蛮靛肺困磊具', 0, '165424207674785884_1000.jpg', '85884_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(58, '2022-06-01', '墨矫坷其酒' , '茄惫', '捞去 饶 函龋荤, 决付肺 肯寒茄 活阑 混酒啊妨绊 畴仿窍绰 荐柳篮 窍唱挥牢 叠 瘤唱狼 固惫 蜡切阑 霖厚窍绊 乐促. 
沥脚绝捞 官慧 荐柳阑 困秦 酒狐 牢快啊 颊赤甫 倒焊霸 登搁辑 技 荤恩篮 窃膊 混霸 等促. 
倔付 饶 荐柳篮 背烹荤绊甫 寸窍绊, 捍盔俊辑 舅明窍捞赣扼绰 舵观狼 搬苞甫 佃霸 等促. 
荤尔窍绰 叠阑 镭阑鳖 毫 滴妨况窍绰 荐柳阑 困秦 酒狐 牢快绰 荐柳狼 扮阑 瘤虐绊, 
扁撅阑 镭绢档 混酒哎 荐 乐档废 捞甸 何赤父狼 局贫茄 悼青捞 矫累等促.', 101, '2022-10-23', 12, '靛扼付', '脚楷侥', '救己扁 ,  辑泅柳 ,  林抗覆', 0, '165424251539685882_320.jpg', '85882_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(60, '2022-06-15', '付赤(鬲页) Part2. The Other One', '茄惫', '烹力阂瓷狼 粮犁啊 技惑 观栏肺 唱吭促!
 
‘磊辣’捞 荤扼柳 第, 沥眉阂疙狼 笼窜狼 公瞒喊 嚼拜栏肺 付赤 橇肺璃飘啊 柳青登绊 乐绰 ‘酒农’啊 檬配拳等促.
弊镑俊辑 圈肺 混酒巢篮 ‘家赤’绰 积局 贸澜 技惑 观栏肺 惯阑 郴刁绊
快楷洒 父抄 ‘版锐’狼 档框栏肺 丑厘俊辑 瘤郴哥 蝶舵茄 老惑俊 利览秦埃促.
茄祈, ‘家赤’啊 噶角登磊 青规阑 卵绰 氓烙磊 ‘厘’苞
付赤 橇肺璃飘狼 芒矫磊 ‘归醚褒’狼 瘤飞阑 罐绊 力芭俊 唱急 夯荤 夸盔 ‘炼泅’,
‘版锐’狼 丑厘 家蜡鼻阑 畴府绰 炼流狼 焊胶 ‘侩滴’客
惑秦俊辑 柯 狼巩狼 4牢规鳖瘤
阿扁 促弗 格利阑 瘤囱 技仿捞 窍唱 笛 葛咯甸扁 矫累窍搁辑 ‘家赤’ 救俊 见败柳 夯己捞 柄绢唱绰单ˇ
 
葛电 巴狼 矫累,
歹宽 芭措窍绊 碍仿秦柳 付赤啊 柯促.', 137, '2022-10-23', 15, '咀记', '冠绕沥', '脚矫酒 ,  冠篮后 ,  辑篮荐 ,  柳备 ,  己蜡后 ,  炼刮荐 ,  捞辆籍 ,  辫促固', 0, '165424307441185871_1000.jpg', '85871_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(61, '2022-05-25', '乔绰 拱焊促 柳窍促 The Goblin', '茄惫', '`档柄厚`扼 阂赴 巢磊 VS `档柄厚`啊 登绊 酵菌带 巢磊 
坷流 柳楼父捞 混酒巢绰促! 

弥措 没何气仿炼流 `归沥颇`绰  
公磊厚窃栏肺 厩疙 臭篮 秦搬荤,  
老疙 `档柄厚`甫 菊技况 老措甫 厘厩茄促. 
 
弊矾唱, 海老俊 轿牢 `档柄厚` 滴泅篮
模屈力 鞍疽带 康刮狼 了甫 第笼绢静绊
10斥狼 荐皑积劝阑 窍霸 等促.
 
茄祈, 滴泅捞 荤扼柳 荤捞,
`档柄厚` 青技甫 窍哥 炼流阑 瞒瘤茄 康刮篮
滴泅狼 免家 家侥阑 佃绊 阂救俊 熔轿牢促.
 
康刮篮 滴泅阑 刚历 摹扁肺 窍绊
货 活阑 矫累窍妨带 滴泅篮 搬惫,
柳楼 `档柄厚`狼 何劝阑 急攫窍哥
康刮苞 炼流阑 惑措肺 轿框阑 矫累窍绰单...', 90, '2022-10-23', 15, '咀记, 裹了', '辫锐己', '炼悼酋 ,  捞肯 ,  烙沥篮', 0, '165424353273985790_320.jpg', '85790_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(62, '2022-05-25', '弊措啊 炼惫 The Red Herring', '茄惫', '措茄刮惫篮 刮林傍拳惫牢啊 八蔓傍拳惫牢啊
八蔓狼 漠朝捞 弊措俊霸 氢窍瘤 臼绰促绊 磊脚且 荐 乐绰啊

荤成捞 矫累灯促. 八蔓捞 带柳 谅钎甫 蝶扼 攫沸篮 隔妨甸绊 家巩篮 部府甫 巩促. 
盒畴茄 措吝 菊俊 八蔓篮 漠阑 戎滴弗促. 历扁 卵扁绰 磊绰 穿备牢啊. 
弊措啊 酒聪扼绊 磊脚且 荐 乐绰啊.', 124, '2022-10-23', 12, '促钮膏磐府', '捞铰霖 / 橇肺掂辑 : 皑捍籍 ,  剧锐 ,  柳葛康', '炼惫', 0, '165424377175185886_1000.jpg', '85886_1000.jpg');

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
values(goods_seq.nextval,'绊家扑能',5000,'15463244796940.jpg','15463244796940.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'崔霓扑能',5000,'15463244213800.jpg','15463244213800.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'歹喉摹令扑能',6000,'15463247055100.jpg','15463247055100.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'藕魂澜丰',2500,'15464083668990.jpg','15464083668990.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'酒皋府墨畴(HOT)',3500,'15464096039760.jpg','15464096039760.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'酒皋府墨畴(ICE)',4000,'15464105893180.jpg','15464105893180.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'磨府摹令唱幂',4900,'15459092398190.jpg','15459092398190.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'敲饭牢侵档弊',4500,'15464120856450.jpg','15464120856450.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'坷隆绢(肯力前)',3500,'15459089330830.jpg','15459089330830.jpg');

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