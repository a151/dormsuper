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
<form class="form-inline definewidth m20" id="form1" action="goodsIntegrationEdit.action" method="post" >
<table class="table table-bordered table-hover definewidth m10">
    <tr>
    	<input type="hidden" id="g_id" name="g_id" value="<%=request.getParameter("g_id") %>"/>
        <td width="10%" style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">商品分类</td>
        <td><select  data-rules="{required:true}"  id="category" name ="category" class="input-normal" disabled="disabled"> 
                <option value="">请选择</option>
                <option value="1">蔬菜</option>
                <option value="2">谷物</option>
                <option value="3">肉类</option>
                <option value="4">水果</option>
                <option value="5">干货</option>
              </select><span id="categorytip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">名称</td>
        <td><input type="text" name="g_name" id="g_name" value="" readonly="readonly"/><span id="g_nametip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">积分</td>
        <td><input type="text" name="g_integration" id="g_integration"/><span id="g_integrationtip" style="color:red; margin-left: 10px;"></span></td>
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
		
			if($('#g_integration').val() == ''){
				$('#g_integrationtip').text('积分不能为空！');
				$('#g_integration').focus();
			}else{
				$('#g_integrationtip').text('');
			
				$("#form1").submit();
			}
		});
	});
	
	var formParam = $("#form1").serialize();//序列化表格内容为字符串
	$.ajax({    
        type:'post',        
        url:'goodsSelectById.action',
        data:formParam,    
        cache:false,    
        dataType:'json',    
        success:function(data){ 
        	console.log(data);
			if (data.result == "ok") {
				console.log(data.g.categoryId);
				
				document.getElementById("category")[data.g.categoryId].selected=true;
				
				$('#g_name').val(data.g.GName);
				$('#g_integration').val(data.g.g_integration);
				
				
			} else {
			}
        }    
    });
	
	$(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });
    });
</script>
</html>