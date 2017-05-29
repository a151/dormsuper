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
<form class="form-inline definewidth m20">
			
			&nbsp;&nbsp;
				积分抵扣设定,设定多少积分可以抵扣1元现金
		</form>

<form class="form-inline definewidth m20" id="form1" action="deductionEdit.action" method="post">
<table class="table table-bordered table-hover definewidth m10">
   
    <tr>
        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">抵扣金额1元的积分</td>
        <td><input type="text" name="deduction" id="deduction" value="" /><span id="deductiontip" style="color:red; margin-left: 10px;"></span></td>
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
		
			if($('#deduction').val() == ''){
				$('#deductiontip').text('积分不能为空！');
				$('#deduction').focus();
			}else{
				$('#deductiontip').text('');
			
				$("#form1").submit();
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