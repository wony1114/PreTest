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
			console.log(i)
			$(`<tr><td>${j.bdNum}</td>				
				<td><a href="#" class="content" id="${j.bdNum}">${j.content}</a></td>
				<td>${j.writerId}</td>
				<td>${j.regDate}</td></tr>`)
				.css({padding: `15px`, textAlign: `left`, fontSize: `medium`})
				.appendTo('#bdlist')
		})
		$('.content').each(function(){
			$(this).click(e => {
				e.preventDefault()
				localStorage.setItem('bdNum', `${this.id}`)
				alert(`${this.id}`)
				location.href=`${x.ctx}/move/bbs/detail`
			})
		})
	})
}
bbs.detail = x => {
	$.getJSON(`${x}/boards/detail/${localStorage.getItem('bdNum')}`, d => {
		alert(`디테일들어옴!!!! : ${localStorage.getItem('bdNum')}`)
		$(`#bdNum`).text(d.detail.bdNum) // d.bdNum 이 아니고 dbNum 출력된 그대로 출려
		$(`#writerId`).text(d.detail.writerId) // d = map , detail = Dto
		$("#content").text(d.detail.content)
		$("#regDate").text(d.detail.regDate)
		/*$(`<tr><td>${d.detail.bdNum}</td>
			   <td>${d.detail.writerId}</td>
			   <td>${d.detail.regDate}</td>
		</tr>`)
		.appendTo(`#bddetail`)*/
		$('#toggle').html('<button id="update-btn">수정</button><button id="delete-btn">삭제</button>')
			$('#update-btn').click( e => {
				e.preventDefault()
				$('#content').html('<textarea id="update-content">'+d.detail.content+'</textarea>')
				$('#toggle').html('<button id="confirm">수정완료</button>')
				$('#confirm').click(e=>{
					e.preventDefault()
					$.ajax({
						url:`${x}/boards`,
						type:'PUT',
						data:JSON.stringify({
							bdNum: d.detail.bdNum,
							writerId:d.detail.writerId,
							content:$('#update-content').val(),
							regDate:d.detail.regDate							
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
			e.preventDefault()
			$.ajax({
				url:`${x}/boards`,
				type: 'DELETE',
				data: JSON.stringify({
					bdNum: d.detail.bdNum
				}),
				dataType:'json',
				contentType: 'application/json',
				success: d => {
					alert('삭제완료')
					location.href = '/demo/move/bbs/list'
				},
				error: e =>{
					alert(`삭제실패: ${e}`)
				}
			})
		})
	})
}
