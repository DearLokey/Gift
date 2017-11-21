$(function() {
	$("#search").click(function() {
		$.ajax({
			url : "show_searchByWord.do",
			type : "post",
			data : {
				"word" : $("#content").val()
			},
			success : function(data) {
				if (data.info == 'ok') {
					window.location.href = "search.jsp";
				}
			}
		});
	});
	$("#adminSearch").click(function() {
		$.ajax({
			url : "show_searchByWord.do",
			type : "post",
			data : {
				"word" : $("#content").val()
			},
			success : function(data) {
				if (data.info == 'ok') {
					window.location.href = "adminSearchGift.jsp";
				}
			}
		});
	});
})
