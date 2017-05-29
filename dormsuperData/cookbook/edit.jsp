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
<form class="form-inline definewidth m20" id="form1" action="cookBookEdit.action" method="post" enctype="multipart/form-data">
<table class="table table-bordered table-hover definewidth m10">
    <input type="hidden" id="id" name="id" value="<%=request.getParameter("id") %>"/>
   
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">发现名称</td>
        <td><input type="text" name="cname" id="cname" value="" /><span id="cnametip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">发现内容</td>
        <td><textarea name="cmethod" id="cmethod" class="input-large" type="text">
		        </textarea><span id="cmethodtip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">相关商品</td>
        <td><input type="text" name="csource" id="csource" value="${csource} "/><img id="search" src="../Images/x_bg2.png" style="height: 30px; width: 60px;"><span id="csourcetip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">图片</td>
        <td><input type="file" name="uploadImage" id="uploadImage"/><span id="uploadImagetip" style="color:red; margin-left: 10px;"></span></td>
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
		
			if($('#cname').val() == ''){
				$('#cnametip').text('名称不能为空！');
				$('#cname').focus();
			}else if($('#cmethod').val() == ''){
				$('#cnametip').text('');
				$('#cmethodtip').text('菜肴做法不能为空！');
				$('#cmethod').focus();
			}else{
				$('#cnametip').text('');
				$('#cmethodtip').text('');
			
				$("#form1").submit();
			}
		});
	});
	
	var formParam = $("#form1").serialize();//序列化表格内容为字符串
	$.ajax({    
        type:'post',        
        url:'cookBookSelectById.action',
        data:formParam,    
        cache:false,    
        dataType:'json',    
        success:function(data){ 
        	console.log(data);
			if (data.result == "ok") {
				
				$('#cname').val(data.c.cname);
				$('#cmethod').val(data.c.cmethod);
				//$('#csource').val(data.c.csource);
				
				
			} else {
			}
        }    
    });
	
	$(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });

		$('#search').click(function(){
			window.location.href="search.jsp";
	     });
    });
</script>
</html>