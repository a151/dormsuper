<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>宿舍超市管理系统</title>
    <meta charset="UTF-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    	function goToMail(){
    		//进行操作时，必须判断页面是否在框架页内，
			//否则报错
			if(top.topManager){
			  //打开左侧菜单中配置过的页面
			  top.topManager.openPage({
			    id : '111'
			  });
			}
    	}
    </script>
</head>
<body>

<div class="header">

    <div class="dl-title">
    	
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log" style="padding-top: 5px">
    	 
    
    	宿舍超市O2O后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;
    	
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">宿舍超市管理</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
    <form id="form1" action=""></form>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
	BUI.use('common/main', function() {
		var json =  " [ {                                           "+
		" 			'id' : '1', 								    "+
		" 			'homePage' : '151',                                     		    "+
		" 			'menu' : [ {                                                        "+
		" 				'text' : '业务管理',                                             "+
		" 				'items' : [{                                             		"+
		" 					'id' : '149',                               				"+
		" 					'text' : '宿舍管理',                      	 				"+
		" 					'href' : 'area/index.jsp'                  					"+
		" 				},{                                              				"+
		" 					'id' : '151',                                				"+
		" 					'text' : '商品管理',                      				    "+
		" 					'href' : 'goods/index.jsp'          					    "+  
		" 				},{                                              				"+
		" 					'id' : '152',                                				"+
		" 					'text' : '订单管理',                      				    "+
		" 					'href' : 'order/index.jsp'          					    "+  
		" 				},{                                              				"+
		" 					'id' : '153',                               				"+
		" 					'text' : '商品推荐管理',                            			"+
		" 					'href' : 'goodsrecomend/index.jsp'             		  	 	"+
		" 				},{                                              				"+
		" 					'id' : '154',                                				"+
		" 					'text' : '商品活动',                      				    "+
		" 					'href' : 'activity/index.jsp'                				"+
		" 				},{                                              				"+
		" 					'id' : '155',                                				"+
		" 					'text' : '商品积分设定',                      				"+
		" 					'href' : 'integration/index.jsp'             	          			"+
		" 				},{                                              				"+
		" 					'id' : '156',                                				"+
		" 					'text' : '发现管理',                      				"+
		" 					'href' : 'cookbook/index.jsp'             	          			"+
		" 				},{                                              				"+
		" 					'id' : '157',                                				"+
		" 					'text' : '会员管理',                      				    "+
		" 					'href' : 'user/index.jsp'             	            		"+
		" 				}]                                            					"+
		" 			}  ]                                                  		 		"+
		" 		}]                                                                 		" ;
	
		var config = eval('(' + json + ')');
		new PageUtil.MainPage( {
			modulesConfig : config
		});
	});
	
</script>
</body>
</html>