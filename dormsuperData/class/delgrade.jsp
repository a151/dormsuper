<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>e="text/html; charset=UTF-8" %>
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
<form action="index.html" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">年级名</td>
        <td><input type="text" name="gradename" id="gradename" value=""/><span id="nametip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button id="submit_btn" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>&nbsp;&nbsp; <span id="msg" style="color:red; margin-left: 10px;"></span>
        </td>
    </tr>
</table>
</form>
</body>
<script>

   $(function(){
		//提交表单
		$('#submit_btn').click(function(){
			if($('#gradename').val() == ''){
				$('#nametip').text('年级名不能为空！');	
				$('#name').focus();
			}else{
				$('#nametip').text('');
				var name = $('#gradename').val();
				console.log(name);
				$.post("gradeAdd.action?name="+name, function(data, status) {
		        	console.log(data);
					if (data.result == "ok") {
						$('#msg').text('');
						window.location.href = "success.html";
					} else {
						$('#msg').text(data.msg);
						
					}
		        }, "json");
				
			}
		});
	});
	
	$(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });

    });
</script>
</html>