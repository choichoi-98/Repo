package com.hta.movieplus.domain;

public class Movie {
	private String movie_Code;		//영화번호
    private String movie_Title;		//영화제목
    private String movie_Director;	//영화감독
    private String movie_Poster = "";		//영화 포스터
    private String movie_Actors;		//출연배우
    private String movie_Genre;		//대표장르
    private String movie_Runtime = "120";	//상영시간
    private String movie_OpenDate;	//개봉일
    private String movie_Grade;		//상영등급
    private String movie_Plot;		//줄거리
    private int movie_Star;			//평점
    private String movie_Release;	//개봉상태(개봉, 개봉예정)
    private String movie_Screen; //상영상태(상영가능,상영예정,상영종로,상영중)
	private String MOVIE_DIBS_OBJECT; //보고싶어요 한 영화
	private int review_Count;	//댓글 수
	private String movie_Still = "";
	private String interest_Status;//보고싶어요
	private int post_Count;		//무비 포스트 수
	private String THEATER_SCHEDULE_DATE;
	private int ratio;
	private int rate;
	private int RNUM;
	
	//--
	private int REOPEN_COUNT;
	private String REOPENING_STARTDATE;
	private String REOPENING_ENDDATE;
	
	
	public int getPost_Count() {
		return post_Count;
	}
	public void setPost_Count(int post_Count) {
		this.post_Count = post_Count;
	}
	
	public String getInterest_Status() {
		return interest_Status;
	}
	public void setInterest_Status(String interest_Status) {
		this.interest_Status = interest_Status;
	}
	public int getReview_Count() {
		return review_Count;
	}
	public void setReview_Count(int review_Count) {
		this.review_Count = review_Count;
	}
	//--
	private int MOVIE_SCHEDULE_CNT;
	private String grade_data;
	

	public String getMOVIE_DIBS_OBJECT() {
		return MOVIE_DIBS_OBJECT;
	}
	public void setMOVIE_DIBS_OBJECT(String mOVIE_DIBS_OBJECT) {
		MOVIE_DIBS_OBJECT = mOVIE_DIBS_OBJECT;
	}
	public String getMovie_Screen() {
		return movie_Screen;
	}
	public void setMovie_Screen(String movie_Screen) {
		this.movie_Screen = movie_Screen;
	}
	public String getMovie_Code() {
		return movie_Code;
	}
	public void setMovie_Code(String movie_Code) {
		this.movie_Code = movie_Code;
	}
	public String getMovie_Title() {
		return movie_Title;
	}
	public void setMovie_Title(String movie_Title) {
		this.movie_Title = movie_Title;
	}
	public String getMovie_Director() {
		return movie_Director;
	}
	public void setMovie_Director(String movie_Director) {
		this.movie_Director = movie_Director;
	}
	public String getMovie_Poster() {
		return movie_Poster;
	}
	public void setMovie_Poster(String movie_Poster) {
		this.movie_Poster = movie_Poster;
	}
	public String getMovie_Actors() {
		return movie_Actors;
	}
	public void setMovie_Actors(String movie_Actors) {
		this.movie_Actors = movie_Actors;
	}
	public String getMovie_Genre() {
		return movie_Genre;
	}
	public void setMovie_Genre(String movie_Genre) {
		this.movie_Genre = movie_Genre;
	}
	public String getMovie_Runtime() {
		return movie_Runtime;
	}
	public void setMovie_Runtime(String movie_Runtime) {
		this.movie_Runtime = movie_Runtime;
	}
	public String getMovie_OpenDate() {
		return movie_OpenDate;
	}
	public void setMovie_OpenDate(String movie_OpenDate) {
		this.movie_OpenDate = movie_OpenDate;
	}
	public String getMovie_Grade() {
		return movie_Grade;
	}
	public void setMovie_Grade(String movie_Grade) {
		this.movie_Grade = movie_Grade;
	}
	public String getMovie_Plot() {
		return movie_Plot;
	}
	public void setMovie_Plot(String movie_Plot) {
		this.movie_Plot = movie_Plot;
	}
	public int getMovie_Star() {
		return movie_Star;
	}
	public void setMovie_Star(int movie_Star) {
		this.movie_Star = movie_Star;
	}
	
	public String getMovie_Release() {
		return movie_Release;
	}
	public void setMovie_Release(String movie_Release) {
		this.movie_Release = movie_Release;
	}
	public int getMOVIE_SCHEDULE_CNT() {
		return MOVIE_SCHEDULE_CNT;
	}
	public void setMOVIE_SCHEDULE_CNT(int mOVIE_SCHEDULE_CNT) {
		MOVIE_SCHEDULE_CNT = mOVIE_SCHEDULE_CNT;
	}
	public String getGrade_data() {
		return grade_data;
	}
	public void setGrade_data(String grade_data) {
		this.grade_data = grade_data;
	}
	public String getMovie_Still() {
		return movie_Still;
	}
	public void setMovie_Still(String movie_Still) {
		this.movie_Still = movie_Still;
	}
	public int getREOPEN_COUNT() {
		return REOPEN_COUNT;
	}
	public void setREOPEN_COUNT(int rEOPEN_COUNT) {
		REOPEN_COUNT = rEOPEN_COUNT;
	}
	public String getREOPENING_ENDDATE() {
		return REOPENING_ENDDATE;
	}
	public void setREOPENING_ENDDATE(String rEOPENING_ENDDATE) {
		REOPENING_ENDDATE = rEOPENING_ENDDATE;
	}
	public String getREOPENING_STARTDATE() {
		return REOPENING_STARTDATE;
	}
	public void setREOPENING_STARTDATE(String rEOPENING_STARTDATE) {
		REOPENING_STARTDATE = rEOPENING_STARTDATE;
	}
	public String getTHEATER_SCHEDULE_DATE() {
		return THEATER_SCHEDULE_DATE;
	}
	public void setTHEATER_SCHEDULE_DATE(String tHEATER_SCHEDULE_DATE) {
		THEATER_SCHEDULE_DATE = tHEATER_SCHEDULE_DATE;
	}
	public int getRatio() {
		return ratio;
	}
	public void setRatio(int ratio) {
		this.ratio = ratio;
	}
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	
   
	
}
