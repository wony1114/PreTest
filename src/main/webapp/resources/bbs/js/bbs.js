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
			location.href = "/demo/move/bbs/list"	
		},
		error: e => {
			alert(`글쓰기 에러: ${e}`)
			location.href = "/demo/move/bbs/404"
		}
	})
}
bbs.list = x => {
	$.getJSON(`${x.ctx}/boards`, d => {
		$.each(d.list, (i, j) =>{
			$(`<tr><td>${j.bdNum}</td>				
				<td><a href="#" class="content" id="${j.bdNum}">${j.content}</a></td>
				<td>${j.writerId}</td>
				<td>${j.regDate}</td></tr>`)
				.css({padding: `15px`, textAlign: `left`, fontSize: `medium`})
				.appendTo(`#bdlist`)
		})
		$('.content').each(() => {
			$(this).click(e => {
				localStorage.setItem('bdNum', `${this.id}`)
				location.href='/demo/move/bbs/detail'
			})
		})
	})
}
bbs.detail = x => {
	alert('디테일들어옴?????')
	$.getJSON(`${x}/boards/detail/${localStorage.getItem('bdNum')}`, d =>{
		alert('디테일들어옴!!!!!!')
		$(`<tr><td>${d.bdNum}</td></tr>`)
		.css({padding: `15px`, textAlign: `left`, fontSize: `medium`})
		.appendTo(`#bddetail`)
		$('#writerId').text(d.writerId)
		$('#content').text(d.content)		
		$('#regDate').text(d.regDate)
		$('#toggle').html('<button id="update-btn">수정</button><button id="delete-btn">삭제</button>')
			$('#update-btn').click(e => {
				$('#content').html('<textarea id="update-content">'+d.content+'</textarea>')
				$('#toggle').html('<button id="confirm">수정완료</button>')
				$('#confirm').click(e=>{
					e.preventDefault()
					$.ajax({
						url:`${x}/boards`,
						type:'PUT',
						data:JSON.stringify({
							bdNum: d.bdNum,
							writerId:d.writerId,
							content:d.content,
							regDate:d.regDate							
						}),
						dataType:'json',
						contentType:'application/json',
						success: d => {
							alert('수정완료')
							location.href = '/demo/move/bbs/detail'
						},
						errer: e => {
							alert('수정실패')
						}
					})
				})
			})
		$('#delete-btn').click(e => {
			e.preventDeafault()
			$.ajax({
				url:`${x}/boards`,
				type: 'DELETE',
				data: JSON.stringify({
					bdNum: d.bdNum
				}),
				dataType:'json',
				contentType: 'application/json',
				success: d => {
					alert('삭제완료')
				},
				error: e =>{
					alert(`삭제실패: ${e}`)
				}
			})
		})
	})
}
