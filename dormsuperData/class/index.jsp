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
		<form action="" id="form1"></form>
		<div class="form-inline definewidth m20"  >
			类别管理
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-success" id="addnewgrade">
				添加类别
			</button>
		</div>
		<div id = "gradevalue" ></div>
		
		
		<!--  
		<div class="well" style="margin:10px;padding-top:10px;">
			<div class="form-inline m20"  style="padding-top:10px;">
					
					<label style="font-size: 18px;">
						类别2<input type="hidden" value="类别2" name="name">
					</label>
					<a href="delgrade_result.jsp?gradeid=2">
					<button type="submit" class="btn btn-info">
						删除类别
					</button>
					</a>
					<a href="addclass.jsp?gradeid=2">
					<button type="button" class="btn btn-success">
						添加类别
					</button>
					</a>
				<br>
				<br>
				
				<label style="margin-left:20px;">
					<input type="hidden" value="1班">
					类别1
				</label>
				&nbsp;&nbsp;
				<a href="delclass_result.jsp?gradeid=1&classid=1">
				<button type="submit" class="btn btn-info">
					删除
				</button>
				</a>
				<label style="margin-left:20px;">
					类别2
				</label>
				&nbsp;&nbsp;
				<button type="submit" class="btn btn-info">
					删除
				</button>
				
				<label style="margin-left:20px;">
					类别3
				</label>
				&nbsp;&nbsp;
				<button type="submit" class="btn btn-info">
					删除
				</button>
			</div>
		</div>
		-->
	</body>
	<script type="text/javascript">
		
		
		var formParam = $("#form1").serialize();//序列化表格内容为字符串    
	    $.ajax({    
	        type:'post',        
	        url:'gcSelect.action',    
	        data:formParam,    
	        cache:false,    
	        dataType:'json',    
	        success:function(data){ 
	        	//console.log(data);
				if (data.result == "ok") {
					for (var i = 0; i < data.list.length; i++) { 
			            console.log(data.list[i]); 
			           
			            var gradevalue = " <div class='well' style='margin:10px;padding-top:10px;'> "+
							" <div class='form-inline m20'  style='padding-top:10px;'> "+
							" 		<label style='font-size: 18px;'> "+
								data.list[i].name+
							" 		</label> "+
							" 		<a href='delgrade_result.jsp?gradeid=2'> "+
							" 		<button type='submit' class='btn btn-info'> "+
							" 			删除类别 "+
							" 		</button> "+
							" 		</a> "+
							" 		<a href='addclass.jsp?gradeid="+data.list[i].id+"'> "+
							" 		<button type='button' class='btn btn-success'> "+
							" 			添加类别 "+
							" 		</button> "+
							" 		</a> "+
							" 	<br> "+
							" 	<br> ";
			            
			            for (var j = 0; j < data.list[i].list.length; j++) { 
			            	console.log(data.list[i].list[j]);
			            	gradevalue = gradevalue+" <label style='margin-left:20px;'> "+
										data.list[i].list[j].classname+
										" </label> "+
										" &nbsp;&nbsp; "+
										" <a href='delclass_result.jsp?gradeid=1&classid=1'> "+
										" <button type='submit' class='btn btn-info'> "+
										" 	删除 "+
										" </button> "+
										" </a> ";
			            
			            
			            	
			            }
			            
			            
			            gradevalue = gradevalue+" </div></div>";
			            
			            var $gradevalue = $('#gradevalue');
	          
	           			$gradevalue.append(gradevalue);
			            
			            
			        }; 
					
				} else {
					
					console.log("error");
				}
	        }    
	    });
		
		
		$('#addnewclass').click(function(){
				window.location.href="addclass.jsp";
		 });
		 $('#addnewgrade').click(function(){
				window.location.href="addgrade.jsp";
		 });
	</script>
</html>
