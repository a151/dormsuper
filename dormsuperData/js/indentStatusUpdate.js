function del(){
	var b=window.confirm("是否删除订单信息？");
	if (!b) {
		return false;
	}
}
function su(a,b){
	var boo=window.confirm("是否保存修改？");
	if (boo) {
		wr(a,b);
	}
}
function wr(a,b){
	$.post(
		"indentStatusUpdateServlet",
		{"i_id":a,"i_status":b},
		function(mess){
			if (mess==null) {
				alert("修改成功！");
			}
		},
		"json"
	);
}