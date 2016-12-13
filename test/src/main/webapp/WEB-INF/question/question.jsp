<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题目详情</title>
<%@include file="/common/alljs.jsp" %>
<style type="text/css">
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<table align="center" width="90%">
		<tr><td><h4><h3>题目详情</h3></h4></td></tr>
		<tr><td>题目难度:
			<c:if test="${question.difficulty==1}">简单</c:if>
		<c:if test="${question.difficulty==2}">一般</c:if>
		<c:if test="${question.difficulty==3}">困难</c:if>
		</td></tr>
		<tr><td>课程进度:${question.category.name}</td></tr>
		<tr><td><h4>第${question.id}题</h4></td></tr>
		<tr><td>${question.description}</td></tr>
		<tr><td><br/></td></tr>
		<c:forEach items="${options }" var="o">
		<tr><td>${o.options }</td></tr>
		<br/>
		</c:forEach>
		<tr><td><br/></td></tr>
		
		<c:if test="${cwAnswer.answer!=null }"><tr><td>选择答案：${cwAnswer.answer }</td></tr></c:if>
		
		<c:if test="${pwAnswer.answer!=null }"><tr><td>简答答案：${pwAnswer.answer }</td></tr></c:if>
	<tr><td><a href="${root }/question/questionUpdate/${question.id}">修改试题</a></td></tr>
	<c:if test="${can }">	
		<tr><td><a href="${root }/question/questionDelete/${question.id}">删除试题</a></td></tr>
	</c:if>
	<tr><td><a href="${root }/question/editquestion">继续添加试题</a></td></tr>
	<tr><td><a href="${root }">返回主页面</a></td></tr>
	</table>
	
	<script type="text/javascript">
	$(document).ready(function(){ 
		prettyPrint();
		
	});
	
	</script>
</body>

<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
</html>