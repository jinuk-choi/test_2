package com.test.project.service;

import java.util.List;
import com.test.project.domain.Board;
import com.test.project.domain.Pagination;
import com.test.project.domain.Search;

public interface BoardService {
	public List<Board> selectBoardList(Pagination pagination);
	
	public Board selectBoard(int aIdx);
	
	public void insertBoard(Board board);
	
	public void editBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public int countBoard(Search search);
}
