package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int result = dao.insertItem(StoreVO);
		return (result > 0) ? 1 : -1;
	}
	
	@Override
	public StoreVO seleteitem(int itemCode) {
		return null;
	}

	@Override
	public int updateItem(StoreVO modifyitem) {
		return dao.updateItem(modifyitem);
	}

	@Override
	public void deleteItem(int itemCode) {
		dao.deleteItem(itemCode);
	}



//	@Override
//	public List<StoreVO> getItemList(int page, int limit) {
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		int startrow = (page-1) * limit + 1;
//		int endrow = startrow + limit - 1;
//		map.put("start", startrow);
//		map.put("end", endrow);
//		return dao.getItemList(map);
//	}


//	@Override
//	public boolean isAdmin(int num, String pass) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("num", num);
//		map.put("pass", pass);
//		StoreVO store = dao.isAdmin(map);
//		
//		if(store == null) {
//			return false;
//		} else {
//			return true;
//		}
//	}
//
//	@Override
//	public List<String> DeleteItemFileList() {
//		return dao.getDeleteItemFileList();
//	}
//
//	@Override
//	public void deleteItemFileList(String filename) {
//		dao.deleteItemFileList(filename);
//	}
}
