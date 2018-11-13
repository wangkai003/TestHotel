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
<form method="post" action="/user/search" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">会员管理 </strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
       <%-- <li> <a class="button border-main icon-plus-square-o" href="/user/add"> 添加会员</a> </li>--%>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
         <button class="button win-print icon-print">
           打印</button>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>用户编号</th>
        <th>用户名</th>
        <th>电话号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th >操作</th>
      </tr>

       <c:forEach items="${list}" var="user">
         <tr>

           <td>${user.id}</td>
           <td>${user.username}</td>
           <td>${user.tel}</td>
           <td>${user.realname}</td>
           <td><font color="red">${user.age}</font>岁</td>
           <td><div class="button-group"> <a class="button border-main" href="<%=path%>/user/edit?id=${user.id}"><span class="icon-edit"></span> 修改</a>
             <a class="button border-red" href="/user/del?id=${user.id}"  ><span class="icon-trash-o"></span> 删除</a>
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
