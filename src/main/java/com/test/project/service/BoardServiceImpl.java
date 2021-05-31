package com.test.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.test.project.domain.Board;
import com.test.project.domain.Search;
import com.test.project.domain.Pagination;
import com.test.project.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardMapper boardmapper;
	
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return boardmapper.selectBoardList(pagination);
	}
	
	public Board selectBoard(int aIdx) {
		return boardmapper.selectBoard(aIdx);
	}
	
	public void insertBoard(Board board) {
	
		logger.debug("before board: " + board);
		//board.setaDepth(board.getaDepth() + 1);
		boardmapper.insertBoard(board);
		logger.debug("after board: " + board);
		
		if (board.getaGroup() == 0) {
			boardmapper.updateBoard(board);
		
		} else { 
			boardmapper.updateReBoard(board);
		}
		
	}
	
	public void editBoard(Board board) {
		 boardmapper.editBoard(board);
	}
	
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
	}
	
	public int countBoard(Search search) {
		return boardmapper.countBoard(search);
	}

}

