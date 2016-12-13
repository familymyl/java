<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/alljs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>题目编辑</title>

<style type="text/css">
	
</style>
</head>
<body class="easyui-layout">
	<form name="proForm" action="/test/question/addQuestion" method="post" id="proForm">
	<!-- 布局组件 -->
	  	<div data-options="region:'west',split:true," title="题目编辑" style="width:700px;">
	
		    <table align="center">
					<tr><td colspan="2"><h3>题目详情</h3></td></tr>
					<tr><td width="80px">题干</td></td><td>
						<textarea name="description" cols="100" rows="8" style="width:550px;height:200px;visibility:hidden;"id="desc"></textarea>
					<tr><td></td><td align="right"><input type="button" value="查看格式" id="preview"/></td></tr>
					
					<tr><td width="80px">难度</td><td> 
						简单<input type="radio" name="difficulty" value="1" checked="checked"/>
						一般<input type="radio" name="difficulty" value="2"/>
						困难<input type="radio" name="difficulty" value="3"/>
					</td></tr>
					<tr><td width="80px">进度</td><td><select id="schedule" name="name">
						<c:forEach items="${categorys }" var="cate">
							<option>${cate.name }</option>
						</c:forEach>
					</select></td></tr>
					<tr><td width="80px">选择</td><td>
							<input type="checkbox" id="choice" name="choice" value="1" />
						</td>
					</tr>
					<tr><td width="80px">简答</td>
						<td>
							<input type="checkbox" id="program" name="program" value="1"/>
						</td></tr>
					<tr><td width="80px" colspan="2" align="right"><input type="submit" id="programsubmit" value="提交完整题目"/></td></tr>
				</table>
		    
		    
		    <!-- 格式预览对话框  -->
	        <div id="formatPreview" class="easyui-dialog" title="格式预览" style="width:600px;height:800px;"   
	        data-options="closed:true,resizable:true,modal:true">  
	    		<table align="left">
	       			<tr><td id="showPreview"></td></tr>
	    		</table>  
			</div> 
		</div>
	  	<!-- 中间区域 -->
	  	<div data-options="region:'center'" class="easyui-tabs" data-options="fit:true" id="content">  

	  	</div>	
  	</form>
  	
  	
  	<script>
		KindEditor.ready(function(K) {
			var editor = K.create('textarea[name="description"]', {
				cssPath : '${root}/kindeditor/plugins/code/prettify.css',
				uploadJson : '${root}/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${root}/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			$("#preview").click(function(){
				$("#formatPreview").dialog("open");
				$("#showPreview").html(editor.html());
				prettyPrint();
			});
			
			
		});
		$(document).ready(function(){ 
			
			//添加选项卡
			$("#choice").click(function(){
				if($("#choice").is(":checked")) {
					addTab('编辑选择选项','icon-add', '/question/editChoice');
				}else{
					$("#content").tabs("close", "编辑选择选项");
				}
			}); 
			$("#program").click(function(){
				if($("#program").is(":checked")) {
					addTab('编辑编程答案','icon-add', '/question/editAnswer');
				}else{
					$("#content").tabs("close", "编辑编程答案");
				}
			});
		});
		
		
		
		
		//选项卡方法
		function addTab( name, icon, url) {
    		if($("#content").tabs("getTab", name) == null) {
	    		 // 新增选项卡
	    		 $("#content").tabs("add", {
	    		    title: name,
	    		    iconCls: icon,
	    		    href: "${root}"+url,
	    		    closable:true
	    		    
	    		 });
    		} else {
    		 	// 切换选项卡
    		 	$("#content").tabs("select", name);
    		}
    	}
	</script>
  	
  </body>

</html>