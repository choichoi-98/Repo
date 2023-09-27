package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;

public interface MovieService {

	public int insert(Movie m);
	
	public Movie select(String movieCd);
	
	public List<String> getAllMovieCodes();
	
	public int updateMovieActors(String movieCd, String actors);
}