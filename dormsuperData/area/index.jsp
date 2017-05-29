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
		<form id="form1" class="form-inline definewidth m20">
			宿舍名称：
			<input type="text" name="areaname" id="areaname" value="">
			<input type="hidden" name="areaname2" id="areaname2">
			&nbsp;&nbsp;
			<button id="select" class="btn btn-primary" type="button">
				查询
			</button>
			&nbsp;&nbsp;
			<button class="btn btn-info" id="refresh" type="button">
				刷新
			</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success" id="addnew">
				新增宿舍
			</button>
		</form>
		<table class="table table-bordered table-hover definewidth m10"
			>
			<thead>
				<tr>
					<th>
						宿舍名称
					</th>
					<th>
						地址
					</th>
					
					<th>
						操作
					</th>
				</tr>
			</thead>
			<tbody id="table1">
				<tr>
					<td>
						东珠吉路
					</td>
					<td>
						天河区中山大道东珠吉路口
					</td>
					
					<td>
						<a href="edit.jsp">编辑
						</a>
						<a href="edit.html" style="margin-left: 10px;">删除 </a>
						<a href="add.jsp" style="margin-left: 10px;">在百度地图中查看 </a>
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
			
			select();
				
		 });
		
		function select(){
			$('#table1').empty();
			
			var formParam = $("#form1").serialize();//序列化表格内容为字符串    
		    $.ajax({    
		        type:'post',        
		        url:'areaSelect.action?gotoPage='+gotoPage,    
		        data:formParam,    
		        cache:false,    
		        dataType:'json',    
		        success:function(data){ 
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
				       
								var trvalue = "<tr> <td> "+
										data.list[i].areaname+
									" </td> "+
									" <td> "+
									 data.list[i].addr+
									" </td> "+
									" <td>"+
									"	<a href='delete.jsp?aid="+(data.list[i].id)+"' style='margin-left: 10px;'>删除"+
									"	</a>"+
									"	<a href='seeinbaidu.jsp?xypoint="+(data.list[i].xypoint)+"' style='margin-left: 10px;'>在百度地图中查看"+
									" </td></tr>";
									
				            
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
		        }    
		    });
		}
		select();
	</script>
</html>



