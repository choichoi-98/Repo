CREATE SEQUENCE THEATER_ROOM_SEQ;

CREATE TABLE THEATER_ROOM(
 	THEATER_ROOM_ID NUMBER PRIMARY KEY,
	THEATER_ROOM_NAME VARCHAR2(100) NOT NULL,
 	THEATER_ROOM_SEAT VARCHAR2(4000) NOT NULL,
	THEATER_ROOM_SEAT_CNT NUMBER(10) NOT NULL,
	THEATER_ROOM_STATUS VARCHAR2(50) NOT NULL,
	THEATER_ROOM_CREATED_DATE VARCHAR2(200) NOT NULL,
	THEATER_ID NUMBER NOT NULL,
 	FOREIGN KEY (THEATER_ID) REFERENCES THEATER(THEATER_ID) ON DELETE CASCADE
	);