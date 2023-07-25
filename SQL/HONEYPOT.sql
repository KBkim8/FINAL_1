-- DROP
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;
DROP TABLE FRIEND CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE NOTICE_IMG CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE BOARD_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE NOTICE_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE FAQ_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE QNA_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE CHATTING_ROOM CASCADE CONSTRAINTS;
DROP TABLE CHATTING_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE DELIVERY CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE REPORT_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE AMENITY_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE BOARD_IMG CASCADE CONSTRAINTS;
DROP TABLE BOARD_STATUS CASCADE CONSTRAINTS;
DROP TABLE CHATTING_MEMBER_LIST CASCADE CONSTRAINTS;
DROP TABLE LOVE CASCADE CONSTRAINTS;
DROP TABLE RESTRICTION CASCADE CONSTRAINTS;
DROP TABLE MEMBER_FEE CASCADE CONSTRAINTS;
DROP TABLE MEMBER_FEE_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE MEMBER_CALENDAR CASCADE CONSTRAINTS;
DROP TABLE NOTICE_CALENDAR CASCADE CONSTRAINTS;
DROP TABLE EQUIPMENT CASCADE CONSTRAINTS;
DROP TABLE BREAKFAST CASCADE CONSTRAINTS;
DROP TABLE MEAL_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE AROUND_EVALUATION CASCADE CONSTRAINTS;
DROP TABLE VOTE_CANDIDATE CASCADE CONSTRAINTS;
DROP TABLE VOTE CASCADE CONSTRAINTS;
DROP TABLE PERSONAL_VOTE CASCADE CONSTRAINTS;
DROP TABLE CAPTAIN_LOVE CASCADE CONSTRAINTS;
DROP TABLE ADMIN_FEE_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE ADMIN_FEE CASCADE CONSTRAINTS;
DROP TABLE PARCEL CASCADE CONSTRAINTS;
DROP TABLE DIET CASCADE CONSTRAINTS;
DROP TABLE AROUND CASCADE CONSTRAINTS;
DROP TABLE BICYCLE CASCADE CONSTRAINTS;
DROP TABLE CAR CASCADE CONSTRAINTS;
DROP TABLE AMENITY_IMG CASCADE CONSTRAINTS;
DROP TABLE ADMIN_CALL CASCADE CONSTRAINTS;
DROP TABLE AMENITY_MANAGE CASCADE CONSTRAINTS;
DROP TABLE AMENITY CASCADE CONSTRAINTS;

-- CREATE

CREATE TABLE MEMBER (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(100)		NULL,
	ID	VARCHAR2(100)		NULL,
	PWD	VARCHAR2(100)		NULL,
	DONG_NUM	NUMBER		NULL,
	HO_NUM	NUMBER		NULL,
	BIRTH	CHAR(8)		NULL,
	PHONE	CHAR(11)		NULL,
	EMAIL	VARCHAR2(100)		NULL,
	PROFILE	VARCHAR2(500)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	GRADE	CHAR(1)	DEFAULT 'M'	NULL
);
DROP SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

CREATE TABLE POINT (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	SCORE	NUMBER		NULL,
	CONTENT	VARCHAR2(500)		NULL,
	POINT_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_POINT_NO;
CREATE SEQUENCE SEQ_POINT_NO NOCACHE NOCYCLE;

CREATE TABLE FRIEND (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	FRIEND_NO	NUMBER		NOT NULL
);
DROP SEQUENCE SEQ_FRIEND_NO;
CREATE SEQUENCE SEQ_FRIEND_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE (
	NO	NUMBER		NOT NULL,
	NOTICE_CNO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	HIT	NUMBER	DEFAULT 0	NULL,
	IMPORTANT_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_IMG (
	NO	NUMBER		NOT NULL,
	NOTICE_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE REPLY (
	NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	WRITER_NO	VARCHAR2(500)		NOT NULL,
	REPLY_NO	NUMBER		    NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_REPLY_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD (
	NO	NUMBER		NOT NULL,
	WRITER_NO	VARCHAR2(500)		NOT NULL,
	BOARD_STATUS_NO	NUMBER		NOT NULL,
	BOARD_CNO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	HIT	NUMBER	DEFAULT 0	NULL
);
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE FAQ (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	FAQ_CNO	NUMBER		NOT NULL,
	QUESTION	VARCHAR2(1000)		NULL,
	ANSWER	VARCHAR2(4000)		NULL,
	STATUS	CHAR(1)	DEFAULT 'N'	NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	HIT	NUMBER	DEFAULT 0	NULL
);
DROP SEQUENCE SEQ_FAQ_NO;
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN (
	NO	NUMBER		NOT NULL,
	ID	VARCHAR2(100)		NULL,
	PWD	VARCHAR2(100)		NULL,
	NAME	VARCHAR2(100)		NULL,
	GRADE	CHAR(1)		NULL,
	PROFILE	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ADMIN_NO;
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE FAQ_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_FAQ_CATEGORY_NO;
CREATE SEQUENCE SEQ_FAQ_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE QNA (
	NO	NUMBER		NOT NULL,
	QNA_CNO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	ANSWER_DATE	TIMESTAMP		NULL,
	ANSWER	VARCHAR2(4000)		NULL,
    ANSWER_YN   CHAR(1) DEFAULT 'N'
);
DROP SEQUENCE SEQ_QNA_NO;
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

CREATE TABLE QNA_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_QNA_CATEGORY_NO;
CREATE SEQUENCE SEQ_QNA_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE CHATTING_ROOM (
	NO	NUMBER		NOT NULL,
	MASTER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	IMG	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_CHATTING_ROOM_NO;
CREATE SEQUENCE SEQ_CHATTING_ROOM_NO NOCACHE NOCYCLE;

CREATE TABLE CHATTING_MESSAGE (
	NO	NUMBER		NOT NULL,
	CHATTING_ROOM_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	SEND_TIME	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CONTENT	VARCHAR2(4000)		NULL
);
DROP SEQUENCE SEQ_CHATTING_MESSAGE_NO;
CREATE SEQUENCE SEQ_CHATTING_MESSAGE_NO NOCACHE NOCYCLE;

CREATE TABLE DELIVERY (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	ARRIVE_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	RECEIVE_DATE	TIMESTAMP		NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_DELIVERY_NO;
CREATE SEQUENCE SEQ_DELIVERY_NO NOCACHE NOCYCLE;

CREATE TABLE REPORT (
	NO	NUMBER		NOT NULL,
	REPORT_CNO	NUMBER		NOT NULL,
	REPORTER	NUMBER		NOT NULL,
	RESPONDENT	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	ANSWER_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_REPORT_NO;
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE NOCYCLE;

CREATE TABLE REPORT_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_REPORT_CATEGORY_NO;
CREATE SEQUENCE SEQ_REPORT_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_RESERVATION (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	RESERVE_TIME	  VARCHAR2(20)	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_AMENITY_RESERVATION_NO;
CREATE SEQUENCE SEQ_AMENITY_RESERVATION_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	MAX_NUM	NUMBER		NULL,
	OPEN_TIME	VARCHAR2(10)	NULL,
	CLOSE_TIME	VARCHAR2(10)	NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	LOCATION	VARCHAR2(2000)		NULL
);
DROP SEQUENCE SEQ_AMENITY_NO;
CREATE SEQUENCE SEQ_AMENITY_NO NOCACHE NOCYCLE;

CREATE TABLE ACCOUNT (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	ACCOUNT_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	PRICE	NUMBER		NULL,
	ACCOUNT_DATE	TIMESTAMP		NULL,
    STATUS CHAR(1) DEFAULT 'Y' NULL
);
DROP SEQUENCE SEQ_ACCOUNT_NO;
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

CREATE TABLE ACCOUNT_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ACCOUNT_CATEGORY_NO;
CREATE SEQUENCE SEQ_ACCOUNT_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD_IMG (
	NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_BOARD_IMG_NO;
CREATE SEQUENCE SEQ_BOARD_IMG_NO NOCACHE NOCYCLE;

CREATE TABLE BOARD_STATUS (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);

CREATE TABLE CHATTING_MEMBER_LIST (
	CHATTING_ROOM_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	READ_TIME	TIMESTAMP		NULL
);

CREATE TABLE LOVE (
	MEMBER_NO	NUMBER		NOT NULL,
	BOARD_NO	NUMBER		NOT NULL
);

CREATE TABLE RESTRICTION (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
    STOP_NUM NUMBER         NOT NULL
);
DROP SEQUENCE SEQ_RESTRICTION_NO;
CREATE SEQUENCE SEQ_RESTRICTION_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_FEE (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	FEE_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	PRICE	NUMBER		NULL,
	PAYMENT_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_MEMBER_FEE_NO;
CREATE SEQUENCE SEQ_MEMBER_FEE_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_FEE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_MEMBER_FEE_CATEGORY_NO;
CREATE SEQUENCE SEQ_MEMBER_FEE_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE MEMBER_CALENDAR (
	NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL,
	LOVE	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_MEMBER_CALENDAR_NO;
CREATE SEQUENCE SEQ_MEMBER_CALENDAR_NO NOCACHE NOCYCLE;

CREATE TABLE NOTICE_CALENDAR (
	NO	NUMBER		NOT NULL,
	WRTIER_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL,
	LOVE	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_NOTICE_CALENDAR_NO;
CREATE SEQUENCE SEQ_NOTICE_CALENDAR_NO NOCACHE NOCYCLE;

CREATE TABLE EQUIPMENT (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CNT	NUMBER		NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	MODIFY_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL
);
DROP SEQUENCE SEQ_EQUIPMENT_NO;
CREATE SEQUENCE SEQ_EQUIPMENT_NO NOCACHE NOCYCLE;

CREATE TABLE BREAKFAST (
	NO	NUMBER		NOT NULL,
	DIET_NO	NUMBER		NOT NULL,
	BREAKFAST_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL
);
DROP SEQUENCE SEQ_BREAKFAST_NO;
CREATE SEQUENCE SEQ_BREAKFAST_NO NOCACHE NOCYCLE;

CREATE TABLE MEAL_RESERVATION (
	NO	NUMBER		NOT NULL,
	MEAL_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_MEAL_RESERVATION_NO;
CREATE SEQUENCE SEQ_MEAL_RESERVATION_NO NOCACHE NOCYCLE;

CREATE TABLE AROUND_EVALUATION (
	NO	NUMBER		NOT NULL,
	AROUND_NO	NUMBER		NOT NULL,
	WRITER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	SCORE	NUMBER		NULL,
	ENROLL_DATE	TIMESTAMP		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL
);
DROP SEQUENCE SEQ_AROUND_EVALUATION_NO;
CREATE SEQUENCE SEQ_AROUND_EVALUATION_NO NOCACHE NOCYCLE;

CREATE TABLE VOTE_CANDIDATE (
	NO	NUMBER		NOT NULL,
	NOTICE_NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_VOTE_CANDIDATE_NO;
CREATE SEQUENCE SEQ_VOTE_CANDIDATE_NO NOCACHE NOCYCLE;

CREATE TABLE VOTE (
	NOTICE_NO	NUMBER		NOT NULL,
	TITLE	VARCHAR2(500)		NULL,
	END_DATE	TIMESTAMP		NULL,
	STATUS	CHAR(1)	DEFAULT 'Y'	NULL,
	DUP_YN	CHAR(1)	DEFAULT 'N'	NULL
);

CREATE TABLE PERSONAL_VOTE (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	VOTE_LIST_NO	NUMBER		NOT NULL
);
DROP SEQUENCE SEQ_PERSONAL_VOTE_NO;
CREATE SEQUENCE SEQ_PERSONAL_VOTE_NO NOCACHE NOCYCLE;

CREATE TABLE CAPTAIN_LOVE (
	MEMBER_NO	NUMBER		NOT NULL,
	CAPTAIN_NO	NUMBER		NOT NULL,
	LOVE	CHAR(1)		NULL
);

CREATE TABLE ADMIN_FEE_CATEGORY (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_ADMIN_FEE_CATEGORY_NO;
CREATE SEQUENCE SEQ_ADMIN_FEE_CATEGORY_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN_FEE (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	FEE_CNO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	PRICE	NUMBER		NULL,
	PAYMENT_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_ADMIN_FEE_NO;
CREATE SEQUENCE SEQ_ADMIN_FEE_NO NOCACHE NOCYCLE;

CREATE TABLE PARCEL (
	NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	ARRIVE_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	RECEIVE_DATE	TIMESTAMP		NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_PARCEL_NO;
CREATE SEQUENCE SEQ_PARCEL_NO NOCACHE NOCYCLE;

CREATE TABLE DIET (
	NO	NUMBER		NOT NULL,
	MENU	VARCHAR2(500)		NULL,
	NUTRIENT	VARCHAR2(500)		NULL,
	IMG	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_DIET_NO;
CREATE SEQUENCE SEQ_DIET_NO NOCACHE NOCYCLE;

CREATE TABLE AROUND (
	NO	NUMBER		NOT NULL,
	NAME	VARCHAR2(500)		NULL,
	CONTENT	VARCHAR2(4000)		NULL,
	LATITUDE	CHAR(18)		NULL,
	LONGITUDE	CHAR(18)		NULL
);
DROP SEQUENCE SEQ_AROUND_NO;
CREATE SEQUENCE SEQ_AROUND_NO NOCACHE NOCYCLE;

CREATE TABLE BICYCLE (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER,
	MEMBER_NO	NUMBER		NOT NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CONFIRM_DATE	TIMESTAMP   NULL,
	UNIQUE_NUM	VARCHAR2(100)		NULL,
	IMG	VARCHAR2(500)		NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_BICYCLE_NO;
CREATE SEQUENCE SEQ_BICYCLE_NO NOCACHE NOCYCLE;

CREATE TABLE CAR (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER,
	MEMBER_NO	NUMBER		NOT NULL,
	ENROLL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CONFIRM_DATE	TIMESTAMP   NULL,
	UNIQUE_NUM	VARCHAR2(100)		NULL,
	IMG	VARCHAR2(500)		NULL,
	NAME	VARCHAR2(500)		NULL
);
DROP SEQUENCE SEQ_CAR_NO;
CREATE SEQUENCE SEQ_CAR_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_IMG (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	ORIGIN_NAME	VARCHAR2(100)		NULL,
    CHANGE_NAME VARCHAR2(100)       NULL
);
DROP SEQUENCE SEQ_AMENITY_IMG_NO;
CREATE SEQUENCE SEQ_AMENITY_IMG_NO NOCACHE NOCYCLE;

CREATE TABLE ADMIN_CALL (
	NO	NUMBER		NOT NULL,
	ADMIN_NO	NUMBER		NOT NULL,
	MEMBER_NO	NUMBER		NOT NULL,
	CONTENT	VARCHAR2(500)		NULL,
	CALL_DATE	TIMESTAMP	DEFAULT SYSDATE	NULL,
	CHECK_YN	CHAR(1)	DEFAULT 'N'	NULL
);
DROP SEQUENCE SEQ_ADMIN_CALL_NO;
CREATE SEQUENCE SEQ_ADMIN_CALL_NO NOCACHE NOCYCLE;

CREATE TABLE AMENITY_MANAGE (
	NO	NUMBER		NOT NULL,
	AMENITY_NO	NUMBER		NOT NULL,
	START_DATE	TIMESTAMP		NULL,
	END_DATE	TIMESTAMP		NULL
);
DROP SEQUENCE SEQ_AMENITY_MANAGE_NO;
CREATE SEQUENCE SEQ_AMENITY_MANAGE_NO NOCACHE NOCYCLE;


ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	NO
);

ALTER TABLE POINT ADD CONSTRAINT PK_POINT PRIMARY KEY (
	NO
);

ALTER TABLE FRIEND ADD CONSTRAINT PK_FRIEND PRIMARY KEY (
	NO
);

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	NO
);

ALTER TABLE NOTICE_IMG ADD CONSTRAINT PK_NOTICE_IMG PRIMARY KEY (
	NO
);

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	NO
);

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	NO
);

ALTER TABLE BOARD_CATEGORY ADD CONSTRAINT PK_BOARD_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE ADMIN ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	NO
);

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	NO
);

ALTER TABLE NOTICE_CATEGORY ADD CONSTRAINT PK_NOTICE_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE FAQ_CATEGORY ADD CONSTRAINT PK_FAQ_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
	NO
);

ALTER TABLE QNA_CATEGORY ADD CONSTRAINT PK_QNA_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE CHATTING_ROOM ADD CONSTRAINT PK_CHATTING_ROOM PRIMARY KEY (
	NO
);

ALTER TABLE CHATTING_MESSAGE ADD CONSTRAINT PK_CHATTING_MESSAGE PRIMARY KEY (
	NO
);

ALTER TABLE DELIVERY ADD CONSTRAINT PK_DELIVERY PRIMARY KEY (
	NO
);

ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	NO
);

ALTER TABLE REPORT_CATEGORY ADD CONSTRAINT PK_REPORT_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE AMENITY_RESERVATION ADD CONSTRAINT PK_AMENITY_RESERVATION PRIMARY KEY (
	NO
);

ALTER TABLE AMENITY ADD CONSTRAINT PK_AMENITY PRIMARY KEY (
	NO
);

ALTER TABLE ACCOUNT ADD CONSTRAINT PK_ACCOUNT PRIMARY KEY (
	NO
);

ALTER TABLE ACCOUNT_CATEGORY ADD CONSTRAINT PK_ACCOUNT_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE BOARD_IMG ADD CONSTRAINT PK_BOARD_IMG PRIMARY KEY (
	NO
);

ALTER TABLE BOARD_STATUS ADD CONSTRAINT PK_BOARD_STATUS PRIMARY KEY (
	NO
);

ALTER TABLE CHATTING_MEMBER_LIST ADD CONSTRAINT PK_CHATTING_MEMBER_LIST PRIMARY KEY (
	CHATTING_ROOM_NO,
	MEMBER_NO
);

ALTER TABLE LOVE ADD CONSTRAINT PK_LOVE PRIMARY KEY (
	MEMBER_NO,
	BOARD_NO
);

ALTER TABLE RESTRICTION ADD CONSTRAINT PK_RESTRICTION PRIMARY KEY (
	NO
);

ALTER TABLE MEMBER_FEE ADD CONSTRAINT PK_MEMBER_FEE PRIMARY KEY (
	NO
);

ALTER TABLE MEMBER_FEE_CATEGORY ADD CONSTRAINT PK_MEMBER_FEE_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE MEMBER_CALENDAR ADD CONSTRAINT PK_MEMBER_CALENDAR PRIMARY KEY (
	NO
);

ALTER TABLE NOTICE_CALENDAR ADD CONSTRAINT PK_NOTICE_CALENDAR PRIMARY KEY (
	NO
);

ALTER TABLE EQUIPMENT ADD CONSTRAINT PK_EQUIPMENT PRIMARY KEY (
	NO
);

ALTER TABLE BREAKFAST ADD CONSTRAINT PK_BREAKFAST PRIMARY KEY (
	NO
);

ALTER TABLE MEAL_RESERVATION ADD CONSTRAINT PK_MEAL_RESERVATION PRIMARY KEY (
	NO
);

ALTER TABLE AROUND_EVALUATION ADD CONSTRAINT PK_AROUND_EVALUATION PRIMARY KEY (
	NO
);

ALTER TABLE VOTE_CANDIDATE ADD CONSTRAINT PK_VOTE_CANDIDATE PRIMARY KEY (
	NO
);

ALTER TABLE VOTE ADD CONSTRAINT PK_VOTE PRIMARY KEY (
	NOTICE_NO
);

ALTER TABLE PERSONAL_VOTE ADD CONSTRAINT PK_PERSONAL_VOTE PRIMARY KEY (
	NO
);

ALTER TABLE CAPTAIN_LOVE ADD CONSTRAINT PK_CAPTAIN_LOVE PRIMARY KEY (
	MEMBER_NO
);

ALTER TABLE ADMIN_FEE_CATEGORY ADD CONSTRAINT PK_ADMIN_FEE_CATEGORY PRIMARY KEY (
	NO
);

ALTER TABLE ADMIN_FEE ADD CONSTRAINT PK_ADMIN_FEE PRIMARY KEY (
	NO
);

ALTER TABLE PARCEL ADD CONSTRAINT PK_PARCEL PRIMARY KEY (
	NO
);

ALTER TABLE DIET ADD CONSTRAINT PK_DIET PRIMARY KEY (
	NO
);

ALTER TABLE AROUND ADD CONSTRAINT PK_AROUND PRIMARY KEY (
	NO
);

ALTER TABLE BICYCLE ADD CONSTRAINT PK_BICYCLE PRIMARY KEY (
	NO
);

ALTER TABLE CAR ADD CONSTRAINT PK_CAR PRIMARY KEY (
	NO
);

ALTER TABLE AMENITY_IMG ADD CONSTRAINT PK_AMENITY_IMG PRIMARY KEY (
	NO
);

ALTER TABLE ADMIN_CALL ADD CONSTRAINT PK_ADMIN_CALL PRIMARY KEY (
	NO
);

ALTER TABLE AMENITY_MANAGE ADD CONSTRAINT PK_AMENITY_MANAGE PRIMARY KEY (
	NO
);

ALTER TABLE CHATTING_MEMBER_LIST ADD CONSTRAINT FK_CHATTING_ROOM_TO_CHATTING_MEMBER_LIST_1 FOREIGN KEY (
	CHATTING_ROOM_NO
)
REFERENCES CHATTING_ROOM (
	NO
);

ALTER TABLE CHATTING_MEMBER_LIST ADD CONSTRAINT FK_MEMBER_TO_CHATTING_MEMBER_LIST_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	NO
);

ALTER TABLE LOVE ADD CONSTRAINT FK_MEMBER_TO_LOVE_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	NO
);

ALTER TABLE LOVE ADD CONSTRAINT FK_BOARD_TO_LOVE_1 FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	NO
);

ALTER TABLE VOTE ADD CONSTRAINT FK_NOTICE_TO_VOTE_1 FOREIGN KEY (
	NOTICE_NO
)
REFERENCES NOTICE (
	NO
);

ALTER TABLE CAPTAIN_LOVE ADD CONSTRAINT FK_MEMBER_TO_CAPTAIN_LOVE_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	NO
);
