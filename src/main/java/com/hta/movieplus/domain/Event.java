package com.hta.movieplus.domain;

import org.springframework.web.multipart.MultipartFile;

import oracle.sql.DATE;

public class Event {
	private int EVENT_NUM;				//이벤트 번호
	private String EVENT_TYPE;			//이벤트 종류	(영화 | 극장 | 제휴/할인 | 시사회/무대인사)
	private String EVENT_SUBJECT;		//이벤트 제목	 
	private String EVENT_CONTENT;		//이벤트 내용 사진
	private DATE   EVENT_DATE;			//작성일자
	private String EVENT_FILE;			//이벤트 썸네일 사진
	private String EVENT_STARTDATE;		//이벤트 시작일
	private String EVENT_ENDDATE;		//이벤트 종료일
	private String EVENT_STATUS="PROGRESS"; //이벤트 상태(진행중(PROGRESS) | 종료(END))
	private String EVENT_RESULTDATE;	//이벤트 발표일
	private String EVENT_RESULT;		//이벤트 당첨내용
	private int RNUM;
	
	private MultipartFile uploadevent;		//이벤트 내용 사진 업로드시 사용(EVENT_CONTENT)
	private String EVENTCONTENT_ORIGINAL;
	
	private MultipartFile uploadthumb;	//이벤트 썸네일 사진 업로드시 사용(EVENT_FILE)
	private String EVENTFILE_ORIGINAL;
	
	
	@Override
	public String toString() {
		return "Event [EVENT_NUM=" + EVENT_NUM + ", EVENT_TYPE=" + EVENT_TYPE + ", EVENT_SUBJECT=" + EVENT_SUBJECT
				+ ", EVENT_CONTENT=" + EVENT_CONTENT + ", EVENT_DATE=" + EVENT_DATE + ", EVENT_FILE=" + EVENT_FILE
				+ ", EVENT_STARTDATE=" + EVENT_STARTDATE + ", EVENT_ENDDATE=" + EVENT_ENDDATE + ", EVENT_STATUS="
				+ EVENT_STATUS + ", RNUM=" + RNUM + ", uploadevent=" + uploadevent + ", EVENTCONTENT_ORIGINAL="
				+ EVENTCONTENT_ORIGINAL + ", uploadthumb=" + uploadthumb + ", EVENTFILE_ORIGINAL=" + EVENTFILE_ORIGINAL
				+ "]";
	}


	public int getRNUM() {
		return RNUM;
	}


	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}


	public int getEVENT_NUM() {
		return EVENT_NUM;
	}


	public void setEVENT_NUM(int eVENT_NUM) {
		EVENT_NUM = eVENT_NUM;
	}


	public String getEVENT_TYPE() {
		return EVENT_TYPE;
	}


	public void setEVENT_TYPE(String eVENT_TYPE) {
		EVENT_TYPE = eVENT_TYPE;
	}


	public String getEVENT_SUBJECT() {
		return EVENT_SUBJECT;
	}


	public void setEVENT_SUBJECT(String eVENT_SUBJECT) {
		EVENT_SUBJECT = eVENT_SUBJECT;
	}


	public String getEVENT_CONTENT() {
		return EVENT_CONTENT;
	}


	public void setEVENT_CONTENT(String eVENT_CONTENT) {
		EVENT_CONTENT = eVENT_CONTENT;
	}


	public DATE getEVENT_DATE() {
		return EVENT_DATE;
	}


	public void setEVENT_DATE(DATE eVENT_DATE) {
		EVENT_DATE = eVENT_DATE;
	}


	public String getEVENT_FILE() {
		return EVENT_FILE;
	}


	public void setEVENT_FILE(String eVENT_FILE) {
		EVENT_FILE = eVENT_FILE;
	}


	public String getEVENT_STARTDATE() {
		return EVENT_STARTDATE;
	}


	public void setEVENT_STARTDATE(String eVENT_STARTDATE) {
		EVENT_STARTDATE = eVENT_STARTDATE;
	}


	public String getEVENT_ENDDATE() {
		return EVENT_ENDDATE;
	}


	public void setEVENT_ENDDATE(String eVENT_ENDDATE) {
		EVENT_ENDDATE = eVENT_ENDDATE;
	}


	public MultipartFile getUploadevent() {
		return uploadevent;
	}


	public void setUploadevent(MultipartFile uploadevent) {
		this.uploadevent = uploadevent;
	}


	public String getEVENTFILE_ORIGINAL() {
		return EVENTFILE_ORIGINAL;
	}


	public void setEVENTFILE_ORIGINAL(String eVENTFILE_ORIGINAL) {
		EVENTFILE_ORIGINAL = eVENTFILE_ORIGINAL;
	}


	public String getEVENT_STATUS() {
		return EVENT_STATUS;
	}


	public void setEVENT_STATUS(String eVENT_STATUS) {
		EVENT_STATUS = eVENT_STATUS;
	}


	public String getEVENTCONTENT_ORIGINAL() {
		return EVENTCONTENT_ORIGINAL;
	}


	public void setEVENTCONTENT_ORIGINAL(String eVENTCONTENT_ORIGINAL) {
		EVENTCONTENT_ORIGINAL = eVENTCONTENT_ORIGINAL;
	}


	public MultipartFile getUploadthumb() {
		return uploadthumb;
	}


	public void setUploadthumb(MultipartFile uploadthumb) {
		this.uploadthumb = uploadthumb;
	}


	public String getEVENT_RESULT() {
		return EVENT_RESULT;
	}


	public void setEVENT_RESULT(String eVENT_RESULT) {
		EVENT_RESULT = eVENT_RESULT;
	}


	public String getEVENT_RESULTDATE() {
		return EVENT_RESULTDATE;
	}


	public void setEVENT_RESULTDATE(String eVENT_RESULTDATE) {
		EVENT_RESULTDATE = eVENT_RESULTDATE;
	}
	
	
	
}
