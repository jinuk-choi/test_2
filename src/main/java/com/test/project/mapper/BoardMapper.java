package com.test.project.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.test.project.domain.Board;
import com.test.project.domain.Pagination;
import com.test.project.domain.Search;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(Pagination pagination);
	
	public Board selectBoard(int aIdx);
	
	public void insertBoard(Board board);
	
	public void editBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public int countBoard(Search search);
}

