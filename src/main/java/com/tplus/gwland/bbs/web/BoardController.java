package com.tplus.gwland.bbs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tplus.gwland.bbs.service.Board;
import com.tplus.gwland.bbs.service.BoardMapper;
import com.tplus.gwland.bbs.service.BoardService;
import com.tplus.gwland.cmm.enm.Messenger;

@RestController
@RequestMapping("/boards")
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardService;
	@Autowired BoardMapper boardMapper;
	
	@PostMapping("")
	public Messenger write(@RequestBody Board board) {
		logger.info("글쓰기 진입");
		return (boardService.write(board) == 1) ? Messenger.SUCCESS : Messenger.FAILURE;
	}
	@GetMapping("")
	public Map<?, ?> list(){
		logger.info("리스트 진입");
		var map = new HashMap<>();
		map.put("list", boardService.list());
		return map;
	}
	@GetMapping("/detail/{bdNum}")
	public Map<?, ?> detail(@PathVariable String bdNum){
		logger.info("디테일 진입");
		var map = new HashMap<>();
		map.put("detail", boardService.selectById(bdNum));
		return map;
	}
	@PutMapping("")
	public Messenger update(@RequestBody Board board) {
		logger.info("업데이트 진입");
		return (boardService.update(board) == 1) ? Messenger.SUCCESS : Messenger.FAILURE;
	}
	@DeleteMapping("")
	public Messenger delete(@RequestBody Board board) {
		logger.info("delete 진입");
		return (boardService.delete(board) ==1) ? Messenger.SUCCESS : Messenger.FAILURE;
	}
}
