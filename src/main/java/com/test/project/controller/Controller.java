package com.test.project.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.project.domain.Pagination;
import com.test.project.domain.Board;
import com.test.project.domain.Search;
import com.test.project.domain.User;
import com.test.project.service.BoardService;
import com.test.project.service.UserService;


@org.springframework.stereotype.Controller
public class Controller {
	Board board = null;
	int count = 0;
	int page = 1;
	Pagination pagination = null;
	List<Board> boardList = null;
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	
	@RequestMapping("/")
	public String home(Model model) {
	
		pagination = new Pagination(page, count);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("list", boardList);
		model.addAttribute("pagination", pagination);
		
		logger.debug("debug");
	     logger.info("info");
	     logger.error("error");
		return "/index";
	}
	
	@RequestMapping({"/boardlist", "/boardlist/{pageOpt}", "/boardlist/{pageOpt}/{typeOpt}/{keywordOpt}"})
	public String boardList(Model model, 
			@PathVariable Optional<Integer> pageOpt, 
			@PathVariable Optional<Integer> typeOpt, 
			@PathVariable Optional<String> keywordOpt ) {
		Search search = null;
		int page = pageOpt.isPresent() ? pageOpt.get() : 1;
		int type = typeOpt.isPresent() ? typeOpt.get() : 0;
		String keyword = keywordOpt.isPresent() ? keywordOpt.get() : null ;
		
		
	if(keyword != null ) {
		search = new Search(type, keyword);
	}
		count = boardservice.countBoard(search);
		pagination = new Pagination(page, count, search);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("list", boardList);
		model.addAttribute("pagination", pagination);
		return "/boardlist";
	}
	
	@RequestMapping("/boarddetail")
	public String boardDetail(@RequestParam("aIdx") int aIdx, Model model) {
	    board = boardservice.selectBoard(aIdx);
		model.addAttribute("board", board);

		return "/boarddetail";
	}
	
	@RequestMapping({"/boardinsert", "/boardinsert/{group}/{order}/{depth}"}) 
	public String boardInsert(
			@PathVariable Optional<Integer> group,
			@PathVariable Optional<Integer> order,
			@PathVariable Optional<Integer> depth	) {
		
		return "/boardinsert";
	}
	
	@RequestMapping("/boardinserted") 
	public String boardInserted(Board board,Model model) {
		boardservice.insertBoard(board);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", boardList);
		model.addAttribute("board", board);
		return "/boardlist";
	}
	
	@RequestMapping("/boardedit") 
	public String boardEdit(Board board) {	
		return "/boardedit";
	}
	
	@RequestMapping("/boardedited") 
	public String boardEdited(Board board,Model model) {
		boardservice.editBoard(board);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", boardList);
		model.addAttribute("board", board);
		return "/boardlist";
	}
	
	@RequestMapping("/boardelete") 
	public String boardDelete(Board board,Model model) {
		boardservice.deleteBoard(board);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", boardList);
		model.addAttribute("board", board);
		return "/boardlist";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	 @RequestMapping("/signup")
	   public String signup(User user) {
	      //비밀번호 암호화
		 
	      String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	     
	      //유저 데이터 세팅
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));   
	      
	      //유저 생성
	      userservice.createUser(user);
	      //유저 권한 생성
	      userservice.createAuthorities(user);
	      
	      return "/login";
	   }
	
	@RequestMapping(value="/login")
	   public String beforeLogin(Model model) {
	      return "/login";
	   }
	
	@Secured({"ROLE_ADMIN"})
	   @RequestMapping(value="/admin")
	   public String admin(Model model) {
	      return "/admin";
	   }
	   
	   @Secured({"ROLE_USER"})
	   @RequestMapping(value="/user/info")
	   public String userInfo(Model model) {
	      
	      return "/user_info";
	   }
	   
	   @RequestMapping(value="/denied")
	   public String denied(Model model) {
	      return "/denied";
	   }
}

