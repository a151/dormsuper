<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>宿舍超市管理系统</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
		<link rel="stylesheet" type="text/css"
			href="../css/bootstrap-responsive.css" />
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/bootstrap.js"></script>
		<script type="text/javascript" src="../js/ckform.js"></script>
		<script type="text/javascript" src="../js/common.js"></script>
		<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) { /* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
	</head>
	<body>
		<div class="form-inline definewidth m20">
			订单编号：
			<input type="text" name="username" id="username">
			<input type="hidden" name="username2" id="username2">
			&nbsp;&nbsp;
			<button id="selectuser" type="button" class="btn btn-primary">
				查询
			</button>
			&nbsp;&nbsp;
			&nbsp;&nbsp;
		</div>
		<table class="table table-bordered table-hover definewidth m10"
			>
			<thead>
				<tr>
					<th>
						订单编号
					</th>
					<th>
						订单用户
					</th>
					<th>
						商品名称
					</th>
					<th>
						价格
					</th>
					<th>
						数量
					</th>
					<th>
						总价
					</th>
					<th>
						收货地址
					</th>
					<th>
						订单状态
					</th>
					<th>
						订单日期
					</th>
					<th>
						操作
					</th>
				</tr>
			</thead>
			<tbody id="table1">
				<tr>
					<td>
						001
					</td>
					<td>
						lisi
					</td>
					<td>
						猪肉
					</td>
					<td>
						20.0
					</td>
					<td>
						2
					</td>
					<td>
						40.0
					</td>
					<td>
						广州市
					</td>
					<td>
						已付款
					</td>
					<td>
						2016年3月8日
					</td>
					<td>
						<a href="#" class='delivery' style="margin-left: 10px;">发货 </a>
						<a href="edit.html" style="margin-left: 10px;">确认订单已完成 </a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="inline pull-right page">
			<span id="totalCount">2</span> 条记录
			<span id="pageIndex"></span>/
			<span id="totalPage"></span> 1页
			<span id="firstpage" style="cursor: pointer; color: blue;">首页</span>
			<span id="prepage" style="cursor: pointer; color: blue;">上一页</span>
			<span class='current'><span id="pageIndex2"></span>
			</span>
			<span id="nextpage" style="cursor: pointer; color: blue;">下一页</span>
			<span id="lastpage" style="cursor: pointer; color: blue;">最后一页</span>
		</div>
	</body>
	<script>
		 var gotoPage = 0;
	
		 $('#firstpage').click(function(){
		 	gotoPage = -2;
			select();
		 });
		 
		 $('#lastpage').click(function(){
		 	gotoPage = 2;
			select();
		 });
		 
		 $('#prepage').click(function(){
		 	gotoPage = -1;
			select();
		 });
		 
		 $('#nextpage').click(function(){
		 	gotoPage = 1;
			select();
		 });
		 
		 $('#addnew').click(function(){
				window.location.href="add.jsp";
		 });
		 
		 $('#selectuser').click(function(){
			select();
				
		 });
		 
		 $('#refresh').click(function(){
			select();
				
		 });
		 
		function del(id){
			if(confirm("确定要删除吗？")){
				var url = "index.jsp";
				window.location.href=url;
			}
		}
		
		function select(){
			$('#table1').empty();
			var username = $('#username').val();
			if(null == username || 'null'== username || username.length == 0){
				username = $('#username2').val();
			}
			$('#username2').text(username);
			console.log(username);
			$.post("indentSelect.action?id="+username+"&gotoPage="+gotoPage, function(data, status) {
	        	console.log(data);
				if (data.result == "ok") {
					//$('#msg').text('');
					//window.location.href = "success.html";
					$('#totalCount').text(data.totalCount);
					$('#pageIndex').text(data.pageIndex);
					$('#totalPage').text(data.totalPage);
					$('#pageIndex2').text(data.pageIndex);
					
					for (var i = 0; i < data.list.length; i++) { 
			            console.log(data.list[i]); 
			            var trvalue = " <tr> "+
								" <td> "+
								data.list[i].id+
								" </td> "+
								" <td> "+
								data.list[i].account+
								" </td> "+
								" <td> "+
								data.list[i].GName+
								" </td> "+
								" <td> "+
								data.list[i].GPrice+
								" </td> "+
								" <td> "+
								data.list[i].GNum+
								" </td> "+
								" <td> "+
								data.list[i].GAmount+
								" </td> "+
								" <td> "+
								data.list[i].OAddr+
								" </td> "+
								" <td> "+
								data.list[i].OState+
								" </td> "+
								" <td> "+
								data.list[i].OTime+
								" </td> "+
								" <td> ";
								
								if(data.list[i].OState == "已付款"){
									trvalue = trvalue +" <a href='#' class='delivery' style='margin-left: 10px;'>发货 </a> ";
								}else if(data.list[i].OState == "已发货"){
									trvalue = trvalue +" <a href='#' class='over' style='margin-left: 10px;'>确认订单已完成 </a> ";
								}else{
									
								}
								trvalue = trvalue +" </td> "+
							" </tr>";
			            var $table = $('#table1');
	           			$table.append(trvalue);
			        }; 
			        $(".delivery").click(function(){
			        	var td = $(this);
			        	var tr = td.parent();
			        	console.log(tr);
			        	var td2 = $(this).parent().parent().children('td').eq(7);
			        	var td3 = $(this).parent().parent().children('td').eq(9);
						var r=confirm("确定要发货吗？");
						
						var oid = $(this).parent().parent().children('td').eq(0).text();
						
						console.log("oid : "+oid);
						
					  	if (r==true){
						  	$.post("indentEdit.action?id="+oid+"&state=2&gotoPage="+gotoPage, function(data, status) {
					        	console.log(data);
								if (data.result == "ok") {
									td2.text("已发货");
									td3.html("<a href='#' class='over' style='margin-left: 10px;'>确认订单已完成 </a>");
									
									
									$(".over").click(function(){
							        	var td = $(this);
							        	var tr = td.parent();
							        	console.log(tr);
							        	var td2 = $(this).parent().parent().children('td').eq(7);
							        	var td3 = $(this).parent().parent().children('td').eq(9);
										var r=confirm("确定要完成订单吗？");
										
										var oid = $(this).parent().parent().children('td').eq(0).text();
										
										console.log("oid : "+oid);
										
									  	if (r==true){
										  	$.post("indentEdit.action?id="+oid+"&state=3&gotoPage="+gotoPage, function(data, status) {
									        	console.log(data);
												if (data.result == "ok") {
													td2.text("订单已完成");
													td3.text("");
												}
										    });
									  	
									    }else{
									    
									    }
							 			
									})
								}
						    });
					  	
					    }else{
					    
					    }
			 			
					});
					
					$(".over").click(function(){
			        	var td = $(this);
			        	var tr = td.parent();
			        	console.log(tr);
			        	var td2 = $(this).parent().parent().children('td').eq(7);
			        	var td3 = $(this).parent().parent().children('td').eq(9);
						var r=confirm("确定要完成订单吗？");
						
						var oid = $(this).parent().parent().children('td').eq(0).text();
						
						console.log("oid : "+oid);
						
					  	if (r==true){
						  	$.post("indentEdit.action?id="+oid+"&state=3&gotoPage="+gotoPage, function(data, status) {
					        	console.log(data);
								if (data.result == "ok") {
									td2.text("订单已完成");
									td3.text("");
								}
						    });
					  	
					    }else{
					    
					    }
					})
					
				} else {
					//$('#msg').text(data.msg);
					$('#totalCount').text('0');
					$('#pageIndex').text('0');
					$('#totalPage').text('0');
					$('#pageIndex2').text('0');
				}
        	}, "json");
		}
		
		
		select();
		
		
		
		
			
		
		
	</script>
</html>



