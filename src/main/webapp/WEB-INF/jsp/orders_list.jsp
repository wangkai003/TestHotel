<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/comm/common.jsp" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
    <div class="panel-head"><strong class="icon-reorder">订单列表 </strong> </div>

    <table class="table table-hover text-center">
      <tr>
        <th>房间编号</th>
        <th>房间名</th>
        <th>价格</th>
        <th>床型</th>
        <th>客人</th>
        <th>图片</th>
        <th>下单日期</th>
        <th >操作</th>
      </tr>

       <c:forEach items="${list}" var="order">
         <tr>

           <td>${order.room.id}</td>
           <td>${order.room.name}</td>
           <td>￥<font color="red">${order.room.price}</font></td>
           <td>
             <c:if test="${order.room.category eq 1}">精品单人床</c:if>
             <c:if test="${order.room.category eq 2}">豪华双人床</c:if>
             <c:if test="${order.room.category eq 3}">豪华单人床</c:if>
           </td>
           <td>
             ${order.user.realname}
           </td>
           <td><img src="${order.room.image}" style="width: 150px;height: 120px"></td>
           <td><div class="button-group">
             <a class="button border-red" href="/hOrder/delete?id=${order.id}"  ><span class="icon-trash-o"></span> 删除</a>
           </div></td>
         </tr>
       </c:forEach>

    </table>
  </div>

</form>
<script type="text/javascript">

//搜索
function changesearch(){
	
 $("#listform").submit();
}
//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function delSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body>
</html>
