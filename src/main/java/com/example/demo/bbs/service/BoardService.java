package com.example.demo.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
	public int write(Board board) {
		return boardMapper.insert(board);
	}
	public int list;
	public List<Board> list(){
		return boardMapper.select();
	}
	
}

