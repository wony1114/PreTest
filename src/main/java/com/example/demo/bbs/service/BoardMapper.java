package com.example.demo.bbs.service;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardMapper {

	public int insert(Board board);

	public List<Board> selectAll();


}
