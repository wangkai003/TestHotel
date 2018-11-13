<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/comm/common.jsp" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="<%=path %>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path %>/css/admin.css">
    <script src="<%=path %>/js/jquery.js"></script>
    <script src="<%=path %>/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>编辑用户</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/user/save">

            <input type="hidden" name="id" value="${user.id}">
            <div class="form-group">
                <div class="label">
                    <label>用户账号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${user.name}" name="name"
                           readonly/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>用户姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${user.realname}" name="realname"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>用户密码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${user.password}" name="password"
                           data-validate="required:请输入密码"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</body>
</html>
