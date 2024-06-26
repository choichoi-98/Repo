package com.hta.movieplus.domain;

public class KakaoPayVO {

	private int KPAY_NUM; // 카트 번호(PK)
	private int THEATER_SCHEDULE_ID; 
	private int KPAY_AMOUNT; // 총 금액
	private int KPAY_SEAT_CNT; // 선택한 자리 갯수
	private String KPAY_OCCUPIED_SEAT;
	private String MEMBER_ID;
	private String pg_token;
	private String KPAY_DATE;
	
	public int getKPAY_NUM() {
		return KPAY_NUM;
	}
	public void setKPAY_NUM(int kPAY_NUM) {
		KPAY_NUM = kPAY_NUM;
	}
	public int getTHEATER_SCHEDULE_ID() {
		return THEATER_SCHEDULE_ID;
	}
	public void setTHEATER_SCHEDULE_ID(int tHEATER_SCHEDULE_ID) {
		THEATER_SCHEDULE_ID = tHEATER_SCHEDULE_ID;
	}
	public int getKPAY_AMOUNT() {
		return KPAY_AMOUNT;
	}
	public void setKPAY_AMOUNT(int kPAY_AMOUNT) {
		KPAY_AMOUNT = kPAY_AMOUNT;
	}
	public int getKPAY_SEAT_CNT() {
		return KPAY_SEAT_CNT;
	}
	public void setKPAY_SEAT_CNT(int kPAY_SEAT_CNT) {
		KPAY_SEAT_CNT = kPAY_SEAT_CNT;
	}
	public String getKPAY_OCCUPIED_SEAT() {
		return KPAY_OCCUPIED_SEAT;
	}
	public void setKPAY_OCCUPIED_SEAT(String kPAY_OCCUPIED_SEAT) {
		KPAY_OCCUPIED_SEAT = kPAY_OCCUPIED_SEAT;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getKPAY_DATE() {
		return KPAY_DATE;
	}
	public void setKPAY_DATE(String kPAY_DATE) {
		KPAY_DATE = kPAY_DATE;
	}
	
}