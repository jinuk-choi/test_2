package com.test.project.controller;

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

import com.test.project.domain.Board;
import com.test.project.domain.Comment;
import com.test.project.domain.Pagination;
import com.test.project.domain.Search;
import com.test.project.domain.User;
import com.test.project.service.BoardService;
import com.test.project.service.CommentService;
import com.test.project.service.UserService;


@org.springframework.stereotype.Controller
public class Controller {
	Board board = null;
	Comment comment = null;
	int count = 0;
	int page = 1;
	Pagination pagination = null;
	List<Board> boardList = null;
	List<Comment> commentList = null;
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;
	@Autowired CommentService commentservice;
	
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
	
	@RequestMapping({"/boarddetail","/boarddetail/{pageOpt}"})
	public String boardDetail(Model model,
			@RequestParam("aIdx") int aIdx,
			@PathVariable Optional<Integer> pageOpt) {			    
	
		board = boardservice.selectBoard(aIdx);
		int page = pageOpt.isPresent() ? pageOpt.get() : 1;
		count = commentservice.commentCount(board);
		pagination = new Pagination(page, count);
		board.setPagination(pagination);
		
		commentList = commentservice.selectCommentList(board);
		
		model.addAttribute("list", commentList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("board", board);
		
		return "/boarddetail";
	}
	
	@RequestMapping("/boardinsert") 
	public String boardInsert(Board board,Model model) {
		
//		User user = (User)au.getPrincipal();
//		board.setuIdx(user.getuIdx());
		
		model.addAttribute("board", board);

		return "/boardinsert";
		
	}
	
	@RequestMapping("/boardinserted") 
	public String boardInserted(Board board,Model model) {
		
		boardservice.insertBoard(board);
		boardList = boardservice.selectBoardList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", boardList);
		model.addAttribute("board", board);
		return "/boardresult";
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
	
	@RequestMapping({"/aj-comment-list","/aj-comment-list/{pageOpt}"}) 
	public String commentList(Board board,Model model,
			@PathVariable Optional<Integer> pageOpt) {
		
		int page = pageOpt.isPresent() ? pageOpt.get() : 1;
		count = commentservice.commentCount(board);
		pagination = new Pagination(page, count);
		board.setPagination(pagination);
		
		commentList = commentservice.selectCommentList(board);
		
		model.addAttribute("list", commentList);
		model.addAttribute("pagination", pagination);
		return "/commentlist";
	}
	
	@RequestMapping("/aj-comment-insert") 
	public String commentInsert(Comment comment,Model model) {
		commentservice.insertComment(comment);
		commentList = commentservice.selectCommentList(board);
		count = commentservice.commentCount(board);
		pagination = new Pagination(page, count);
		board.setPagination(pagination);
		
		model.addAttribute("list", commentList);
		model.addAttribute("pagination", pagination);
		return "/commentlist";
	}
	
	@RequestMapping("/aj-comment-edit") 
	public String commentEdit(Comment comment,Model model) {
		commentservice.editComment(comment);
		commentList = commentservice.selectCommentList(board);
		count = commentservice.commentCount(board);
		pagination = new Pagination(page, count);
		board.setPagination(pagination);
		
		model.addAttribute("list", commentList);
		model.addAttribute("pagination", pagination);
		return "/commentlist";
	}
	
	@RequestMapping("/aj-comment-delete") 
	public String commentDelete(Comment comment,Model model) {
		commentservice.commentDelete(comment);
		commentList = commentservice.selectCommentList(board);
		count = commentservice.commentCount(board);
		pagination = new Pagination(page, count);
		board.setPagination(pagination);
		
		model.addAttribute("list", commentList);
		model.addAttribute("pagination", pagination);
		return "/commentlist";
	}
	
	@RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
	 @RequestMapping("/signup")
	   public String signup(User user) {
	      //???????????? ?????????
		 
	      String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	     
	      //?????? ????????? ??????
	      user.setPassword(encodedPassword);
	      user.setAccountNonExpired(true);
	      user.setEnabled(true);
	      user.setAccountNonLocked(true);
	      user.setCredentialsNonExpired(true);
	      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));   
	      
	      //?????? ??????
	      userservice.createUser(user);
	      //?????? ?????? ??????
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

