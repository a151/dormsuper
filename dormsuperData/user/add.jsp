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
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="../js/ckform.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script language="javascript" type="text/javascript" src="../js/WdatePicker.js"></script>

 

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
<form action="index.html" id="form1" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">帐户</td>
        <td><input type="text" name="account" id="account" value=""/><span id="accounttip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">昵称</td>
        <td><input type="text" name="nickname" id="nickname" value=""/><span id="nicknametip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">密码</td>
        <td><input type="password" name="password" id="password" value=""/><span id="passwordtip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">邮箱</td>
        <td><input type="text" name="email" id="email"/><span id="emailtip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">移动电话</td>
        <td><input type="text" name="phone" id="phone" value=""/><span id="phonetip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">地址</td>
        <td><input type="text" name="addr" id="addr" value=""/><span id="addrtip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">出生日期</td>
        <td><input type="text" class="Wdate" name="birthday" onClick="WdatePicker()" id="birthday" value=""/><span id="birthdaytip" style="color:red; margin-left: 10px;"></span></td>
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
			if($('#account').val() == ''){
				$('#accounttip').text('账户不能为空！');	
				$('#account').focus();
			}else if($('#nickname').val() == ''){
				$('#accounttip').html("");
				$('#nicknametip').text('密码不能为空！');
				$('#nickname').focus();
			}else if($('#email').val() == ''){
				$('#accounttip').text('');
				$('#nicknametip').text('');
				$('#emailtip').text('姓名不能为空！');
				$('#email').focus();
			}else{
				$('#accounttip').text('');
				$('#nicknametip').text('');
				$('#emailtip').text('');
				
				var formParam = $("#form1").serialize();//序列化表格内容为字符串
				
				$.ajax({    
			        type:'post',        
			        url:'userAdd.action',    
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
	
	$(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });

    });
</script>
</html>