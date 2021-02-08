var bbs = bbs || {}

bbs.write = x => {
	$.ajax({
		url:`${x}/boards`,
		type: 'POST',
		data: JSON.stringify({			
			content: $('#content').val(),
			writerId: $('#writerId').val()
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
	$.getJSON(`${x.ctx}/boards`, d => {
		$.each(d.list, (i, j) =>{
			$(`<tr><td>${j.bdNum}</td>				
				<td><a href="#" id="content-detail">${j.content}</a></td>
				<td>${j.writerId}</td>
				<td>${j.regDate}</td></tr>`)
				.css({padding: `15px`, textAlign: `left`, fontSize: `medium`})
				.appendTo(`#bdlist`)
		})
	})
}
bbs.update = x => {
	
}
