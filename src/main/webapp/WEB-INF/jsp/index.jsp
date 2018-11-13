<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--使用include命令引入公共页面 --%>
<%@include file="/comm/common.jsp"%>

<!DOCTYPE html>
<html lang="zh-cn">
	<head>
	    <base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title>酒店预定综合系统</title>
		<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
		<link rel="stylesheet" href="<%=path%>/css/admin.css">
		<script src="<%=path%>/js/jquery.js"></script>
	</head>
	<body style="background-color: #f2f9fd;">
		<div class="header bg-main">
			<div class="logo margin-big-left fadein-top">
				<h1>
					<img src="images/logo.jpg" class="radius-circle rotate-hover"
						height="50" alt="" />
					酒店预定综合系统
				</h1>
			</div>
			<div class="head-l">
				<a href="" target="_blank" style="color: #FFF"><span
					class="icon-user"></span> 欢迎 admin</a>&nbsp;&nbsp;
				<a class="button button-little bg-green" href="" target="_blank"><span
					class="icon-home"></span> 首页</a> &nbsp;&nbsp;
				<a class="button button-little bg-red" href="<%=path %>/logout"><span
					class="icon-power-off"></span> 退出登录</a>
			</div>
		</div>
		<div class="leftnav">
			<div class="leftnav-title">
				<strong><span class="icon-list"></span>菜单列表</strong>
			</div>


					<h2>
						<span class="icon-user"></span>用户管理
					</h2>
					<ul style="display: block">
						<li>
							<a href="/user/list" target="right"><span
									class="icon-caret-right"></span>用户列表</a>
						</li>
						<li>
							<a href="/user/add" target="right"><span
									class="icon-caret-right"></span>添加用户</a>
						</li>
					</ul>
					<h2>
						<span class="icon-pencil-square-o"></span>酒店房间管理
					</h2>
					<ul style="display: block">
						<li>
							<a href="/room/list" target="right"><span class="icon-caret-right"></span>房间列表</a>
						</li>
						<li>
							<a href="/room/add" target="right"><span class="icon-caret-right"></span>添加房间</a>
						</li>
					</ul>

					<h2>
						<span class="icon-align-center"></span>订单管理
					</h2>
					<ul style="display: block">
						<li>
							<a href="/hOrder/list" target="right"><span class="icon-caret-right"></span>订单列表</a>
						</li>

					</ul>


		</div>
		<script type="text/javascript">
	$(function() {
		$(".leftnav h2").click(function() {
			$(this).next().slideToggle(200);
			$(this).toggleClass("on");
		})
		$(".leftnav ul li a").click(function() {
			$("#a_leader_txt").text($(this).text());
			$(".leftnav ul li a").removeClass("on");
			$(this).addClass("on");
		})
	});
</script>
		<ul class="bread">
			<li>
				<a href="{:U('Index/info')}" target="right" class="icon-home">
					首页</a>
			</li>
			<li>
				<a href="##" id="a_leader_txt">欢迎界面</a>
			</li>
		</ul>
		<div class="admin">
			<iframe scrolling="auto" rameborder="0" src="/welcome"
				name="right" width="100%" height="100%"></iframe>
		</div>

	</body>
</html>
