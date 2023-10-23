CREATE SEQUENCE THEATER_SCHEDULE_SEQ;

CREATE TABLE THEATER_SCHEDULE(
 	THEATER_SCHEDULE_ID NUMBER PRIMARY KEY,
	THEATER_ID NUMBER NOT NULL,
	THEATER_ROOM_ID NUMBER NOT NULL,
 	THEATER_SCHEDULE_START VARCHAR2(200) NOT NULL,
	THEATER_SCHEDULE_END VARCHAR2(200) NOT NULL,
	THEATER_SCHEDULE_DATE VARCHAR2(200) NOT NULL,
	MOVIE_CODE VARCHAR2(100) NOT NULL,
	THEATER_SCHEDULE_TYPE VARCHAR2(100),
	THEATER_SCHEDULE_STATUS VARCHAR2(100),
 	FOREIGN KEY (THEATER_ROOM_ID) REFERENCES THEATER_ROOM(THEATER_ROOM_ID) ON DELETE CASCADE,
	FOREIGN KEY (THEATER_ID) REFERENCES THEATER(THEATER_ID) ON DELETE CASCADE
	);

