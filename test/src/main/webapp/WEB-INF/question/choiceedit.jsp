<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="/common/alljs.jsp" %>
	<title>选择选项及答案编辑</title>
	
	
</head>
<body>
<div id="main">
	<div id="left">
	<h2>编辑选项</h2>
	<input type="button" value="添加" id="addOption"/>
    <table id="tb1">
    		<tbody>
    		<tr>
    			<td><textarea name="options" class="del" rows="2" cols="20"></textarea></td>
    			<td><input type="button" value="删除"/></td>
    		</tr>
    		<tr>
    			<td><textarea name="options" class="del" rows="2" cols="20"></textarea></td>
    			<td><input type="button" value="删除"/></td>
    		</tr>
    		<tr>
    			<td><textarea  name="options" class="del" rows="2" cols="20"></textarea></td>
    			<td><input type="button" value="删除"/></td>
    		</tr>
    		<tr>
    			<td><textarea  name="options" class="del" rows="2" cols="20"></textarea></td>
    			<td><input type="button" value="删除"/></td>
    		</tr>
    		</tbody>
        </table>
 
	</div>
	<br/>
	<div id="right">
	<h2>编辑答案</h2>
     <table align="center">
            <tr><td align="right"><input type="text" name="cwhAnswer"/></td></tr>
      </table>
	</div>
</div>

	<script type="text/javascript">
	$(document).ready(function(){ 
    	$("#addOption").click(function(){
    		var $tbody = $("#tb1 tbody");
    		var tr = $("<tr></tr>");
    		var td1 = $('<td><textarea name="options" class="del" rows="2" cols="20"></textarea></td>');
    		var td2 = $('<td><input type="button" value="删除"/></td>');
    		tr.append(td1);
    		tr.append(td2);
    		$tbody.append(tr);
    	});
    	
    	$("#tb1").on("click", ":button", function(){
    		$(this).parents("tr").remove();
    	});
	});
	</script> 
</body>
</html>