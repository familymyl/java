<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>抢答试卷管理</title>
    <style type="text/css">
	a {
		text-decoration: none;
	}
	</style>
	<%@include file="/common/alljs.jsp" %>
	
  </head>
  <body>
  	<table cellpadding="3" cellspacing="0" style="width:80%" align="center">
  		<tr><td align="center"><a href="${root }">返回主页面</a></td><td align="center"><a href="${root }/question/selectRacer">添加新试卷</a></td></tr>
  	</table>
  	<p align="center">试卷列表</p>
  	<table border="1" cellpadding="3" cellspacing="0" style="width:80%" align="center">
  		<tr><td align="center">试卷编号</td><td align="center">试卷信息</td>
  		<td align="center">创建时间</td><td align="center">开始</td></tr>
  		<c:forEach items="${racerList }" var="rl">
  		<form action="${root }/question/admin/${rl.id }" method="post">
  		<tr><td align="center">${rl.id }</td><td align="center"><a href="${root }/question/racerdetails/${rl.id }">${rl.information }</a></td>
  		<td align="center">${rl.date }</td><td align="center"><input type="submit" value="开始抢答"/></td></tr>
  		</form>
  		</c:forEach>
  		
  	</table>
	
	
  </body>
</html>