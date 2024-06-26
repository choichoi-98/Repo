package com.hta.movieplus.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.api.RestApi.MovieDetailApi;
import com.hta.movieplus.api.RestApi.MoviePosterApi;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.service.MoviePostService;
import com.hta.movieplus.service.MovieServiceImpl;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	
	MoviePostService moviePostService;

	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@Autowired
	private MovieDetailApi movieDetailApi;
	
    private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
    @Autowired
    public MovieController(MoviePostService moviePostService) {
		// TODO Auto-generated constructor stub
    	this.moviePostService = moviePostService;
	}
    
    @GetMapping("/movieListPage") //영화 > 전체 영화 list
    public ModelAndView movieList(ModelAndView mv,
    		@AuthenticationPrincipal Member member,
    				@RequestParam(value="search_word", defaultValue="", required=false) String search_word) throws Exception {
    	
    	LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
    	
    	if(member != null) {
    		String memberId =  member.getMEMBER_ID();
    		List<Movie> movieList = movieServiceImpl.getPlayingMovieLogin(memberId,search_word, currentdate);
    		mv.addObject("movieList",movieList);
    		mv.addObject("search_word", search_word);
    		
    	} else {
    		List<Movie> movieList = movieServiceImpl.getPlayingMovie(search_word, currentdate);
    		mv.addObject("movieList",movieList);
    		mv.addObject("search_word", search_word);
    	}
    	
    	mv.setViewName("movie/movie_list");
    	
    	return mv;
    }
    
    
    @GetMapping("/movieAdd")
    public String movieAdd() {
    	return "admin/movie_add";
    }
    
    @ResponseBody
	@GetMapping("/updateActors")
	public void updateActors(HttpServletRequest request, Model model) {
		//MovieServieImpl을 사용해서 DB에 저장된 모든 MOVIE_CODE 값 가져옴
		List<String> allMovieCodes = movieServiceImpl.getAllMovieCodes();
		
		//가져온 모든 MOVIE_CODE에 대해 출연배우 정보를 업데이트
		for(String movieCode : allMovieCodes) {
			movieDetailApi.updateMovieActors(movieCode);
			logger.info("출연배우 정보 업데이트 성공 - Movie Code: {]" + movieCode.toString());
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/movieListAll")
	public List<Movie> getMovieListAll( ){
		 List<Movie> movieList = movieServiceImpl.getMovieListAll();
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("movieList", movieList);
		 logger.info(movieList.size() + "");
		 return movieList;
	}

	@ResponseBody
	@RequestMapping(value="/movieListAllModal")
	public List<Movie> getMovieListAll
						(@RequestParam(name = "page", defaultValue = "1") int page
	                    ) {
	    Map<String, Object> response = new HashMap<>();

	    int limit = 100;
	    
	    // 전체 영화 목록을 가져오는 대신, 해당 페이지의 데이터만 가져오도록 서비스 계층 호출
	    List<Movie> movieList = movieServiceImpl.getMovieListByPage();
	    logger.info("무비리스트모달:"+movieList.size() + "");
	    // 전체 영화 개수
//	    int listcount = movieServiceImpl.getListCount();
//
//	    int maxpage = (listcount + limit - 1) / limit;
//	    int startpage = ((page - 1) / 100) * 100 + 1;
//	    int endpage = startpage + 100 - 1;
//	    if (endpage > maxpage)
//	         endpage = maxpage;
//	    System.out.println("startpage="+startpage);
//	    System.out.println("endpage="+endpage);
//
//	    response.put("movieList", movieList);
//	    response.put("page", page);
//	    response.put("maxpage", maxpage);
//	    response.put("startpage", startpage);
//	    response.put("endpage", endpage);
//	    response.put("listcount", listcount);
//	    response.put("limit", limit);

	    return movieList;
	}

	@ResponseBody
	@RequestMapping(value="/now-playing")
	public List<Movie> getPlayingMovie(
			){
		
			return movieServiceImpl.getPlayingMovieAdmin();
	}

	
	@ResponseBody
	@RequestMapping(value="/ended")
	public List<Movie> getEndedMovie(){
		return movieServiceImpl.getEndedMovie();
	}

	@ResponseBody
	@RequestMapping(value="/moviePlayUpdate")
	public void moviePlayUpdate(@RequestParam("movieCode") String movieCode){
		System.out.println("movieCode: " + movieCode);
		 movieServiceImpl.moviePlayUpdate(movieCode);
	}

	@ResponseBody
	@RequestMapping(value="/movieEndedUpdate")
	public void movieEndedUpdate(@RequestParam("movieCode") String movieCode){
		 movieServiceImpl.movieEndedUpdate(movieCode);
	}
	
    @GetMapping("/movieDetail")
    public ModelAndView movieDetail(ModelAndView mv,
    				@RequestParam(value="movieCode", defaultValue="") String movieCode, 
    				@AuthenticationPrincipal Member member
    		) {
    	
    	LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
    	
    	if(member != null) {
    		String memberId =  member.getMEMBER_ID();
    		List<Movie> movieDetail = movieServiceImpl.getMovieDetailLogin(memberId, movieCode);
    		mv.addObject("movieDetail", movieDetail);
    	} else {
    		List<Movie> movieDetail = movieServiceImpl.getMovieDetail(movieCode);
    		
    		mv.addObject("movieDetail", movieDetail);
    		
    	}
    	
    	double avgScore = movieServiceImpl.getAvgReviewPoint(movieCode);
    	mv.addObject("avgScore", avgScore);
    	
    	List<MoviePostVO> moviePostList = moviePostService.getMoviePostListByMovieCode(movieCode);
    	mv.addObject("moviePostList", moviePostList);
    	
    	List<Movie> totallist = movieServiceImpl.getMovieCodeTotal(currentdate, movieCode);
    	mv.addObject("totallist", totallist);
    	
    	List<Movie> viewerCount = movieServiceImpl.getViewerCount(currentdate, movieCode);
    	mv.addObject("viewerCount", viewerCount);
    	
    	mv.setViewName("movie/movie_detail");
    	return mv;
    }
    
    //전체 영화 갯수
    @ResponseBody
    @RequestMapping(value="/movieAllCount")
    public int movieListCount() {
    	
		return movieServiceImpl.getMovieAllCount();
    	
    }
    
    //상영 중인 영화 갯수
    @ResponseBody
    @RequestMapping(value="/moviePlayingCount")
    public int moviePlayingCount() {
    	
		return movieServiceImpl.moviePlayingCount();
    	
    }
    
    //상영 종료 영화 갯수 
    @ResponseBody
    @RequestMapping(value="/movieEndedCount")
    public int movieEndedCount() {
    	
		return movieServiceImpl.movieEndedCount();
    	
    }
	
	//관람평(댓글) 화면 표시
	@ResponseBody
	@RequestMapping(value="/getMovieReview")
	public List<MovieReviewVO> getMovieReview(
				
				@RequestParam("movieCode") String movieCode
			){
		logger.info("관람평 moviecode:"+ movieCode);
		List<MovieReviewVO> movieReviews = movieServiceImpl.getMovieReview(movieCode);
//		 for (MovieReviewVO review : movieReviews) {
//		        System.out.println("Review ID: " + review.getMember_Id());
//		        System.out.println("Review content: " + review.getMovie_Review_content());
//		    }
//		
		return movieReviews;
		
	}
	
	
	//관람평(댓글) 추가
	@ResponseBody
	@RequestMapping(value="/addMovieReview")
	public int addMovieReview(
			@RequestParam("movieCode") String movieCode,
			@RequestParam("memberId") String memberId,
			@RequestParam("reviewText") String reviewText,
			@RequestParam("movieStar")  String movieStar
			){
		
	        int star = Integer.parseInt(movieStar);
		
		return movieServiceImpl.addMovieReview(memberId, movieCode,reviewText,star);
		
	}
	
	//관람평(댓글) 수정
	@ResponseBody
	@RequestMapping(value="modifyReview")
	public int modifyReview(
			@RequestParam("review_num") String review_num,
			@RequestParam("reviewText") String reviewText,
			@RequestParam("movieStar") String movieStar
			) {
		
		int star = Integer.parseInt(movieStar);
		
		return movieServiceImpl.updateMovieReview(review_num,reviewText,star);
	}

	//관람평(댓글) 삭제
	@ResponseBody
	@RequestMapping(value="deleteReview")
	public int deleteReview(
			@RequestParam("review_num") String review_num
			) {
		
		return movieServiceImpl.deleteMovieReview(review_num);
	}
	
	//관람평(댓글) 좋아요 추가
	@ResponseBody
	@RequestMapping(value="/addMovieReviewLike")
	public int addMovieReviewLike(
				@RequestParam("review_num") int review_num,
				@RequestParam("loginId") String memberId 
			) {
		
		
		return movieServiceImpl.addMovieReviewLike(memberId, review_num);
	}
	

	
	//보고싶어요 추가
	@ResponseBody
	@RequestMapping(value="/addMovieDibs")
	public Map<String, Object> addMovieDibs(
			@RequestParam("movieCode") String movieCode,
			@AuthenticationPrincipal Member member
			) {
		Map<String,Object> map = new HashMap<String,Object>();
	    
	    if (member != null) {
	    	String memberId =  member.getMEMBER_ID();
	        movieServiceImpl.addMovieDibs(memberId, movieCode);
	        map.put("alert", false);
	        boolean alertValue = (boolean) map.get("alert");
	        logger.info("alert 값=" + alertValue);
	        
	    } else {
	        // alert 표시 
	        map.put("alert", true);
	    }
	    
	    return map;
	}
	
	//보고싶어요 삭제
	@ResponseBody
	@RequestMapping(value="/deleteMovieDibs")
	public Map<String, Object> deleteMovieDibs(
			@RequestParam("movieCode") String movieCode,
			@AuthenticationPrincipal Member member
			) {
		Map<String,Object> map = new HashMap<String,Object>();
		
	    
	    if (member != null) {
	    	String memberId =  member.getMEMBER_ID();
	        movieServiceImpl.deleteMovieDibs(memberId, movieCode);
	        map.put("alert", false);
	    } else {
	        // alert 표시 
	        map.put("alert", true);
	    }
	    return map;
	}
	
	//관리자 - 감상평(댓글) 관리
	@RequestMapping(value="/manageMovieReview")
	public ModelAndView adminMovieReview(ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word) {
			
			int limit = 10;
			
			int reviewCnt = movieServiceImpl.getAdminMovieReviewCnt();
			
			int maxpage = (reviewCnt + limit -1) / limit;
			
			int startpage = ((page -1)/10) * 10 + 1;
			
			int endpage = startpage + 10 - 1;
			
			if(endpage > maxpage)
				endpage = maxpage;
			
    		List<MovieReviewVO> reviewList = movieServiceImpl.getAdminMovieReviewList(page,limit);
    		mv.addObject("search_word", search_word);
    	
    	 mv.setViewName("admin/manageMovieReview");
    	
    	 mv.addObject("page", page);
         mv.addObject("maxpage", maxpage);
         mv.addObject("startpage", startpage);
         mv.addObject("endpage", endpage);
     	 mv.addObject("reviewCnt", reviewCnt);
     	 mv.addObject("reviewList",reviewList);
         mv.addObject("limit", limit);
    	
    	return mv;
	}
	
	//관리자 - 관람평 삭제
	@ResponseBody
	@RequestMapping(value="/adminDeleteMovieReview")
	public int adminDeleteMovieReview(
			@RequestParam("review_num") int review_num
			) {
		
		logger.info("삭제할 댓글 번호:" + review_num);
		return movieServiceImpl.adminDeleteMovieReview(review_num);
	}
	
}

