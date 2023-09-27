package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;

@Mapper
public interface MovieMapper {

	public int insert(Movie m);

	public Movie select(String movieCd);

	public List<String> selectMovieCode();

	public int updateActors(String movieCd, String actors);
}
