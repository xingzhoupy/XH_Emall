<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>Reports</title>
 
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="/resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/resource/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/resource/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="/resource/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/cropper/cropper.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/switchery/switchery.css" rel="stylesheet">
    <link href="/resource/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="/resource/css/plugins/nouslider/jquery.nouislider.css" rel="stylesheet">
    <link href="/resource/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="/resource/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="/resource/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="/resource/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="/resource/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="/resource/css/animate.min.css" rel="stylesheet">
    <link href="/resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>

<body class="gray-bg">

      <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>今日流量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>浏览数(PV)</th>
                                    <th>访客数(UV)</th>
                                    <th>IP数</th>                                  
                                    <th>平均时长</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>今日</td>
                                    <td class="center" id="dayPV"></td>
                                    <td class="center" id="dayUV"></td>
                                    <td class="center" id="dayIP"></td>                                  
                                    <td class="center" id="dayTime"></td>
                                </tr>
                               	<tr>
                                    <td>昨日</td>
                                    <td class="center" id="yesterdayPV"></td>
                                    <td class="center" id="yesterdayUV"></td>
                                    <td class="center" id="yesterdayIP"></td>                                  
                                    <td class="center" id="yesterdayTime"></td>
                                </tr>
                            </tbody>
                        </table>     
                    </div>
                </div>
            </div>
		</div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>浏览量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    &nbsp;&nbsp; &nbsp; 
	                   <div class="btn-group">
                            <button class="btn btn-outline btn-info active">浏览量(PV)</button> 
                        </div>
                       
                        <div class="echarts" id="line"></div>
                       
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
               <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>访问量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    &nbsp;&nbsp; &nbsp; 
	                   <div class="btn-group">
                            <button class="btn btn-outline btn-info active">访问量(UV)</button> 
                        </div>
                       
                        <div class="echarts" id="lineUV"></div>
                       
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>地域分布</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">                  
                        <div class="echarts" id="map"></div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="row" sytle="height:500px;">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>地域分布</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-scatter-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>地域分布</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="map"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>饼状图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-pie-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>雷达图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-radar-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>和弦图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-chord-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>仪表盘</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-gauge-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>漏斗图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-funnel-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>力导向布局图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-force-chart"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>中国地图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div style="height:600px" id="echarts-map-chart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="/resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/resource/js/plugins/echarts/echarts.min.js"></script>
    <script src="/resource/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!-- 
    	今日概况
     -->
    <script type="text/javascript">
	    $(document).ready(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/report/overview.action",
				type:"GET",
				success:function(result){
					/* console.log(result); */
					$("#dayPV").html(result.body.data[0].result.items[1][1][0]);
					$("#dayUV").html(result.body.data[0].result.items[1][1][1]);
					$("#dayIP").html(result.body.data[0].result.items[1][1][2]);
					
					if(result.body.data[0].result.items[1][1][3]=="--"){
						$("#dayTime").html("--");
					}else{
						$("#dayTime").html(formatTime(result.body.data[0].result.items[1][1][3]));
					}
					
					$("#yesterdayPV").html(result.body.data[0].result.items[1][0][0]);
					$("#yesterdayUV").html(result.body.data[0].result.items[1][0][1]);
					$("#yesterdayIP").html(result.body.data[0].result.items[1][0][2]);
					if(result.body.data[0].result.items[1][0][3]=="--"){
						$("#yesterdayTime").html("--");
					}else{
						$("#yesterdayTime").html(formatTime(result.body.data[0].result.items[1][0][3]));
					}
						
				}
			});
		});
	    
	    function formatTime(seconds) {
	        return [
	            parseInt(seconds / 60 / 60),
	            parseInt(seconds / 60 % 60),
	            parseInt(seconds % 60)
	        ]
	            .join(":")
	            .replace(/\b(\d)\b/g, "0$1");
	    }
    </script>
    <!-- 
    	趋势图
     -->
     <script type="text/javascript">
		 var myChart = echarts.init(document.getElementById('line'));
		 var myChartUV = echarts.init(document.getElementById('lineUV'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            tooltip: {
           	 trigger: 'axis'
            },
            legend:{
            	data:['今日PV','昨日PV']
            },
            xAxis: {
                data: [],
                axisLine: {
					show:false,
              	 },
              	 axisTick:{
              		show:false,
              },
              axisLabel:{
           	   interval:4
              }
            },
            yAxis: {
				axisLine: {
					show:false,
              },
              axisTick:{
              		show:false,
              },
              splitNumber:4
            },
            grid:{
           	left:30,
           	right:20,
           	top:50,
           	bottom:20,
            },
            series: [{
                name: '今日PV',
                type: 'line',
                smooth:true,
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#3cB371',
	                    areaStyle:{
	                    	type:'default'
	                    }
	                } 
	             }
            },
            {
                name: '昨日PV',
                type: 'line',
                smooth:true,
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#1c84c6',
	                    /* areaStyle:{
	                    	type:'default'
	                    } */
	                } 
	             }
            }
            ]
        });
        
        //访问量UV
        myChartUV.setOption({
            tooltip: {
           	 trigger: 'axis'
            },
            legend:{
            	data:['今日UV','昨日UV']
            },
            xAxis: {
                data: [],
                axisLine: {
					show:false,
              	 },
              	 axisTick:{
              		show:false,
              },
              axisLabel:{
           	   interval:4
              }
            },
            yAxis: {
				axisLine: {
					show:false,
              },
              axisTick:{
              		show:false,
              },
              splitNumber:4
            },
            grid:{
           	left:30,
           	right:20,
           	top:50,
           	bottom:20,
            },
            series: [{
                name: '今日UV',
                type: 'line',
               /*  smooth:true, */
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#D2691E',
	                    areaStyle:{
	                    	type:'default'
	                    }
	                } 
	             }
            },
            {
                name: '昨日UV',
                type: 'line',
               /*  smooth:true, */
                data: [],
	             itemStyle: {
	                normal: {
	                    color: '#EE4000',
	                    /* areaStyle:{
	                    	type:'default'
	                    } */
	                } 
	             }
            }
            ]
        });
        
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        myChartUV.showLoading();
        
        var nums=[];    
   		var day=[];   				
		var yesterday=[];
		
		var numsUV=[];      				
		var yesterdayUV=[];
   		
        $.ajax({
        	type : "GET",
        	async : true,//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        	url : "${pageContext.request.contextPath}/report/trend.action",
        	success : function(result){
        		console.log(result);
        		var a= result.extend.data[0].body.data[0].result.items[1].length-1;
        		for(var i=23;i>=0;i--){
        			if( a>=0 && result.extend.data[0].body.data[0].result.items[1][a][0]>0){
        				nums.push(result.extend.data[0].body.data[0].result.items[1][a][0]);
        				numsUV.push(result.extend.data[0].body.data[0].result.items[1][a][1]);
        				a=a-1;
        			}else if(typeof(result.extend.data[0].body.data[0].result.items[1][i])=="undefined"&&isNaN(result.extend.data[0].body.data[0].result.items[1][i])&&!result.extend.data[0].body.data[0].result.items[1][i] ){
        				nums.push(0);
        				numsUV.push(0);
        				a=a-1;
        			}else{
        				nums.push(0);
        				numsUV.push(0);
        				a=a-1;
        			}  			       				
        		}
        		$.each(result.extend.data[1].body.data[0].result.items[1],function(index,item){
        			if(item[0]>0){
        				yesterday.push(item[0]);
        				yesterdayUV.push(item[1]);
        			}else{
        				yesterday.push(0);
        				yesterdayUV.push(0);
        			}
        		});
        			
        		
        		for(var j=0;j<24;j++){	
        			day.push(j);			
        		} 

        		myChart.hideLoading();
        		myChartUV.hideLoading();  //隐藏加载动画
        		myChart.setOption({        //加载数据图表
                xAxis: {
                     data: day
                	}, 
                series: [
                         {
                           // 根据名字对应到相应的系列
                   name: '今日PV',
                   data: nums
                          /*  .reverse() */
                       },
                       {
                    name:'昨日PV',
                    data:yesterday.reverse()
                       }
                ]
        		});
        		
        		myChartUV.setOption({        //加载数据图表
                    xAxis: {
                         data: day
                    	}, 
                    series: [
                             {
                               // 根据名字对应到相应的系列
                       name: '今日UV',
                       data: numsUV
                              /*  .reverse() */
                           },
                           {
                        name:'昨日UV',
                        data:yesterdayUV.reverse()
                           }
                    ]
            		});
            
       		 },
        	 error:function(errorMsg) {
            //请求失败时执行该函数
	         alert("图表请求数据失败!");
	         	myChart.hideLoading();
	         	myChartUV.hideLoading();
	         }
	});
    </script>
     <!-- 
     	map
      -->
   	<script type="text/javascript">
   	var eChart = echarts.init(document.getElementById('map'));
   	
	eChart.showLoading();
	//ajax请求数据
	var area=[];    //类别数组（实际用来盛放X轴坐标值）
    var arrayPV = new Array();
    var arrayZB = new Array();
	
	$.ajax({
		type: "get",
		async: true, //异步执行
		url: "${pageContext.request.contextPath }/report/area.action",
/* 		data:{}, */
		dataType: "json", //返回数据形式为json
		success: function (result) {
			console.log(result);
			$.each(result.body.data[0].result.item[0],function(index,item){
				area.push(item);
			});
			for(var i =0;i<result.body.data[0].result.item[1].length;i++){
				arrayPV[i]={
					name:'浏览量',
					value:result.body.data[0].result.item[1][i]
				};
			}
			for(var i =0;i<result.body.data[0].result.item[1].length;i++){
				arrayZB[i]={
					name:'浏览量',
					value:result.body.data[0].result.item[1][i]
				};
			}

		},
		error: function (errorMsg) {
			alert("请求失败!");
		}
		});

	
	
	eChart.setOption({
		 
		     tooltip: {
		         trigger: 'item',
		         formatter: "{a} <br/>{b} : {c}万吨" 
		     },

		     dataRange: {
		         min: 0,
		         max: 4000,
		         x: 'left',
		         y: 'bottom',
		       
		         text: ['高', '低'], // 文本，默认为数值文本
		         calculable: false,

		         splitNumber: 0,


		         color: ['orangered', 'gold','yellow', 'green', 'lightgreen', 'lightgrey']
		     },
		     toolbox: {
		         show: true,
		         orient: 'vertical',
		         x: 'right',
		         y: 'center',
		         feature: {
		             mark: {
		                 show: true
		             },
		             dataView: {
		                 show: true,
		                 readOnly: false
		             },
		             dataZoom: {
		                 show: true
		             },
		             restore: {
		                 show: true
		             },
		             saveAsImage: {
		                 show: true
		             }
		         }
		     },
		     roamController: {
		         show: true,
		         x: 'right',
		         mapTypeControl: {
		             'china': true
		         }
		     },
		     series: [{
		         name: 'value',
		         type: 'map',
		         mapType: 'china',
		         roam: true,
		         itemStyle: {
		             normal: {
		                 label: {
		                     show: true
		                 }
		             },
		             emphasis: {
		                 label: {
		                     show: true
		                 }
		             }
		         },
		         data: [
		    {name: '黑龙江', value: 3544.1},
		    {name: '吉林', value: 2805.7},
		    {name: '内蒙古', value: 2250.8},
		    {name: '山东', value: 2050.9},
		    {name: '河南', value: 1853.7},
		    {name: '河北', value: 1670.4},
		    {name: '辽宁', value: 1403.5},
		    {name: '山西', value: 862.7},
		    {name: '四川', value: 765.7},
		    {name: '云南', value: 747.3},
		    {name: '新疆', value: 705.1},
		    {name: '甘肃', value: 577.2},
		    {name: '陕西', value: 543.1},
		    {name: '安徽', value: 496.3},
		    {name: '湖北', value: 332.9},
		    {name: '贵州', value: 324.1},
		    {name: '广西', value: 280.7},
		    {name: '重庆', value: 259.7},
		    {name: '江苏', value: 252.2},
		    {name: '宁夏', value: 226.9},
		    {name: '湖南', value: 188.8},
		    {name: '天津', value: 107.3},
		    {name: '广东', value: 77.9},
		    {name: '北京', value: 49.4},
		    {name: '浙江', value: 31.1},
		    {name: '福建', value: 21.5},
		    {name: '青海', value: 18.6},
		    {name: '江西', value: 12.8},
		    {name: '上海', value: 2.1},
		    {name: '西藏', value: 0.8},
		    {name: '海南', value: '-'}
		]
		         
		     }, ]
		     
	});
	eChart.hideLoading();
	
  		
   	</script>
    
</body>

</html>