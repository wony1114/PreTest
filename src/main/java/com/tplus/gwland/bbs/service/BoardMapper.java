package com.tplus.gwland.bbs.service;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardMapper {

	public int insert(Board board);

	public List<Board> select();

	public Board selectById(String bdNum);

	public int update(Board board);

	public int delete(Board board);


}
