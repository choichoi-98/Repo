package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.BookingInfoDTO;
import com.hta.movieplus.domain.KakaoPayVO;
import com.hta.movieplus.mybatis.mapper.KakaopayMapper;

@Service
public class KakaopayServiceImpl implements KakaopayService {
	
	private KakaopayMapper dao;
	
	@Autowired
	public KakaopayServiceImpl(KakaopayMapper dao) {
		this.dao = dao;
	}

	@Override
	public void payInsert(int sid, int totalAmount, String KPAY_OCCUPIED_SEAT, int seatCnt, String MEMBER_ID) {
		dao.payInsert(sid, totalAmount, KPAY_OCCUPIED_SEAT, seatCnt, MEMBER_ID);
	}

	@Override
	public void insertPgToken(String pg_token) {
		dao.insertPgToken(pg_token);
	}

	@Override
	public List<KakaoPayVO> getAprBooking() {
		return dao.getAprBooking() ;
	}

	@Override
	public List<BookingInfoDTO> getAprBookings() {
		return dao.getAprBookings();
	}

}
