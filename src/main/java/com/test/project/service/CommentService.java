package com.test.project.service;

import java.util.List;

import com.test.project.domain.Comment;
import com.test.project.domain.Board;

public interface CommentService {
	public List<Comment> selectCommentList(Board board);

	public int commentCount(Board board);
	
	public void insertComment(Comment comment);
	
	public void editComment(Comment comment);
	
	public void commentDelete(Comment comment);
	
}
