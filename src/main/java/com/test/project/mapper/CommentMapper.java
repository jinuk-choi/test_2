package com.test.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.domain.Board;
import com.test.project.domain.Comment;


@Mapper
public interface CommentMapper {
	public List<Comment> selectCommentList(Board board);

	public int commentCount(Board board);
	
	public void insertComment(Comment comment);
	
	public void commentDelete(Comment comment);
	
	public void editComment(Comment comment);
	
	public void updateComment(Comment comment);
	
	public void updateReComment(Comment comment);
}

