<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css" />
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

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
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
	<input type="hidden" id="id" name="id" value="<%=request.getParameter("id") %>"/>
			广州 - 天河 - 天河区中山大道东珠吉路口
			<br>
			<img src="posi.png" style="width: 941px;height: 469px;">
	</div>
</body>
<script>

   $(function(){
		//提交表单
		$('#submit_btn').click(function(){
			if($('#account').val() == ''){
				$('#accounttip').text('账户不能为空！');	
				$('#account').focus();
			}else if($('#nickname').val() == ''){
				$('#accounttip').html("");
				$('#nicknametip').text('密码不能为空！');
				$('#nickname').focus();
			}else{
				$('#accounttip').text('');
				$('#nicknametip').text('');
				
				var formParam = $("#form1").serialize();//序列化表格内容为字符串
				
				$.ajax({    
			        type:'post',        
			        url:'areaAdd.action',    
			        data:formParam,    
			        cache:false,    
			        dataType:'json',    
			        success:function(data){   
			        	console.log(data);
			        	console.log(data.result == "ok");
				        if (data.result == "ok") {
							window.location.href = "success.jsp";
						} else {
							window.location.href = "fail.html";
						} 
			        }    
			    });
			}
		});
	});
	
	$(function() {
		$('#backid').click(function() {
			window.location.href = "index.jsp";
		});
	});
</script>
</html>