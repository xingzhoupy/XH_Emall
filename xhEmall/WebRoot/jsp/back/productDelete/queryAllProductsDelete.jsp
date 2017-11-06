<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品回收站管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="favicon.ico"> 
    <link href="resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="resource/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="resource/css/animate.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商品信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a  id="flash">
                                <i class="fa fa-refresh"></i>
                            </a>
                           
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead >
                                <tr>
                                	<th class="text-center">ID</th>
                                    <th class="text-center">名称</th>
                               		<th class="text-center">图片</th>
                                    <th class="text-center">定价</th>
                                    <th class="text-center">售价</th>                           
                                    <th class="text-center">品牌</th>                           
                                    <th class="text-center">大小</th>
                                    <th class="text-center">单位</th>
                                    <th class="text-center">折扣</th>
                                    <th class="text-center">操作</th>
                                </tr>
                            </thead>
                            <tbody id="table_data" class="text-center">             
                             <c:forEach items="${products }" var="product">
							    	<tr>
							    		<td>${product.pid }</td>
							    		<td>${product.pname }</td>
							    		<td>
							    			<a class="fancybox" href="${pageContext.request.contextPath }/upload/${product.pimg}" title="">
					                            <img style="width:100px;height:80px"; src="${pageContext.request.contextPath }/upload/${product.pimg}" />
					                        </a>
							    		</td>							    	
							    		<td>${product.pprice }</td>
							    		<td>${product.psale }</td>
							    		<td>${product.brand.brandname }</td>
							    		<td>${product.psize }</td>
							    		<td>${product.punit }</td>
							    		<td>${product.pdiscount }</td>
							    		
							    		<td class="text-center">	
							    			<div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
		                                    <button onclick="btn1(${product.pid })" type="button" class="btn btn-outline btn-default">
		                                        <i class="glyphicon glyphicon-search" aria-hidden="true"></i>
		                                    </button>
		                                    <button onclick="btn2(${product.pid })" type="button" class="btn btn-outline btn-default">
		                                        <i class="fa fa-undo" aria-hidden="true"></i>
		                                    </button>
		                                    <button onclick="btn3(${product.pid })" type="button" class="btn btn-outline btn-default">
		                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
		                                    </button>
		                                </div>
							    		</td> 						    									    									    		
							    	</tr>
    							</c:forEach> 
                            </tbody>                     
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <script src="resource/js/jquery.min.js?v=2.1.4"></script>
    <script src="resource/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="resource/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="resource/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="resource/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="resource/js/content.min.js?v=1.0.0"></script>
    
    <script>
        $(document).ready(function(){       	
        	$(".dataTables-example").dataTable();
        var oTable=$("#editable").dataTable();
        oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);
        oTable.fnUpdate(sValue,aPos[0],aPos[1]);},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("allUser.userid"),"column":oTable.fnGetPosition(this)[2]};},"width":"90%","height":"100%"});});
        function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"]);};
    </script>
    
    <script type="text/javascript" 
    src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8">
    </script>
    
    <!-- 
    	单选删除按钮
     -->
    <script type="text/javascript">
    /*
    	刷新按钮
    */
    $("#flash").on("click",function(){
    	 window.location.href="${pageContext.request.contextPath }/product/queryAllProductsDelete.action";  	
    });
    
    /* 查看单个商品信息 */
    
   function btn1(id){
    	
	   window.location.href="${pageContext.request.contextPath }/jsp/back/product/productInfo.jsp?id="+id;
  		  
    }
   
 
    /* 时间格式转换 */
    function fmtDate(obj){
	    var date =  new Date(obj);
	    var y = 1900+date.getYear();
	    var m = "0"+(date.getMonth()+1);
	    var d = "0"+date.getDate();
	    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
	} 
    
	/* 点击删除 */
	function btn3(id){
		if(!confirm("该商品商品删除就没有了，你确定删除吗？")){
	 		   return false;
	 	   }else{
	 		   $.ajax({
	 			   url:"${pageContext.request.contextPath }/product/delectProduct.action?id="+id,
	 			   type:"GET",
	 			   success:function(result){
	 					   if(result.code==100){
	 						   alert("删除成功！");
	 						  window.location.href="${pageContext.request.contextPath }/product/queryAllProductsDelete.action";
	 					   }else{
	 						  alert("删除失败！");
	 					   }
	  
	 			   }
	 			   
	 		   });
	 	   }
	}
	
	/**
	*点击回退，还原商品
	*/
	
	function btn2(id){ 
		if(!confirm("确定回滚改商品吗？")){
			return false;
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath }/product/updateDelete.action?id="+id,
				type:"GET",
				success:function(result){
					if(result.code==100){
						alert("回滚成功！");
						window.location.href="${pageContext.request.contextPath }/product/queryAllProductsDelete.action";
					}else{
						alert("回滚失败！");
					}
				}
			});			
		}
		 			   	 			 
	}	  
    </script>
</body>

</html>