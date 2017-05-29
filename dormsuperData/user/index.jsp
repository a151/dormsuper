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
			会员帐户：
			<input type="text" name="username" id="username">
			<input type="hidden" name="username2" id="username2">
			&nbsp;&nbsp;
			<button id="select" class="btn btn-primary">
				查询
			</button>
			&nbsp;&nbsp;
			<button class="btn btn-info" id="refresh">
				刷新
			</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success" id="addnew">
				新增会员
			</button>
		</div>
		<table class="table table-bordered table-hover definewidth m10"
			id="table1">
			<thead>
				<tr>
					<th>
						会员账号
					</th>
					<th>
						会员昵称
					</th>
					<th>
						邮箱
					</th>
					<th>
						移动电话
					</th>
					<th>
						住址
					</th>
					<th>
						出生日期
					</th>
					<th>
						会员积分
					</th>
					<th>
						会员等级
					</th>
					<th>
						注册时间
					</th>
					<th>
						操作
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						zhangsan 
					</td>
					<td>
						张三
					</td>
					<td>
						321@qq.com
					</td>
					<td>
						13333333333
					</td>
					<td>
						广东省广州市天河区
					</td>
					<td>
						1990年11月6日
					</td>
					<td>
						12
					</td>
					<td>
						普通会员
					</td>
					<td>
						2016年3月6日
					</td>
					<td>
						<a href="edit.jsp">编辑 
						</a>
						<a href="edit.html" style="margin-left: 10px;">删除  </a>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="inline pull-right page">
			<span id="totalCount">1</span> 条记录
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
		 
		 $('#select').click(function(){
			select();
				
		 });
		 
		 $('#refresh').click(function(){
			var username = $('#username').val();
			console.log("username : "+username);
			select();
				
		 });
		 
		function del(id){
			if(confirm("确定要删除吗？")){
				var url = "index.jsp";
				window.location.href=url;
			}
		}
		
		function select(){
			$('table tbody').empty();
			var username = $('#username').val();
			if(null == username || 'null'== username || username.length == 0){
				username = $('#username2').val();
			}
			$('#username2').text(username);
			console.log(username);
			$.post("userSelect.action?username="+username+"&gotoPage="+gotoPage, function(data, status) {
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
			            var trvalue = "<tr>"+
										"<td>"+
										data.list[i].account+
										"</td>"+
										"<td>"+
										data.list[i].nickname+
										"</td>"+
										"<td>"+
										data.list[i].email+
										"</td>"+
										"<td>"+
										data.list[i].phone+
										"</td>"+
										"<td>"+
										data.list[i].addr+
										"</td>"+
										"<td>"+
										data.list[i].birthday+
										"</td>"+
										"<td>"+
										data.list[i].integrate+
										"</td>";

										if(data.list[i].integrate<1000){
											trvalue = trvalue+	"<td>"+
											"普通用户"+
											"</td>";
										}else if(data.list[i].integrate<10000){
											trvalue = trvalue+	"<td>"+
											"普通会员"+
											"</td>";
										}else{
											trvalue = trvalue+	"<td>"+
											"高级会员"+
											"</td>";
										}
										
										
										
										
										trvalue = trvalue+"<td>"+
										data.list[i].registertime+
										"</td>"+
										"<td>"+
										"	<a href='edit.jsp?account="+(data.list[i].account)+"'>编辑"+
										"	</a>"+
										"	<a href='delete.jsp?account="+(data.list[i].account)+"' style='margin-left: 10px;'>删除"+
										"	</a>"+
										"</td>"+
									"</tr>";
			            var $table = $('#table1');
	           			$table.append(trvalue);
			        }; 
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



