<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>账户安全</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="front/css/style.css" />

</head>
<body>
	<!--Begin Header Begin-->
	<div class="soubg">
		<div class="sou">
			<!--Begin 所在收货地区 Begin-->
			<span class="s_city_b">
				<span class="fl">送货至：</span>
				<span class="s_city">
					<span>四川</span>
					<div class="s_city_bg">
						<div class="s_city_t"></div>
						<div class="s_city_c">
							<h2>请选择所在的收货地区</h2>
							<table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0"
								cellpadding="0">
								<tr>
									<th>A</th>
									<td class="c_h">
										<span>安徽</span>
										<span>澳门</span>
									</td>
								</tr>
								<tr>
									<th>B</th>
									<td class="c_h">
										<span>北京</span>
									</td>
								</tr>
								<tr>
									<th>C</th>
									<td class="c_h">
										<span>重庆</span>
									</td>
								</tr>
								<tr>
									<th>F</th>
									<td class="c_h">
										<span>福建</span>
									</td>
								</tr>
								<tr>
									<th>G</th>
									<td class="c_h">
										<span>广东</span>
										<span>广西</span>
										<span>贵州</span>
										<span>甘肃</span>
									</td>
								</tr>
								<tr>
									<th>H</th>
									<td class="c_h">
										<span>河北</span>
										<span>河南</span>
										<span>黑龙江</span>
										<span>海南</span>
										<span>湖北</span>
										<span>湖南</span>
									</td>
								</tr>
								<tr>
									<th>J</th>
									<td class="c_h">
										<span>江苏</span>
										<span>吉林</span>
										<span>江西</span>
									</td>
								</tr>
								<tr>
									<th>L</th>
									<td class="c_h">
										<span>辽宁</span>
									</td>
								</tr>
								<tr>
									<th>N</th>
									<td class="c_h">
										<span>内蒙古</span>
										<span>宁夏</span>
									</td>
								</tr>
								<tr>
									<th>Q</th>
									<td class="c_h">
										<span>青海</span>
									</td>
								</tr>
								<tr>
									<th>S</th>
									<td class="c_h">
										<span>上海</span>
										<span>山东</span>
										<span>山西</span>
										<span class="c_check">四川</span>
										<span>陕西</span>
									</td>
								</tr>
								<tr>
									<th>T</th>
									<td class="c_h">
										<span>台湾</span>
										<span>天津</span>
									</td>
								</tr>
								<tr>
									<th>X</th>
									<td class="c_h">
										<span>西藏</span>
										<span>香港</span>
										<span>新疆</span>
									</td>
								</tr>
								<tr>
									<th>Y</th>
									<td class="c_h">
										<span>云南</span>
									</td>
								</tr>
								<tr>
									<th>Z</th>
									<td class="c_h">
										<span>浙江</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</span>
			</span>
			<!--End 所在收货地区 End-->
			<span class="fr">
				<span class="fl">
					<c:if test="${current_user == null }">
						你好，请
						<a href="front/Login.jsp">登录</a>
						&nbsp;
						<a href="front/Regist.jsp" style="color:#ff4e00;">免费注册</a>
					</c:if>
					<c:if test="${current_user != null}">
						欢迎您，<a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">${current_user.userphone }</a>
						&nbsp;|&nbsp;
						<a class="logout">退出登录</a>
						&nbsp;|&nbsp;
						</c:if>
						<c:if test="${current_user == null }">
						<a href="front/Login.jsp">我的订单</a>
						</c:if>
						<c:if test="${current_user != null }">
						<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid}">我的订单</a>
						</c:if>
						&nbsp;|
						<c:if test="${current_user == null }">
						<a href="front/Login.jsp">我的购物车</a>
						</c:if>
						<c:if test="${current_user != null }">
						<a href="${pageContext.request.contextPath }/trolley/findByUserCart.action">我的购物车</a>
						&nbsp;|
						</c:if>
				</span>
				<span class="ss">
					<div class="ss_list">
						<a href="#">收藏夹</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">我的收藏夹</a>
									</li>
									<li>
										<a href="#">我的收藏夹</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">客户服务</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">客户服务</a>
									</li>
									<li>
										<a href="#">客户服务</a>
									</li>
									<li>
										<a href="#">客户服务</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ss_list">
						<a href="#">网站导航</a>
						<div class="ss_list_bg">
							<div class="s_city_t"></div>
							<div class="ss_list_c">
								<ul>
									<li>
										<a href="#">网站导航</a>
									</li>
									<li>
										<a href="#">网站导航</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</span>
				<span class="fl">|&nbsp;关注我们：</span>
           		<span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
           		<span class="fr">|&nbsp;<a href="home/home.action">首页&nbsp;<img src="front/images/home.png" align="absmiddle" /></a></span>
			</span>
		</div>
	</div>
	<div class="m_top_bg">
		<div class="top">
			<div class="m_logo">
				<a href="home/home.action">
					<img src="front/images/logo1.png" />
				</a>
			</div>
			<div class="m_search">
				<form>
					<input type="text" value="" class="m_ipt" />
					<input type="submit" value="搜索" class="m_btn" />
				</form>
				<span class="fl">
					<a href="#">咖啡</a>
					<a href="#">iphone 6S</a>
					<a href="#">新鲜美食</a>
					<a href="#">蛋糕</a>
					<a href="#">日用品</a>
					<a href="#">连衣裙</a>
				</span>
			</div>
			<div class="i_car">
    	<div class="car_t">购物车 </div>
        <div class="car_bg">
       		<!--Begin 购物车未登录 Begin-->
       		<c:if test="${current_user == null }">
        	<div class="un_login">还未登录！<a href="front/Login.jsp" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
        	</c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <c:if test="${current_user!=null }">
            <ul class="cars" id="cart">
           
            
            <c:forEach items="${trolleyItem}" var="items">
            	<li>
            		<input type="hidden" id="falg" value="${falg}">
                	<div class="img"><a href="#"><img src="${pageContext.request.contextPath}${items.xhproduct.pimg}" width="58" height="58" /></a></div>
                    <div class="name"><a href="#">${items.xhproduct.pname}</a></div>
                    <div class="price"><font color="#ff4e00">￥${items.xhproduct.psale}</font> X${items.tronum}</div>
                </li>
               
                </c:forEach>
            </ul>
            <div class="price_a"><a href="${pageContext.request.contextPath}/trolley/findByUserCart.action">去购物车结算</a></div>
            </c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
		</div>
	</div>
	<jsp:include page="/front/head2.jsp" />
	<!--End Header End-->
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<div class="m_left">
				<div class="left_n">管理中心</div>
				<div class="left_m">
					<div class="left_m_t t_bg1">订单中心</div>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath }/frontOrder/queryOrderInfo.action?userid=${current_user.userid }">我的订单</a>
						</li>
						<li>
							<a href="Member_Address.html">收货地址</a>
						</li>
					</ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg2">会员中心</div>
					<ul>          
                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForDetail.action?id=${current_user.userid }">用户信息</a></li>
                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUserByIdForUpdate.action?id=${current_user.userid }">修改信息</a></li>
                    <li><a href="${pageContext.request.contextPath }/userCenter/queryUsermessageById.action?id=${current_user.userid }">我的留言</a></li>
                    <li><a href="${pageContext.request.contextPath }/userComment/queryCommentById.action?id=${current_user.userid }">我的评论</a></li>
                   	<li><a href="${pageContext.request.contextPath }/userCollect/queryAllCollect.action?id=${current_user.userid }">我的收藏</a></li>
                   </ul>
				</div>
				<div class="left_m">
					<div class="left_m_t t_bg3">账户中心</div>
					<ul>
						<li>
							<a href="Member_Safe.html" class="now">账户安全</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="m_right">
				<p></p>
				<div class="mem_tit">账户安全</div>
				<div class="m_des">
					<table border="0" style="width:880px;" cellspacing="0" cellpadding="0">
						<tr height="45">
							<td width="80" align="right">原手机 &nbsp; &nbsp;</td>
							<td>
								<input type="text" value="" class="add_ipt" style="width:180px;" id="phoneold"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="45">
							<td align="right">新手机 &nbsp; &nbsp;</td>
							<td>
								<input type="text" value="" class="add_ipt" style="width:180px;" id="phonenew"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="50">
							<td>&nbsp;</td>
							<td>
								<input type="submit" value="确认修改" class="btn_tj" id="phonemodify"/>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="m_des">
					<table border="0" style="width:880px;" cellspacing="0" cellpadding="0">
						<tr height="45">
							<td width="80" align="right">原密码 &nbsp; &nbsp;</td>
							<td>
								<input type="password" value="" class="add_ipt" style="width:180px;" id="pwdold"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="45">
							<td align="right">新密码 &nbsp; &nbsp;</td>
							<td>
								<input type="password" value="" class="add_ipt" style="width:180px;" id="pwdnew"/>
								&nbsp; <font color="#ff4e00">*</font>
							</td>
						</tr>
						<tr height="50">
							<td>&nbsp;</td>
							<td>
								<input type="submit" value="确认修改" class="btn_tj" id="pwdmodify"/>
							</td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
		<!--End 用户中心 End-->
		<!--Begin Footer Begin -->
		<div class="b_btm_bg b_btm_c">
			<div class="b_btm">
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b1.png" width="62" height="62" />
						</td>
						<td>
							<h2>正品保障</h2>
							正品行货 放心购买
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b2.png" width="62" height="62" />
						</td>
						<td>
							<h2>满38包邮</h2>
							满38包邮 免运费
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b3.png" width="62" height="62" />
						</td>
						<td>
							<h2>天天低价</h2>
							天天低价 畅选无忧
						</td>
					</tr>
				</table>
				<table border="0"
					style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;"
					cellspacing="0" cellpadding="0">
					<tr>
						<td width="72">
							<img src="front/images/b4.png" width="62" height="62" />
						</td>
						<td>
							<h2>准时送达</h2>
							收货时间由你做主
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="/front/foot.jsp"/>
		<!--End Footer End -->
	</div>

	<script type="text/javascript" src="resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="resource/layer/layer.js"></script>
	<script type="text/javascript" src="front/js/logout.js"></script>

	<script>
		$("#pwdmodify").click(function (){
			var pwdold = $("#pwdold").val();
			var pwdnew = $("#pwdnew").val();
			var ii = layer.load();
			$.ajax({
				url : "user/restPassword.action",
				data : {
					"passwordNew" : pwdnew,
					"passwordOld" : pwdold
				},
				type : "POST",
				success : function(result){
					console.log(result);
					layer.close(ii);
					layer.msg(result.msg);
				}
			});
		});
		$("#phonemodify").click(function (){
			var phoneold = $("#phoneold").val();
			var phonenew = $("#phonenew").val();
			var ii = layer.load();
			$.ajax({
				url : "user/restPhone.action",
				data : {
					"userphoneNew" : phonenew,
					"userphoneOld" : phoneold
				},
				type : "POST",
				success : function(result){
					console.log(result);
					layer.close(ii);
					layer.msg(result.msg);
				}
			});
		});
	</script>
	<script type="text/javascript" src="front/js/logout.js"></script>
</body>

</html>

