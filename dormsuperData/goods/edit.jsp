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
<form class="form-inline definewidth m20" id="form1" action="goodsEdit.action" method="post" enctype="multipart/form-data">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
    	<input type="hidden" id="g_id" name="g_id" value="<%=request.getParameter("g_id") %>"/>
        <td width="10%" style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">商品分类</td>
        <td><select  data-rules="{required:true}"  id="category" name ="category" class="input-normal" > 
                <option value="">请选择</option>
                <option value="1">饮品</option>
                <option value="2">日用</option>
                <option value="3">零食</option>
                <option value="4">数码</option>
                <option value="5">服务</option>
              </select><span id="categorytip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">名称</td>
        <td><input type="text" name="g_name" id="g_name" value="" readonly="readonly"/><span id="g_nametip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">价格</td>
        <td><input type="text" name="g_price" id="g_price"/><span id="g_pricetip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">库存</td>
        <td><input type="text" name="g_count" id="g_count"/><span id="g_counttip" style="color:red; margin-left: 10px;"></span></td>
    </tr>
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">描述</td>
        <td><input type="text" name="g_desc" id="g_desc"/><span id="g_desctip" style="color:red; margin-left: 10px;"></span></td>
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
		
			var sel_obj = document.getElementById("category");
			var index = sel_obj.selectedIndex;
			
			if(sel_obj.options[index].text == "请选择"){
				$('#categorytip').text("请选择商品类别");
				$('#category').focus();
			}else if($('#g_name').val() == ''){
				$('#categorytip').html("");
				$('#g_nametip').text('名称不能为空！');
				$('#g_name').focus();
			}else if($('#g_price').val() == ''){
				$('#categorytip').text('');
				$('#g_nametip').text('');
				$('#g_pricetip').text('价格不能为空！');
				$('#g_price').focus();
			}else{
				$('#categorytip').text('');
				$('#g_nametip').text('');
				$('#g_pricetip').text('');
			
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
				$('#g_price').val(data.g.GPrice);
				$('#g_desc').val(data.g.GDesc);
				$('#g_count').val(data.g.g_count);
				
				
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