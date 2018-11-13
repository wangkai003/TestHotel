<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

	<head>
		<meta charset="utf-8">

		<link rel="stylesheet" href="/static/css/bootstrap.css">
		<link rel="stylesheet" href="/static/css/login.css" />
		<style>
			body{
				font-family: "华文细黑";
				background:url("/static/image/about_banner.jpg") no-repeat;
				background-size: 100%;
			}
		</style>
		<script src="/js/jquery.js"></script>

		<script>

			$(function () {
                if (${requestScope.type eq 1} ){
                    openLogin();
                } else {
                    openReg();
                }
            })
            function openLogin() {
                $("#regist_container").hide();
                $("#_close").show();
                $("#_start").animate({
                    left: '350px',
                    height: '480',
                    width: '400px'
                }, 500, function() {
                    $("#login_container").show(500);
                    $("#_close").animate({
                        height: '40px',
                        width: '40px'
                    }, 500);
                });
            }

            function openReg() {
                $("#login_container").hide();
                $("#_close").show();
                $("#_start").animate({
                    left: '350px',
                    height: '480',
                    width: '400px'
                }, 500, function() {
                    $("#regist_container").show(500);
                    $("#_close").animate({
                        height: '40px',
                        width: '40px'
                    }, 500);
                });
            }
			$(document).ready(function() {
				//关闭
				$("#_close").click(function() {
					
					$("#_close").animate({
						height: '0px',
						width: '0px'
					}, 500, function() {
						$("#_close").hide(500);
						$("#login_container").hide(500);
						$("#regist_container").hide(500);
						$("#_start").animate({
							left: '0px',
							height: '0px',
							width: '0px'
						}, 500);
					});
				});
                //去 注册
                $("#toRegist").click(function(){
                    $("#login_container").hide(500);
                    $("#regist_container").show(500);
                });
                //去 登录
                $("#toLogin").click(function(){
                    $("#regist_container").hide(500);
                    $("#login_container").show(500);
                });
			});
		</script>
	</head>

	<body>



		<!-- 会员登录  -->
		<!--<div id='Login_start' style="position: absolute;" >-->
		<div id='_start' style="margin-top: 80px;margin-bottom: 80px">
			<br/>
			<!--登录框-->
			<div id="login_container">
				<div id="lab1">
					<span id="lab_login">会员登录</span>
					<span id="lab_toRegist">
						&emsp;还没有账号&nbsp;
						<span id='toRegist' style="color: #EB9316;cursor: pointer;">立即注册</span>
					</span>
				</div>
				<div style="width:330px;">
					<span id="lab_type1">手机号/账号登陆</span>
				</div>
				<div id="form_container1">
					<br />
					<form method="post" id="loginForm" action="/web/login">
					<input type="text" class="form-control" name="username" placeholder="手机号/用户名" id="login_number" />
					<input type="password" class="form-control" placeholder="密码" name="password" id="login_password" />
					<input type="button" value="登录" class="btn btn-success" id="login_btn" />
					</form>
				</div>

			</div>
			<!-- 会员注册 -->
			<div id='regist_container' style="display: none;">
				<div id="lab1">
					<span id="lab_login">会员注册</span>
					<span id="lab_toLogin">
						&emsp;已有账号&nbsp;
						<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
					</span>
				</div>
				<div id="form_container2" style="padding-top: 25px;">
					<form method="post" id="regForm" action="/web/login">
					<input type="text" class="form-control" name="username"  placeholder="用户名" id="regist_account"/>
					<input type="password" name="password" class="form-control" placeholder="密码" id="regist_password1" />
					<input type="password" name="repassword" class="form-control" placeholder="确认密码" id="regist_password2" />
					<input type="text" class="form-control" name="tel" placeholder="手机号" id="regist_phone" />
					<input type="text" class="form-control" name="realname" placeholder="姓名" id="realname" />
					<input type="text" class="form-control" name="age" placeholder="年龄" id="age" />
					</form>
				</div>
				<input type="button" value="注册" class="btn btn-success" id="regist_btn" />
			</div>
		</div>

	</body>
	<script type="text/javascript">
		$(function () {
			$("#login_btn").click(function () {
				$.post("/web/login",$("#loginForm").serialize(),function (data) {
					if (data.code == 200){
					    alert("登陆成功");
					    location.href="/web/index";
					} else {
					    alert(data.message);
					}
                })
            })

            $("#regist_btn").click(function () {
                $.post("/web/reg",$("#regForm").serialize(),function (data) {
                    if (data.code == 200){
                        alert("注册成功");
                       openLogin();
                    } else {
                        alert("注册失败");
                    }
                })
            })
        })
	</script>

</html>