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
<form method="post" action="/room/search" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">房间管理 </strong></div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <%-- <li> <a class="button border-main icon-plus-square-o" href="/user/add"> 添加会员</a> </li>--%>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="name" class="input"
                           style="width:250px; line-height:17px;display:inline-block"/>
                    <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()"> 搜索</a>
                </li>
                <button class="button win-print icon-print">
                    打印
                </button>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>房间编号</th>
                <th>房间名</th>
                <th>价格</th>
                <th>床型</th>
                <th>状态</th>
                <th>图片</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${list}" var="room">
                <tr>

                    <td>${room.id}</td>
                    <td>${room.name}</td>
                    <td>${room.price}</td>
                    <td>
                        <c:if test="${room.category eq 1}">精品单人床</c:if>
                        <c:if test="${room.category eq 2}">豪华双人床</c:if>
                        <c:if test="${room.category eq 3}">豪华单人床</c:if>
                    </td>
                    <td>
                        <c:if test="${room.status eq 0}"><font color="green">未入住</font></c:if>
                        <c:if test="${room.status eq 1}"><font color="red">已入住</font></c:if>
                    </td>
                    <td><img src="${room.image}" style="width: 150px;height: 120px"></td>
                    <td>
                        <div class="button-group">
                            <a class="button border-main"
                               href="<%=path%>/room/edit?id=${room.id}"><span
                                    class="icon-edit"></span> 修改</a>
                            <c:if test="${room.status eq 1}">
                                <a class="button border-green"
                                   href="<%=path%>/room/refond?id=${room.id}"><span
                                        class="icon-adjust"></span> 退房</a>
                            </c:if>
                            <a class="button border-red" href="/room/delete?id=${room.id}"><span
                                    class="icon-trash-o"></span> 删除</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

</form>
<script type="text/javascript">

    //搜索
    function changesearch() {

        $("#listform").submit();
    }

    //全选
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function delSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
            $("#listform").submit();
        }
        else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body>
</html>
