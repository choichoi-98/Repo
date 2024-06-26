package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.CouponVO;
import com.hta.movieplus.domain.PayCouponDTO;
import com.hta.movieplus.domain.StoreCartDTO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.mybatis.mapper.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {
	
	private StoreMapper dao;
	
	@Autowired
	public StoreServiceImpl(StoreMapper dao) {
		this.dao = dao;
	}

	@Override
	public int insertItem(StoreVO StoreVO) {
		return dao.insertItem(StoreVO);
	}
	
	@Override
	public StoreVO seleteItem(int ITEM_CODE) {
		return null;
	}

	@Override
	public int updateItem(StoreVO modifyitem) {
		return dao.updateItem(modifyitem);
	}

	@Override
	public void deleteItem(int ITEM_CODE) {
		dao.deleteItem(ITEM_CODE);
	}

	@Override
	public int getItemListCount() {
		return dao.getItemListCount();
	}
	
	@Override
	public StoreVO get1item(int ITEM_CODE) {
		return dao.get1item(ITEM_CODE);
	}

	@Override
	public List<StoreVO> getItemList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getItemList(map);
	}
	
	@Override
	public List<StoreVO> getCartList() {
		return dao.getCartList();
	}

	@Override
	public List<StoreVO> getItemListByKind(String ITEM_MENU) {
	    return dao.getItemListByKind(ITEM_MENU);
	}

	@Override
	public List<StoreVO> getItemListByCodes(List<Integer> codelist) {
		return dao.getItemListByCodes(codelist);
	}

	@Override
	public CartVO cartInsert(CartVO CartVO) {
		dao.cartInsert(CartVO);
		return CartVO;
	}

	@Override
	public void payInsert(String itemDisplay, int totalPrice, String MEMBER_ID, String cartItemMenus) {
		dao.payInsert(itemDisplay, totalPrice, MEMBER_ID, cartItemMenus);
	}

	@Override
	public List<StorePayVO> getPayList() {
		return dao.getPayList();
	}

	@Override
	public void insertPgToken(String pg_token, String today) {
		dao.insertPgToken(pg_token, today);
	}

	@Override
	public List<StorePayVO> selectApproved() {
		return dao.selectApproved();
	}

	@Override
	public void clearCart() {
		dao.clearCart();
	}

	@Override
	public List<CartVO> getCartList2() {
		return dao.getCartList2();
	}

	@Override
	public List<StoreCartDTO> getCartLists() {
		return dao.getCartLists();
	}

	@Override
	public void delCartItem(CartVO cartVO) {
		dao.delCartItem(cartVO);
	}

	@Override
	public void deletePaidItem(int PAY_NUM) {
		dao.deletePaidItem(PAY_NUM);
	}

	@Override
	public String getStoreCoupon() {
		return dao.getStoreCoupon();
	}

	@Override
	public void createCoupon(int PAY_NUM, String Code, String COUPON_TYPE, int COUPON_VALUE) {
		dao.createCoupon(PAY_NUM, Code, COUPON_TYPE, COUPON_VALUE);
	}

	@Override
	public String getPayMenuByNum(int PAY_NUM) {
		return dao.getPayMenuByNum(PAY_NUM);
	}

	@Override
	public List<PayCouponDTO> getStoreCouponList() {
		return dao.getStoreCouponList();
	}

}
