package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieReviewVO;

@Mapper
public interface MovieMapper {

	public int insert(Movie m);

	public Movie select(String movieCd);

	public List<String> selectMovieCode();

	public int updateActors(String movieCd, String actors, String watchGradeNm, String showTm);

	public List<Movie> selectMovieTitle();

	public int updatePoster(String codeNo, String posterUrl, String stillUrl, String plotText);

	public List<Movie> getMovieListAll();

	//일반
	public List<Movie> getPlayingMovieList(String search_word);
	//일반
	public List<Movie> getPlayingMovieLogin(String memberId, String search_word);

	//관리자
	public List<Movie> getPlayingMovieListAdmin();

	public List<Movie> getUpcomingMovieList();

	public List<Movie> getEndedMovieList();

	public int getListcount();

	public List<Movie> getMovieList(HashMap<String, Integer> map);

	public int moviePlayUpdate(String movieCode);

	public int movieEndedUpdate(String movieCode);

	public int addMovieDibs(String memberId, String movieCode);

	public int deleteMovieDibs(String memberId, String movieCode);

	public List<Movie> getPlayingMovieMain();

	public List<Movie> getPlayingMovieLoginMain(String memberId);
	
	//로그인 o 영화 상세
	public List<Movie> getMovieDetailLogin(String memberId, String movieCode);

	//로그인 x 영화 상세
	public List<Movie> getMovieDetail(String movieCode);
	

	//관람평(댓글) 가져오기
	public List<MovieReviewVO> getMovieReview(String movieCode);
	
	//관람평(댓글) 등록
	public int addMovieReview(String memberId, String movieCode, String reviewText, int star);

	//관람평(댓글) 수정
	public int updateMovieReview(String review_num, String reviewText, int star);

	//관람평(댓글) 삭제
	public int deleteMovieReview(String review_num);

	//관람평(댓글) 좋아요 등록
	public int addMoviewReviewLike(String memberId, int review_num);

	//관람평(댓글) 좋아요 삭제
	public int deleteMovieReviewLike(String memberId, String review_num);


}

