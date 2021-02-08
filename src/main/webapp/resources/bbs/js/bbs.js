var bbs = bbs || {}

bbs.write = x => {
	$.ajax({
		url:`${x}/boards`,
		type: 'POST',
		data: JSON.stringify({
			writerId: $('#writerId').val(),
			content: $('#content').val()
		}),
		dataTye: 'json',
		contentType: 'application/json',
		success: d => {
			location.href = "/demo/move/list"	
		},
		error: e => {
			alert(`글쓰기 에러: ${e}`)
			location.href = "/demo/move/404"
		}
	})
}
bbs.list = x => {
	$.getJSON(`${x}/boards`, d => {
		$.each(d.list, (i, j) =>{
			$(`<tr><td>${j.dbNum}</td>
				<td>${j.writerId}</td>
				<td>${j.content}</td>
				<td>${j.regDate}</td></tr>`)
				.css({padding: `15px`, textAlign: `left`, fontSize: `medium`})
				.appendTo(`#bbs.list`)
		})
	})
}
