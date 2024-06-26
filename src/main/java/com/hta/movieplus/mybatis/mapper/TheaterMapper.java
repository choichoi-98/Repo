package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.Manager;
import com.hta.movieplus.domain.Theater;

@Mapper
public interface TheaterMapper {
	
	public int addTheater(Theater theater);
	
	public int getCountByTheater();

	public List<Theater> getTheaterList(Map<String, Object> map);

	public int deleteTheaterById(int num);

	public Theater getTheaterById(int num);

	public void changeStatusTheaterById(Map<String, Object> dataMap);

	public void updateTheaterById(Theater theater);

	public int findManagerIdById(String managerId);

	public int addTheaterManager(Manager manager);

	public void resetManagerPasswordById(Map<String, Object> dataMap);

	public void deleteMemberById(String theater_MANAGER_ID);

	public List<Theater> getAllTheaterList();

	public List<FavoriteTheater> getFavoriteTheaterListById(String name);

	public int checkFavoriteTheater(Map<String, Object> dataMap);

	public int deleteFavoriteTheater(Map<String, Object> dataMap);

	public int addFavoriteTheater(Map<String, Object> dataMap);

	public int getCountFavoriteTheater(String name);

	public List<Theater> getTheaterListByLocation(String location);

	public int deleteFavoriteTheaterById(int memberNum);

	public void addFavoriteTheaterWithList(List<FavoriteTheater> favList);

	public int addFavoriteTheaterByVO(FavoriteTheater temp);


	
}
