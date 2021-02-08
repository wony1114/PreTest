package com.example.demo.bbs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.bbs.service.Board;
import com.example.demo.bbs.service.BoardService;
import com.example.demo.cmm.enm.Messenger;

@RestController
@RequestMapping("/boards")
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardService;
	
	@PostMapping("")
	public Messenger write(@RequestBody Board board) {
		logger.info("글쓰기 진입");
		return (boardService.write(board) == 1) ? Messenger.SUCCESS : Messenger.FAILURE;
	}
	@GetMapping("")
	public Map<?, ?> list(){
		logger.info("리스트 진입");
		var map = new HashMap<>();
		map.put("list", boardService.list);
		map.put("message", (boardService.list == 1) ? Messenger.SUCCESS : Messenger.FAILURE);
		return map;
	}
}
