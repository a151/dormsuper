<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
 <head>
  <title>宿舍超市管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
 </head>
 <body>
  
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="tips tips-large tips-success">
          <span class="x-icon x-icon-success"><i class="icon icon-ok icon-white"></i></span>
          <form id="form1">
          <input type="hidden" id="id" name="id" value="<%=request.getParameter("id") %>"/>
          <div class="tips-content">
            <h2 id="msg">操作成功</h2>
            <p class="auxiliary-text">
              	你可以继续操作以下内容：
            </p>
            <p>
              <a ><span id="backid">返回列表</span></a>
            </p>
          </div>
          </form>
        </div>
      </div> 
    </div>
  </div>
  <script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/bui-min.js"></script>
  <script type="text/javascript" src="../assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');
  </script>
  <!-- 仅仅为了显示代码使用，不要在项目中引入使用-->
  <script type="text/javascript" src="../assets/js/prettify.js"></script>
  <script type="text/javascript">
  	$(function () {       
		$('#backid').click(function(){
				window.location.href="index.jsp";
		 });

    });
  
    $(function () {
      prettyPrint();
    });
    
    var formParam = $("#form1").serialize();//序列化表格内容为字符串
	$.ajax({    
        type:'post',        
        url:'cookBookDelete.action',
        data:formParam,    
        cache:false,    
        dataType:'json',    
        success:function(data){ 
        	console.log(data);
			if (data.result == "ok") {
				$('#msg').text('操作正确！');
				//window.location.href = "success.html";
				//$('#realname').text(data.list[0].realname);
				
			} else {
				$('#msg').text('操作失败！');
			}
        }    
    });
    
  </script> 
<body>
</html>  