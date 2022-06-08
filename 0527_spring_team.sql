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

--��Ȱ��ȭ
--ALTER TABLE ������.���̺�� DISABLE CONSTRAINT �������Ǹ�;
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
--��������Ȱ��ȭ
--ALTER TABLE ������.���̺�� ENABLE NOVALIDATE CONSTRAINT �������Ǹ�; /*���� �����Ϳ� ���� ���ռ� üũ ��
ALTER TABLE NOTICE_T MODIFY N_DATE DEFAULT SYSDATE;
ALTER TABLE FAQ MODIFY F_DATE DEFAULT SYSDATE;
ALTER TABLE QNA MODIFY Q_DATE DEFAULT SYSDATE;

insert into book values(1,1,1,1,1,'wjdcksgml',1,'1997-12-19');
insert into review values(1,1,'wjdcksgml',1,1,'1997-12-19',1);
insert into faq values(1,'wjdcksgml',1,1,1,'1997-12-19',1);
insert into NOTICE_T values(1,'wjdcksgml',1,1,'1997-12-19',1,1);
insert into QNA values(1,'wjdcksgml',1,1,1,'1997-12-19',1,1,1);
insert into history values(1,1,'wjdcksgml',1,1);
insert into movie values(1,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(2,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(3,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(4,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(5,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);
insert into movie values(6,'2022-06-03','����','�Ұ�','��ȭ�󼼼���',1,'2022-06-02',1,'�帣','������','���',1,'3.jpg','16542335726743.jpg',null);

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
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(101,1014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(102,1024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(103,1034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(104,1044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(105,1054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(106,1064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(107,1074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(108,1084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(109,1094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1101,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1102,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1103,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(110,1104,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1111,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1112,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1113,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(111,1114,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1121,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1122,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1123,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(112,1124,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1131,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1132,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1133,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(113,1134,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1141,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1142,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1143,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(114,1144,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1151,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1152,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1153,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(115,1154,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1161,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1162,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1163,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(116,1164,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1171,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1172,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1173,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(117,1174,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1181,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1182,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1183,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(118,1184,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(201,2014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(202,2024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(203,2034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(204,2044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(205,2054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(206,2064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(207,2074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(208,2084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(209,2094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2101,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2102,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2103,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(210,2104,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2111,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2112,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2113,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(211,2114,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2121,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2122,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2123,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(212,2124,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2131,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2132,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2133,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(213,2134,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2141,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2142,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2143,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(214,2144,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2151,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2152,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2153,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(215,2154,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2161,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2162,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2163,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(216,2164,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2171,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2172,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2173,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(217,2174,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2181,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2182,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2183,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(218,2184,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2191,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2192,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2193,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(219,2194,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2201,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2202,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2203,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(220,2204,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2211,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2212,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2213,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(221,2214,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(301,3014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(302,3024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(303,3034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(304,3044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(305,3054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(306,3064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(307,3074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(401,4014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(402,4024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(403,4034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(404,4044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(501,5014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(502,5024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(503,5034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(504,5044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(505,5054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(506,5064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(507,5074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(508,5084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(509,5094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(601,6014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(602,6024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(603,6034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(604,6044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(701,7014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(702,7024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(703,7034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(704,7044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(705,7054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(706,7064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(707,7074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(708,7084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(709,7094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(801,8014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(802,8024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(803,8034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(804,8044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(805,8054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(806,8064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(807,8074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(808,8084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(809,8094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9011,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9012,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9013,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(901,9014,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9021,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9022,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9023,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(902,9024,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9031,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9032,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9033,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(903,9034,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9041,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9042,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9043,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(904,9044,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9051,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9052,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9053,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(905,9054,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9061,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9062,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9063,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(906,9064,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9071,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9072,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9073,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(907,9074,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9081,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9082,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9083,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(908,9084,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9091,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9092,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9093,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(909,9094,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9101,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9102,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9103,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(910,9104,'4��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9111,'1��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9112,'2��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9113,'3��');
INSERT INTO hall(t_code, h_code,h_name) VALUES(911,9114,'4��');

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
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(101,'����','����Ư���� ������ ���ﵿ','02)101');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(102,'����','����Ư���� ������ ���ǵ�','02)102');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(103,'�Ǵ��Ա�','����Ư���� ������ �ھ絿','02)103');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(104,'����','����Ư���� ���α� ����5��','02)104');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(105,'���з�','����Ư���� ���α� ���2��','02)105');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(106,'���빮','����Ư���� �߱� ������6��','02)106');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(107,'����','����Ư���� ������ ���̵�','02)107');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(108,'��','����Ư���� �߱� ��2��','02)108');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(109,'��','����Ư���� ��õ�� ��','02)109');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(110,'�̾�','����Ư���� ���ϱ� �̾Ƶ�','02)110');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(111,'����','����Ư���� ������ ���е�','02)111');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(112,'����','����Ư���� ���ı� ������','02)112');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(113,'����','����� ���ϱ� ������','02)113');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(114,'�б���','����Ư���� ������ �Ż絿','02)114');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(115,'���ǵ�','����Ư���� �������� ���ǵ���','02)115');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(116,'����','���� ������ ������','02)116');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(117,'������','����Ư���� �������� ��������','02)117');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(118,'ȫ��','����Ư���� ������ ������','02)118');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(201,'��Ɽ��','��⵵ ���ֽ� ����','031)201');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(202,'������','��⵵ ���� ���籸 ��ŵ�','031)202');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(203,'����','��⵵ ������ ���뱸 �ϵ�','031)203');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(204,'����','��⵵ ����� ������','031)204');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(205,'����','��⵵ ������ ��â��','031)205');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(206,'����','��⵵ ���ν� ���ﱸ ������','031)206');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(207,'����','��⵵ ������ ǳ����','031)207');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(208,'������','��⵵ ������ �ȴޱ� �ΰ赿?','031)208');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(209,'��ź','��⵵ ȭ���� �ݼ۵�','031)209');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(210,'��õ','��õ�� �ߵ� 1164����','031)210');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(211,'�꺻','������ �꺻��','031)211');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(212,'����','��⵵ ������ �ȴޱ�','031)212');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(213,'����ƿ���Ƽ����','��⵵ �ϳ��� �оϵ�','031)213');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(214,'����','��⵵ ����� ��ߵ�','031)214');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(215,'����','��⵵ ���ν� ó�α� �跮�嵿','031)215');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(216,'������','��⵵ �����ν� �����ε�','031)216');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(217,'�ϻ�','��⵵ ���� �ϻ굿�� ���׵�','031)217');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(218,'�Ǳ�','��⵵ ������ �д籸 ������?','031)218');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(219,'����','��⵵ �Ⱦ�� ���ȱ� ���絿','031)219');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(220,'����','��⵵ ���ý� ���õ�','031)220');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(221,'��õ','��⵵ ��õ�� ������','031)221');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(301,'���','��õ������ ��籸 ������','032)301');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(302,'����','��õ ������ ���� ûõ��','032)302');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(303,'�۵�Ÿ�ӽ����̽�','��õ������ ������ �۵���','032)303');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(304,'��õ','��õ������ ������ ������','032)304');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(305,'��õ����','��õ������ ������ ������','032)305');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(306,'�־�','��õ������ ����Ȧ�� �־ȵ�','032)306');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(307,'û��','��õ������ ���� û��','032)307');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(401,'����','������ ������ ��õ��','033)401');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(402,'����','������ ���ֽ� �ܰ赿','033)402');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(403,'����','������ ������ ������','033)403');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(404,'��õ','������ ��õ��','033)404');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(501,'���','�泲 ���� ����','043)501');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(502,'����','�泲 ������ ���1��','043)502');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(503,'����','���������� �߱� ��ȭ��','042)503');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(504,'����ź��','���������� ���� ź�浿','042)504');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(505,'����','����Ư����ġ�� ���̵�','041)505');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(506,'õ��','��û���� õ�Ƚ� ���ﵿ','041)506');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(507,'û��','��û�ϵ� û�ֽ� ��籸','041)507');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(508,'û���͹̳�','��û�ϵ� û�ֽ� ����� ���浿','041)508');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(509,'ȫ��','��û���� ȫ���� ȫ���� ��ϸ�','041)509');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(601,'�뱸����','�뱸������ ������ ������','053)601');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(602,'�뱸��Ÿ���','�뱸�� ������ ���ﵿ','053)602');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(603,'�뱸����','�뱸������ �ϱ� ���浿','053)603');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(604,'�뱸����','�뱸������ �߱� ������ 2��','053)604');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(701,'����','�λ걤���� ������ ��õ��','051)701');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(702,'�λ����','�λ걤���� ������ ������','051)702');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(703,'����','�λ걤���� ���� ����3��','051)703');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(704,'���ҽ�Ƽ','�λ걤���� �ؿ�뱸 �쵿','051)704');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(705,'��굿��','��걤���� ���� ��','051)705');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(706,'����õ','��걤���� �ϱ� ��õ��','051)706');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(707,'����','�λ�� ���屺 ������ ���и�','051)707');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(708,'�ؿ��','�λ걤���� �ؿ�뱸 �쵿','051)708');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(709,'ȭ��','�λ걤���� �ϱ� ȭ��','051)709');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(801,'����','��󳲵� ������ ������','055)801');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(802,'��','��󳲵� ���� ����','055)802');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(803,'����','���ؽ� ����','055)803');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(804,'��������','�泲 ���ؽ� ���ϵ�','055)804');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(805,'��������','��󳲵� ���ؽ� ��û��','055)805');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(806,'����','�泲 â���� ���� ȸ���� �ռ���','055)806');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(807,'��������','�泲 ���ֽ� �湫����','055)807');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(808,'â��','��󳲵� â���� �ȿ뵿','055)808');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(809,'�뿵','��󳲵� �뿵�� �Ͻŵ�','055)809');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(901,'����','���󳲵� ����� ��ȣ��','064)901');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(902,'���ֻ�','���ֱ����� ���� ġ��','064)902');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(903,'����÷��','���ֱ����� ���걸 �־ϵ� ÷������','064)903');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(904,'�����͹̳�','���ֱ����� ���� ��õ��','064)904');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(905,'����','����ϵ� ����� ���','064)905');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(906,'����','���󳲵� ���ֽ� ��������','064)906');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(907,'����','���󳲵� ������ ��','064)907');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(908,'��õ','���󳲵� ��õ�� ��õ��','064)908');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(909,'�ͻ�','����ϵ� �ͻ�� ���','064)909');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(910,'����','����ϵ� ������ ������','064)910');
INSERT INTO theather(t_code,t_name,t_addr,t_tel) VALUES(911,'����','����Ư����ġ�� ���ֽ�','064)911');

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
values(41, '2022-06-08', '���Ŀ Broker', '�ѱ�', '��Ź�Ҹ� ������� �� ���� �ô޸��� ��������(�۰�ȣ)��
���̺� �ڽ� �ü����� ���ϴ� ������ ����� ��������(������).
�ż� �� ������ ��� �� ��,
�׵��� ���̺� �ڽ��� ���� �� �Ʊ⸦ ���� ��������.
������ ��Ʊ��, ������ ���ϰ� ���� ���ҿ���(������)�� �Ʊ� ���켺���� ã���� ���ƿ´�.
�ƱⰡ ����� ���� �� �ҿ��� ������ �Ű��Ϸ� ���� �����ϰ� �о���� �� ���.
�켺�̸� �� Ű�� �����ڸ� ã�� �ֱ� ���ؼ� �׷��ٴ� ������ �Ⱑ ��������
�ҿ��� �켺���� �� �θ� ã�� ������ ����, ������ �Բ��ϱ�� �Ѵ�.

���� �� ��� ������ ���Ѻ� ���� ��������(��γ�)�� �Ĺ� �������硯(���ֿ�).
�̵��� ��������� ��� �� ��° �̾�� ���縦 �������ϱ� ���� ������ �ڸ� �Ѵ´�.

���̺� �ڽ�,
�װ����� �ǵ�ġ �ʰ� ���� �̵���
����ġ ���� Ư���� ������ ���۵ȴ�.', 129, '2022-10-23', 12, '���', '������ ����ī��' , '�۰�ȣ ,  ������ ,  ��γ� ,  ������ ,  ���ֿ�', 0, '165415847703885829_320.jpg', '85829_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(53, '2022-06-01', '���� ����-���̴Ͼ� Jurassic World: Dominion', '�̱�', 147, '2022-10-23', 12, '�׼�, ��庥ó', '�ݸ� Ʈ�����ο�', 'ũ���� ���� ,  ����̽� �޶� �Ͽ��� ,  ��ϴ� ������ ,  �ζ� �� ,  ���� ���귳 ,  �� ��', 0, '165423536042885689_320.jpg', '85689_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(54, '2022-05-18', '���˵��� 2', '�ѱ�', '������ ����? �� �� ��ƾ� �ϴ� �š�

�������� �������� �� 4�� ��,
��õ�� ���¹��� ��Ʈ������ ������ �����ڸ� �ε��޾� ����� �̼��� �޴´�.

�������� ����������(������)�� �����ϸ���(�ֱ�ȭ) ������ ���� �����ڿ��Լ� �������� ������,
���� �ڿ� ���ں��� ������ ���̴� �����ػ�(�ռ���)�� ������ �˰� �ȴ�.

������������ ��õ�� ���¹��� �ѱ��� ��Ʈ���� ������
 ����� ���˸� �������� �����ػ��� ���������� �ѱ� �����ϴµ�...

���� ��� ��� �� ���� ����!
�����ϰ� ȭ���� ���� ���� ������ �ٽ� ��������!', 106, '2022-10-23', 15, '����, �׼�', '�̻��', '������ ,  �ռ��� ,  �ֱ�ȭ ,  ����ȯ ,  �㵿�� ,  ���� ,  ���籤', 0, '165424133884585813_320.jpg', '85813_320.jpg');


insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(55, '2022-06-01', '������ ���ϸ���DP-���Ƽ���� �ϴ��� �ɴٹ� ���̹�', '�Ϻ�', '������ ���� ������ ���ϸ���� ��Ʋ��
���迡 ���� ���� ����� ���� ���踦 ���ϱ� ����
�������ϸ� �����̡̹��� �����졯, ����ī�򡯰� �����鼭 ���۵Ǵ� ���� �̾߱�', 96, '2022-10-23', 1, '�ִϸ��̼�', '���߸� �������', '�̼�ȣ ,  �迵��', 0, '165424158096385833_1000.jpg', '85833_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(59, '2022-05-04', '���� ��Ʈ������-��ȥ���� ��Ƽ����', '�̱�', '���ݲ� �� �� ���� ������ ���� ����!
5��, ������ ��Ƽ������ �����!
  
������ �տ��Ǵ� ������ �ھ�Ų �ð����� ��Ƽ������ ������
���� �����, �׸��� ������ �Ѿ� ���� ���ο� ������� �´ڶ߸��� �� ������ ��Ʈ��������.
��ȥ�� ��, �״� ����ġ ���� ������ ���� �¼� �ο��߸� �ϴµ���.', 126, '2022-10-23', 12, '�׼�, ��庥ó, ȯŸ��', '�� ���̹�', '���׵�Ʈ �Ĺ���ġ ,  �����ں��� �ý� ,  ���׵�Ʈ �� ,  ����ÿ �ƾƴ㽺 ,  ġ���� �������� ,  ��ġƲ �����', 0, '165424276409585715_1000.jpg', '85715_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(57, '2022-06-01', '������ �� After Yang', '�̱�', '�Բ� ��� �ȵ���̵� �ΰ� ���硯�� ��� �� �۵��� ������
����ũ ������ �׸� ������ ����� ã�´�.
�׷��� ��, ���硯���Լ� Ư���� �޸� ��ũ�� �߰��ϰ�
���� ����� Ž���ϱ� �����ϴµ���

������ ����� �;���, ��?', 96, '2022-10-23', 1, '���', '�ڰ���', '�ݸ� �ķ� ,  ���� �ͳ� ���̽� ,  ����ƾ H.�� ,  ������ ���� ��������ھ�', 0, '165424207674785884_1000.jpg', '85884_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(58, '2022-06-01', 'ī�ÿ����' , '�ѱ�', '��ȥ �� ��ȣ��, ������ �Ϻ��� ���� ��ư����� ����ϴ� ������ �ϳ����� �� ������ �̱� ������ �غ��ϰ� �ִ�. 
���ž��� �ٻ� ������ ���� �ƺ� �ο찡 �ճฦ ������ �Ǹ鼭 �� ����� �Բ� ��� �ȴ�. 
�� �� ������ ������ ���ϰ�, �������� �������̸Ӷ�� ����� ����� ��� �ȴ�. 
����ϴ� ���� ������ �� �η����ϴ� ������ ���� �ƺ� �ο�� ������ ���� ��Ű��, 
����� �ؾ ��ư� �� �ֵ��� �̵� �γุ�� ��ƶ�� ������ ���۵ȴ�.', 101, '2022-10-23', 12, '���', '�ſ���', '�ȼ��� ,  ������ ,  �ֿ���', 0, '165424251539685882_320.jpg', '85882_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(60, '2022-06-15', '����(تҳ) Part2. The Other One', '�ѱ�', '�����Ҵ��� ���簡 ���� ������ ���Դ�!
 
���������� ����� ��, ��ü�Ҹ��� ������ ������ �������� ���� ������Ʈ�� ����ǰ� �ִ� ����ũ���� ����ȭ�ȴ�.
�װ����� Ȧ�� ��Ƴ��� ���ҳ࡯�� ���� ó�� ���� ������ ���� �����
�쿬�� ���� �������� �������� ���忡�� ������ ������ �ϻ� �����ذ���.
����, ���ҳ࡯�� ���ǵ��� ����� �Ѵ� å���� ���塯��
���� ������Ʈ�� â���� �����Ѱ����� ������ �ް� ���ſ� ���� ���� ��� ��������,
�������� ���� �������� �븮�� ������ ���� ����Ρ���
���ؿ��� �� �ǹ��� 4�ι����
���� �ٸ� ������ ���� ������ �ϳ� �� �𿩵�� �����ϸ鼭 ���ҳ࡯ �ȿ� ������ ������ ����µ���
 
��� ���� ����,
���� �Ŵ��ϰ� �������� ���డ �´�.', 137, '2022-10-23', 15, '�׼�', '������', '�Žþ� ,  ������ ,  ������ ,  ���� ,  ������ ,  ���μ� ,  ������ ,  ��ٹ�', 0, '165424307441185871_1000.jpg', '85871_1000.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(61, '2022-05-25', '�Ǵ� ������ ���ϴ� The Goblin', '�ѱ�', '`������`�� �Ҹ� ���� VS `������`�� �ǰ� �;��� ���� 
���� ��¥���� ��Ƴ��´�! 

�ִ� û���������� `������`��  
���ں������� �Ǹ� ���� �ذ��,  
�ϸ� `������`�� �ռ��� �ϴ븦 ����Ѵ�. 
 
�׷���, ���Ͽ� ���� `������` ������
ģ���� ���Ҵ� ������ �˸� �������
10���� ������Ȱ�� �ϰ� �ȴ�.
 
����, ������ ����� ����,
`������` �༼�� �ϸ� ������ ������ ������
������ ��� �ҽ��� ��� �Ҿȿ� �۽��δ�.
 
������ ������ ���� ġ��� �ϰ�
�� ���� �����Ϸ��� ������ �ᱹ,
��¥ `������`�� ��Ȱ�� �����ϸ�
���ΰ� ������ ���� �ο��� �����ϴµ�...', 90, '2022-10-23', 15, '�׼�, ����', '����', '������ ,  �̿� ,  ������', 0, '165424353273985790_320.jpg', '85790_320.jpg');

insert into movie(m_code, m_date, m_title, m_intro, m_detail, m_time, m_period, m_grade, m_genre, m_director, m_actor, m_rate, m_position, m_originimg)
values(62, '2022-05-25', '�״밡 ���� The Red Herring', '�ѱ�', '���ѹα��� ���ְ�ȭ���ΰ� ������ȭ���ΰ�
������ Į���� �״뿡�� ������ �ʴ´ٰ� �ڽ��� �� �ִ°�

����� ���۵ƴ�. ������ ���� ��ǥ�� ���� ����� ������� �ҹ��� ������ ����. 
�г��� ���� �տ� ������ Į�� �ֵθ���. ���� �ѱ�� �ڴ� �����ΰ�. 
�״밡 �ƴ϶�� �ڽ��� �� �ִ°�.', 124, '2022-10-23', 12, '��ť���͸�', '�̽��� / ���ε༭ : ������ ,  ���� ,  ����', '����', 0, '165424377175185886_1000.jpg', '85886_1000.jpg');

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
values(goods_seq.nextval,'�������',5000,'15463244796940.jpg','15463244796940.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'��������',5000,'15463244213800.jpg','15463244213800.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'����ġ������',6000,'15463247055100.jpg','15463247055100.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'ź������',2500,'15464083668990.jpg','15464083668990.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'�Ƹ޸�ī��(HOT)',3500,'15464096039760.jpg','15464096039760.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'�Ƹ޸�ī��(ICE)',4000,'15464105893180.jpg','15464105893180.jpg');

insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'ĥ��ġ���',4900,'15459092398190.jpg','15459092398190.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'�÷����ֵ���',4500,'15464120856450.jpg','15464120856450.jpg');
insert into goods(g_code, g_name, g_price, img_origin, img_1)
values(goods_seq.nextval,'��¡��(����ǰ)',3500,'15459089330830.jpg','15459089330830.jpg');

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