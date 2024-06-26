--이벤트 테이블
create table EVENT(
	EVENT_NUM			NUMBER		  PRIMARY KEY,	--이벤트 글 번호
	EVENT_TYPE			VARCHAR2(20)  NOT NULL,		--이벤트 종류
	EVENT_SUBJECT		VARCHAR2(200) NOT NULL,		--이벤트 제목
	EVENT_CONTENT		VARCHAR2(4000),				--이벤트 내용
	EVENT_DATE			DATE 		  NOT NULL,		--작성일자
	EVENT_FILE			VARCHAR2(300),				--이벤트 업로드 파일
	EVENT_STARTDATE		VARCHAR2(20) NOT NULL,		-- 이벤트 시작일
	EVENT_ENDDATE		VARCHAR2(20) NOT NULL,		-- 이벤트 종료일
	EVENT_STATUS		VARCHAR2(20)				-- 이벤트 상태(대기/진행중/종료)
);


--이벤트 댓글/응모내역
create table EVENT_COMMENT(
	EVENT_COMMENT_NUM			NUMBER			--댓글 번호
	MEMBER_ID					VARCHAR2(20)	--회원 아이디
	EVENT_COMMENT_CONTENT		VARCHAR2(500)	--댓글 내용
	EVENT_COMMENT_DATE			DATE			--댓글 작성일자
	EVENT_NUM					NUMBER			--게시글 번호
	EVENT_COMMENT_RE_SEQ		NUMBER			--댓글 시퀀스
	EVENTCOMMENT_RE_REF			NUMBER			--댓글 레퍼런스
);