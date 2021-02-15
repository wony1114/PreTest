<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>방문자 리뷰</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	
</style>
</head>
<body>
<div class="container">
  <h2>상세보기</h2><br/>
  <a href="#" id="list">리뷰 목록</a><br/><br/><br/>
  	<table id="bddetail">
  	<thead>
  		<tr class="table-active">
  			<th>글번호: <span id="bdNum"></span></th> 			
            <th>작성자: <span id="writerId"></span></th>
            <th>작성일: <span id="regDate"></span></th>
  		</tr>
  	</thead>
  	<tbody>
  		<tr><td colspan="3" style="width: 100%">
  			<div id="content" style="height:300px"></div>
  		</td></tr>  		
  	</tbody>
  	<tr id="toggle"><td></td></tr>
  </table> 	
</div>
<script src="${bbs}/js/bbs.js"></script>
<script>
$('#list').click(function(e){location.href = "/demo/move/bbs/list"})
bbs.detail(`${ctx}`)
</script>
</body>
</html>