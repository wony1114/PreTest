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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  	.main{float: right;}
  </style>
</head>
<body>
<div class="w3-container">
  <h4 class="main"><a href="#" id="home">main</a></h4>
  <h2>리뷰 보기</h2>
  <a href="#" id="list">리뷰목록</a>
  <table id="bddetail" class="w3-table w3-striped w3-border">
  	<thead>
  		<tr>
  			<th style="width: 20%">글번호: <span id="bdNum"></span></th> 			
            <th style="width: 40%">작성자: <span id="writerId"></span></th>
            <th style="width: 40%">작성일: <span id="regDate"></span></th>
  		</tr>
  	</thead>
  	<tbody>
  		<tr><td colspan="3" style="width: 100%"><div id="content" style="height: 300px"></div></td></tr>  		
  	</tbody>
  </table>
  <span id="toggle"></span>
</div>
<script src="${bbs}/js/bbs.js"></script>
<script>
$('#home').click(function(e){location.href = `${ctx}`})
$('#list').click(function(e){location.href = `${ctx}/move/bbs/list`})
bbs.detail(`${ctx}`)
</script>
</body>
</html>