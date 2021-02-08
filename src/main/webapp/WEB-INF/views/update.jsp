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
	table {border: white 1px solid}
	table tr {border: white 1px solid}
	table tr td {border: white 1px solid}
	table tr th {border: white 1px solid}
</style>
</head>
<body>
<div class="container">
  <h2>리뷰 수정</h2>
  <a href="#" id="write">리뷰쓰기</a>
  <table id="bdlist">
  	<thead>
  		<tr>
  			<td>글번호</td> 			
            <td>리뷰</td>
            <td>작성자</td>
            <td>작성일</td>
  		</tr>
  	</thead>
  </table>
</div>
<script src="/demo/resources/bbs/js/bbs.js"></script>
<script>
$('#write').click(function(e){
	e.preventDefault()
	location.href = "/demo/move/write"
})
bbs.list({ctx: `${ctx}`})
bbs.update({ctx:`${ctx}`})
</script>
</body>
</html>