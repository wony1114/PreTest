<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>방문자 리뷰</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>리뷰쓰기</h1>
		<form>
			<div>
				<label for=writer>작성자</label> <input id="writerId" type="text"
					name="bdwriter" class="form-control mt-4 mb-2" placeholder="작성자 입력"
					required><br />
			</div>
			<div class="form-group">
				<label for="content">리뷰</label>
				<textarea id="content" class="form-control" rows="10"
					name="bdContent" placeholder="리뷰입력" required></textarea>
			</div>
			<button type="submit" id="write-btn" class="btn btn-secondary mb-3">저장</button>
			<button type="reset" id="cancel-btn" class="btn btn-secondary mb-3">취소</button>
		</form>
	</div>
	<script src="/demo/resources/bbs/js/bbs.js"></script>
	<script>
		$('#write-btn').click(function() {
			bbs.write(`${ctx}`)
		})
		$('#cancel-btn').click(function() {
			location.href = "/demo/move/list"
		})
	</script>
</body>
</html>