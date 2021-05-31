package com.test.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.domain.Comment;
import com.test.project.domain.Board;
import com.test.project.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {

		@Autowired CommentMapper commentmapper;
		
		@Override
		public List<Comment> selectCommentList(Board board) {
			return commentmapper.selectCommentList(board);
		}
		
		@Override
		public int commentCount(Board board) {
			return commentmapper.commentCount(board);
		}
		
		@Override
		public void insertComment(Comment comment) {
			commentmapper.insertComment(comment);
		}
		
		@Override
		public void commentDelete(Comment comment) {
			commentmapper.commentDelete(comment);
		}
}
