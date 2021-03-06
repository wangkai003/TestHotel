<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加房间</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/room/save">

            <input type="hidden" name="id" value="${room.id}">
            <div class="form-group">
                <div class="label">
                    <label>房间号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="name" value="${room.name}"
                           data-validate="required:请输入用户名"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>单价：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="price" value="${room.price}"
                           data-validate="required:请输入密码"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>床类型：</label>
                </div>
                <div class="field">
                    <select name="category" class="input w50">

                        <option value="1">精品单人床</option>
                        <option value="2">豪华双人床</option>
                        <option value="3">豪华单人床</option>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>

            <%--<div class="form-group">
                <div class="label">
                    <label>图片：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="image"
                           data-validate="required:请图片地址"/>
                    <div class="tips"></div>
                </div>
            </div>--%>



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
