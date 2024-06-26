package com.hta.movieplus.controller;

import java.io.File;
import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.MailVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.service.MemberService;
import com.hta.movieplus.service.MovieStoryService;
import com.hta.movieplus.service.StoreService;
import com.hta.movieplus.service.TheaterService;
import com.hta.movieplus.task.SendMail;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	MovieStoryService movieStoryService;
	TheaterService theaterService;
	StoreService storeService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	private SendMail sendMail;
	private MailVO mailVO;
	
	@Autowired
	public MemberController(MemberService memberservice ,TheaterService theaterService, MovieStoryService movieStoryService, PasswordEncoder passwordEncoder, SendMail sendMail, MailVO mailVO, StoreService storeService) {
		this.memberservice = memberservice;
		this.theaterService = theaterService;
		this.movieStoryService = movieStoryService;
		this.passwordEncoder = passwordEncoder;
		this.sendMail = sendMail;
		this.mailVO = mailVO;
		this.storeService = storeService;
	}
	
	//test 폼 이동
	//@GetMapping("/test")
	public String test() {
		return "member/mypage_event";
	}
	
	//회원가입 폼 이동
	@GetMapping("/join")
	public String memberjoin() {
		return "member/member_join_step1";
	}
	
	//회원가입 step1 인증메일 보내기
	@GetMapping("/sendEmail")
	public void sendEmail(@RequestParam("email") String email, HttpServletResponse resp,   //@REQUESTPARAM 은 NAME값을 가져옴 JSP email 에 값을 넣음
						  ModelAndView mv, HttpSession session) throws Exception {
		
		session.setAttribute("MEMBER_EMAIL", email);
		
		mailVO.setTo(email);
		int verifycode = mailVO.getVerifycode();
		sendMail.SendMail(mailVO);
		resp.getWriter().write(Integer.toString(verifycode));
		
		logger.info("email 값 : " + email);
	}

	//회원가입 step2
	@PostMapping("/join2")
	public String memberjoin2() {
		return "member/member_join_step2";
	}
	
	//회원가입 step3
	@PostMapping("/join3")
	public String memberjoin3(Model model, HttpSession session) {
		String email = (String) session.getAttribute("MEMBER_EMAIL");
		model.addAttribute("MEMBER_EMAIL", email); 
		logger.info("[join3] email 값 : " + email);
		return "member/member_join_step3";
	}
	
	//회원가입 step4
	@PostMapping("/join4")
	public String memberjoin4() {
		return "member/member_join_step4";
	}
	
	//회원가입폼에서 아이디 검사
	@ResponseBody
	@GetMapping("/idcheck")
	public int idcheck(@RequestParam("id") String MEMBER_ID) {
		return memberservice.isId(MEMBER_ID);
	}
	
	//회원가입 처리
	@PostMapping("/joinProcess")
	public String joinProcess(Member member, 
								  RedirectAttributes rattr,
								  Model model,
								  HttpServletRequest request) {
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getMEMBER_PASS());
		logger.info(encPassword);
		member.setMEMBER_PASS(encPassword);
			
		int result = memberservice.insert(member);
			
		if(result == 1) { 	//삽입이 된 경우
			model.addAttribute("member", member);
			return "/member/member_join_step4";  //step4 화면으로 이동
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "회원 가입 실패");
			return "redirect:/main";  //에러페이지
		}
	}
	
	
	//아이디 찾기 이동
	@GetMapping("/findid")
	public String findid() {
		return "member/member_findid";
	}
	
	//아이디 찾기 처리
	@ResponseBody
	@PostMapping("/findidProcess")
	public Member findidProcess(@RequestParam("name") String MEMBER_NAME,
	                            @RequestParam("birth") String MEMBER_BIRTH,
	                            @RequestParam("phoneNo") String MEMBER_PHONENO
	                            ) {
	    
	    Member member = memberservice.findId(MEMBER_NAME, MEMBER_BIRTH, MEMBER_PHONENO);
	    return member;
	}
	
	
	//비밀번호 찾기 이동
	@GetMapping("/findpass")
	public String findpass() {
		return "member/member_findpass";
	}
	

	//비밀번호 찾기 인증메일 보내기
	@GetMapping("/findpassEmail")
	public void findpassEmail(@RequestParam("email") String email, HttpServletResponse resp, 
			ModelAndView mv, HttpSession session) throws Exception {
		
		session.setAttribute("MEMBER_EMAIL", email);
		
		mailVO.setTo(email);
		int verifycode = mailVO.getVerifycode();
		sendMail.FindpassMail(mailVO);
		resp.getWriter().write(Integer.toString(verifycode));
		
		logger.info("email 값 : " + email);
	}
	
	
	//비밀번호 찾기 프로세스 - 아이디 정보 확인
	@ResponseBody
	@PostMapping("/findpassProcess")
	public ModelAndView findpassProcess(@RequestParam("MEMBER_ID") String MEMBER_ID, 
								  @RequestParam("MEMBER_NAME") String MEMBER_NAME, 
								  @RequestParam("MEMBER_EMAIL") String MEMBER_EMAIL,
								  ModelAndView mv
								  )throws Exception {
		
		Member member = memberservice.findPass(MEMBER_ID, MEMBER_NAME, MEMBER_EMAIL);
		
		if(member != null) { 	//아이디가 있는 경우
			logger.info(member.toString());
			mv.addObject("memberInfo", member);
			mv.setViewName("member/member_findpassreset");   //비밀번호 재설정 화면으로 이동
		} else {
			mv.addObject("message", "해당하는 정보가 없습니다.");
			mv.setViewName("/main");  //에러페이지
		}
		return mv;
	}
	
	
	//마이페이지 이동
	@GetMapping("/mypage")
	public String mypage(Model model, @AuthenticationPrincipal Member member) {
		String memberId = member.getMEMBER_ID();
		List<FavoriteTheater> favTheaterList = theaterService.getFavoriteTheaterListById(memberId);
		
		//무비스토리
		List<MoviePostVO> postList = movieStoryService.getMoviePostList(memberId);
		List<TheaterSchedule> scheduleList = movieStoryService.getScheduleList(memberId);
		List<Movie> movieList = movieStoryService.getMovieDibsList(memberId);
		List<MovieReviewVO> reviewList = movieStoryService.getMovieReviewList(memberId);
		model.addAttribute("ms_postCnt", postList.size());
		model.addAttribute("ms_scheduleCnt", scheduleList.size());
		model.addAttribute("ms_movieCnt", movieList.size());
		model.addAttribute("ms_reviewCnt", reviewList.size());
		//
		
		//예매,결재내역
		List<TheaterSchedule> bookedList = movieStoryService.getBookedList(memberId);
		List<StorePayVO> storeList = movieStoryService.getStoreList(memberId);
		model.addAttribute("bookedMovieList", bookedList);
		model.addAttribute("boughtList", storeList);
		
		model.addAttribute("bookedMovieCnt", bookedList.size());
		model.addAttribute("boughtListCnt", storeList.size());
		//
		
		model.addAttribute("favTheaterList", favTheaterList);
		
		return "member/mypage_main";
	}

	//마이페이지 - 개인정보수정 클릭시 비밀번호 확인페이지로 이동
	@GetMapping("/modifyinfo")
	public String modify() {
		return "member/mypage_premodify";
	}
	
	//마이페이지 - 비밀번호 확인페이지에서 비밀번호 확인 후 수정페이지로 이동
	@GetMapping("/modifyform")
	public String modifyform() {
		
		return "member/mypage_modify";
	}

	//마이페이지 - 비밀번호 체크
	@PostMapping("/logincheck")
	public ModelAndView loginProcess(@AuthenticationPrincipal Member member, 
									 @RequestParam("MEMBER_PASS") String MEMBER_PASS, 
									 ModelAndView mv)throws Exception {
		
		String MEMBER_ID = member.getMEMBER_ID();
		
		int result = memberservice.isId(MEMBER_ID, MEMBER_PASS);
		
		if(result == 1) {	//아이디와 비밀번호가 일치하는 경우
			mv.setViewName("member/mypage_modify");
		} else {	//확인하기
			mv.addObject("result", "passFail");
			mv.setViewName("member/mypage_premodify");
		}
		return mv;
	}
	
	//마이페이지 이메일 변경 인증메일 보내기
	@GetMapping("/mypageChgEmail")
	public void mypageChgEmail(@RequestParam("email") String email, HttpServletResponse resp, 
				ModelAndView mv) throws Exception {
			
		mailVO.setTo(email);
		int verifycode = mailVO.getVerifycode();
		sendMail.MypagechgMail(mailVO);
		resp.getWriter().write(Integer.toString(verifycode));
			
		logger.info("email 값 : " + email);
	}
		
	
	//마이페이지 - 개인정보 수정처리(프로필 사진, 이메일, 핸드폰번호)
	@PostMapping("/modifyProcess")
	public String modifyProcess(Member member, Model model, Principal principal,
			@AuthenticationPrincipal Member principalmember,
								String check,
								HttpServletRequest request, 
								RedirectAttributes rattr)throws Exception{
		
		MultipartFile uploadfile = member.getUploadfile();
		
		if(check != null && check.equals("")) {		//기존파일 그대로 사용하는 경우
			logger.info("기존파일 그대로 사용");
			member.setPROFILE_ORIGINAL(check);
		} else {
		
			if(uploadfile != null && !uploadfile.isEmpty()) {
				logger.info("파일 추가/변경되었습니다");
				
				String fileName = uploadfile.getOriginalFilename();	//원래 파일명
				member.setPROFILE_ORIGINAL(fileName);				//원래 파일명 저장
					
				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " + fileDBName);
					
				//업로드한 파일을 매개변수의 경로에 저장
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				logger.info("transferTo path = " + saveFolder + fileDBName);
				//바뀐 파일명으로 저장
				member.setMEMBER_PROFILE(fileDBName);
			 } else {	//기존 파일이 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
					logger.info("선택 파일 없습니다.");
					member.setMEMBER_PROFILE("");//""로 초기화
					member.setPROFILE_ORIGINAL("");//""로 초기화
			 }
		}
		
		int result = memberservice.update(member);
		
		principalmember.setMEMBER_PHONENO(member.getMEMBER_PHONENO());
		principalmember.setMEMBER_EMAIL(member.getMEMBER_EMAIL());
		principalmember.setMEMBER_PROFILE(member.getMEMBER_PROFILE());
		
		if(result == 1) {
			rattr.addFlashAttribute("result","updateSuccess");
			return "member/mypage_main";
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "정보 수정 실패");
			return "error/error";
		}
	}
	
	//마이페이지 개인정보수정 - 프로필 사진 파일 업로드 DB 저장 파일명 
	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);
		
		String homedir = saveFolder + "/profile/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();	//새로운 폴더 생성
		}
		
		//난수 구하기
		Random r = new Random();
		int random = r.nextInt(1000000000);
		
		//확장자 구하기 시작 */
		int index = fileName.lastIndexOf(".");
		logger.info("index = " + index);
		
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		//확장자 구하기 끝 */
		
		
		//새로운 파일명
		String refileName = "profile" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		//오라클 디비에 저장될 파일명
		String fileDBName = File.separator + "profile" + File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	
	//마이페이지 - 비밀번호 변경
	@GetMapping("/passchg")
	public String passchg() {
		return "member/mypage_passchg";
	}
	
	//마이페이지 - 비밀번호 변경처리
	@PostMapping("/modifypass")
	public String modifypass(@RequestParam("MEMBER_ID") String MEMBER_ID, 
							 @RequestParam("MEMBER_PASS") String MEMBER_PASS, 
							 Model model, 
							 HttpServletRequest request,  HttpServletResponse response,
							 RedirectAttributes rattr, HttpSession session)throws Exception {
		
		String encPassword = passwordEncoder.encode(MEMBER_PASS);
		
		int result = memberservice.updatepass(MEMBER_ID, encPassword);
		
		if(result == 1) { 	//삽입이 된 경우
			rattr.addFlashAttribute("logout","logout");
			return "redirect:/main";  //메인페이지로 이동
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "비밀번호 변경 실패");
			return "/member/mypage_main";  //에러페이지로 이동
		}
	}
	
	
	//회원탈퇴
	@GetMapping("/delete")
	public String delete(String MEMBER_ID, RedirectAttributes rattr) {
		memberservice.delete(MEMBER_ID);
		rattr.addFlashAttribute("logout","logout");
		return "redirect:/main";
	}
	
	
}	
