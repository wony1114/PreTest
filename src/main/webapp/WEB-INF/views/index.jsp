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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>방문자 리뷰</h2>
  <ul class="list-group">
    <li class="list-group-item">
    	<a href="#" id="write">리뷰 쓰기</a>
    </li>
    <li class="list-group-item">
    	<a href="#" id="list">리뷰 리스트</a>
    </li>
  </ul>
</div>
<script>
	$('#write').click(function(){location.href = `${ctx}/move/bbs/write`})
	$('#list').click(function(){location.href = `${ctx}/move/bbs/list`})
</script>
</body>
</html>