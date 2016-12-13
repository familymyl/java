<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/alljs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>试题</title>


</head>
<body class="easyui-layout" >

	<div data-options="region:'center',split:true," title="试题详情" ">
		<table id="dg1"></table>
		<div id="tb">
			<select id="schedule" name="name" class="easyui-combobox"
				style="width: 200px;">
				<c:forEach items="${categorys}" var="cate">
					<option id="${cate.id }">${cate.name }</option>
				</c:forEach>
			</select>
			<a href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-add'" onclick="doAdd()">新增</a> 
				<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="doDelete()">删除</a>
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="doUpdate()">修改</a>
			<a href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-back'" onclick="back()">返回主页面</a>
		</div>
	
	<!-- 查看完整题目对话框  -->
	<div id="morePreview" class="easyui-dialog" title="详情" style="width:600px;height:600px;"   
	        data-options="closed:true,resizable:true,modal:true">  
	    		<table align="left">
	       			<tr><td id="showMore"></td></tr>
	    		</table>  
			</div> 


	</div>
	


	<script>
		$("#dg1").datagrid({
			columns : [ [ {
				title : "",
				checkbox : true
			}, {
				title : "题号",
				field : "id",
				width : 50
			}, {
				title : "题干",
				field : "description",
				width : 600
			},{
					title : "查看详情",
					field : "more",
					width : 200,
					formatter : function(more, row, idx) {
						//return "<a href='${root}/question/"+row.id+"'>查看更多</a>";
						return "<input type='button' value='查看更多' id='more' onclick='lookMore("+row.id+")'/>";
					}}

			] ],
			idField : "id",
			url : "${root}/question/selectByCategory",
			fitColumns : true,
			pagination : true,
			striped : true,
			toolbar : "#tb",
			pageSize : 20,
			rownumbers : true,
			dndRow : true,
			singleSelect:true,
			checkOnSelect:true,
			onLoadSuccess: function(){
				prettyPrint();
			}
		});

		$("#schedule").combobox({
			onSelect : function() {
				var name = $('#schedule').combobox('getValue');
				$("#dg1").datagrid("load", {
					"name" : name
				});
				$("#dg1").datagrid('clearSelections');
			}
		});

		$("#dg1").datagrid("load", {
			"name" : $("#schedule").combobox('getValue')
		});
		
		function lookMore(row){
			//var row = $('#dg1').datagrid('getSelected');
			console.log(row);
			if(row!=null){
				$("#morePreview").dialog("open");
				$("#showMore").html("<iframe width='600px' height='600px' src='${root}/questiond/"+row+"'></iframe>");
				prettyPrint();
			}
		}
		function back(){
			window.location.href="${root}/index.jsp"
		}
		function doAdd(){
			window.location.href="${root}/question/editquestion"
		}
		function doDelete(){
			var row = $('#dg1').datagrid('getSelected');
			if(row==null){
				$.messager.alert("操作提示", "请选中需要删除的数据行！","warning");
			}else{
				$.get("${root }/question/questionDelete/"+row.id).success(function(json){
					if(json.rows==""){
						window.location.href="${root}/question/all";
					}else{
						$.messager.alert("操作提示", json.rows,"warning");
					}
					
				});
			}
		}
		function doUpdate(){
			var row = $('#dg1').datagrid('getSelected');
			if(row==null){
				$.messager.alert("操作提示", "请选中需要修改的数据行！","warning");
			}else{
				window.location.href= "${root}/question/questionUpdate/"+row.id;
			}
			
		}
		
	</script>

</body>

</html>