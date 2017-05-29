<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../js/jquery.js"></script>

 <script type="text/javascript" src="http://api.map.baidu.com/api?key=3690f5facff0a96fc7ff291c20f532e0&v=1.0&services=true" ></script>  
<script type="text/javascript">    
  
function MblogDotccMap(keyword){  
    var map = new BMap.Map("MblogMap");          // 创建地图实例    
    var point = new BMap.Point(116.170005,40.182829);  // 创建默认坐标    
      
    map.centerAndZoom(point, 17);                 // 初始化地图，设置中心点坐标和地图级别    
      
    //添加缩放控件  
    map.addControl(new BMap.NavigationControl());    
    map.addControl(new BMap.ScaleControl());    
    map.addControl(new BMap.OverviewMapControl());   
      
    /*显示地图中心地点的坐标 
    map.addEventListener("dragend", function(){ 
      //map.panTo(point); 
      var center = map.getCenter(); 
      document.getElementById("info").innerHTML = "当前地图中心坐标：" + center.lng + ", " + center.lat; 
    });*/  
      
    //搜索  
    var local = new BMap.LocalSearch(map, {renderOptions: {map: map, panel: "results_info"}});  
    map.panBy(point);  
    local.search(keyword);   
    local.getResults();  
    local.setSearchCompleteCallback(function(searchResult){  
            var poi = searchResult.getPoi(0);  
            //alert(poi.point.lng+"   "+poi.point.lat);  
            document.getElementById("info1").value = poi.point.lng + "," + poi.point.lat;  
    });  
  
  
    map.addEventListener("click", function (e) {  
            var _point = e.point;  
            document.getElementById("info2").value = _point.lng + "," + _point.lat;  
          
    });  
  
}  
  
</script>   

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
        
        .nicebox{
		    background-color: rgb(255, 255, 255);
		    box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px inset;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(204, 204, 204);
		    border-image: initial;
		    transition: border 0.2s linear, box-shadow 0.2s linear;
		    display: inline-block;
		    height: 20px;
		    margin-bottom: 10px;
		    font-size: 14px;
		    line-height: 20px;
		    color: rgb(85, 85, 85);
		    vertical-align: middle;
		    padding: 4px 6px;
		    border-radius: 4px;
        }
        
        .nicebutton{
	        display: inline-block;
		    margin-bottom: 0px;
		    font-size: 14px;
		    line-height: 20px;
		    box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;
	    	padding: 4px 12px;
		    border-width: 1px;
		    border-style: solid;
		    border-image: initial;
		    border-radius: 4px;
		    color: rgb(255, 255, 255);
		    text-shadow: rgba(0, 0, 0, 0.247059) 0px -1px 0px;
		    background-color: rgb(0, 109, 204);
		    background-image: linear-gradient(rgb(0, 136, 204), rgb(0, 68, 204));
		    background-repeat: repeat-x;
		    border-color: rgba(0, 0, 0, 0.0980392) rgba(0, 0, 0, 0.0980392) rgba(0, 0, 0, 0.247059);
		    cursor: pointer;
        }
        
        


    </style>
</head>
<body onload="MblogDotccMap();" onkeydown="if(event.keyCode==13)MblogDotccMap(document.getElementById('keyword').value)">
<div>
    <h4>请先搜索大概位置然后使用鼠标点击所在的位置然后添加</h4>
</div>
<div style="width:400px;height:350px;border:1px solid gray; float:left" id="MblogMap"></div>  
<div style="margin-top:10px; margin-left:20px; float:left">  
<span>先用搜索查询出大概位置，然后鼠标点击想要的具体位置：</span>  
    <div id="search" style="margin-top:10px; margin-left:10px;">搜索：  
        <input class="nicebox " type="text" size="20" name="keyword" id="keyword" />   
        <input class="nicebutton" type="submit" value="提交" onclick="MblogDotccMap(document.getElementById('keyword').value)" />  
    </div>  
    <div id="results_info" style="margin-top:10px; margin-left:10px;"></div>  
    <form id="form1">
    <div id="info" style="margin-top:10px; margin-left:10px;">  
        搜索地址经纬度：<input class="nicebox" type="text" id="info1"/><br/><br/>  
        鼠标点击经纬度：<input class="nicebox" type="text" id="info2" name="xypoint"/>  
    </div>  
    <div style="margin-top:10px; margin-left:10px;">
    宿舍名称：<input class="nicebox" type="text" name="areaname" id="areaname"/> <span id="areanametip" style="color:red; margin-left: 10px;"></span><br><br/>
    宿舍地址：<input class="nicebox" type="text" name="addr" id="addr"/><span id="addrtip" style="color:red; margin-left: 10px;"></span> <br>
    	
    <span id="info2tip" style="color:red; margin-left: 10px;"></span>
    <br>
    <button class="nicebutton" type= "button" id="submit_btn">保存</button>
    </div>
    </form>
</div> 

</body>
<script>

   $(function(){
		//提交表单
		$('#submit_btn').click(function(){
			if($('#areaname').val() == ''){
				$('#areanametip').text('宿舍名称不能为空！');	
				$('#areaname').focus();
			}else if($('#addr').val() == ''){
				$('#areanametip').html("");
				$('#addrtip').text('地址不能为空！');
				$('#addr').focus();
			}else if($('#info2').val() == ''){
				$('#info2tip').html("请先点击图片的位置选择经纬度");
				$('#addrtip').text('');
				$('#areanametip').html("");
				$('#info2').focus();
			}else{
				$('#areanametip').text('');
				$('#addrtip').text('');
				
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