<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/alljs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>试卷详情页</title>



</head>
<body class="easyui-layout">

	<div data-options="region:'center',split:true," title="请选择题目" style="width: 670px;">
		<table id="dg1"></table>
		<div id="tb">
			<select id="schedule" name="name" class="easyui-combobox"
				style="width: 200px;">
				<c:forEach items="${categorys}" var="cate">
					<option id="${cate.id }">${cate.name }</option>
				</c:forEach>
			</select> <a href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-add'" onclick="doAdd()">添加至右侧</a>
				<a href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-back'" onclick="goback()">返回上一级</a>
		</div>
		
	<div id="morePreview" class="easyui-dialog" title="详情" style="width:600px;height:600px;"   
	        data-options="closed:true,resizable:true,modal:true">  
	    		<table align="left">
	       			<tr><td id="showMore"></td></tr>
	    		</table>  
			</div> 

	</div>
	<!-- 中间区域 -->
	<div data-options="region:'east',split:true," title="已选择题目列表"
		style="width: 700px;">
		<table id="dg2"></table>

		<div id="tb2">
			<select id="information" name="iname" class="easyui-combobox"
				style="width: 200px;">
				<c:forEach items="${racerList}" var="racer">
					<c:if test="${racer.id==racerId }">
						<option id="${racer.id }" selected="selected">${racer.information }</option>
					</c:if>
					<c:if test="${racer.id!=racerId }">
						<option id="${racer.id }">${racer.information }</option>
					</c:if>
				</c:forEach>
			</select> <a href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-remove'"
				onclick="doDeleteRacer()">删除该试卷</a> <a href="#"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-remove'" onclick="doDelete()">移除选中题</a>
			<a class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-save'" onclick="doSubmit()">
				提交修改 </a>
		</div>
	</div>

	<script>
		
	  	$("#dg1").datagrid({
    		columns:[[
    			{title:"",checkbox:true},
    			{title:"题号", field:"id", width:50},
    			{title:"题干", field: "description", width:600},
    			{
					title : "查看详情",
					field : "more",
					width : 230,
					formatter : function(more, row, idx) {
						//return "<a href='${root}/question/"+row.id+"'>查看更多</a>";
						return "<input type='button' value='双击查看更多' id='more' onclick='lookMore()'/>";
					}}
    		]],
    		idField:"id",
    		url:"${root}/question/selectByCategory",
    		fitColumns:true,
    		pagination:true,
    		striped:true,
    		toolbar: "#tb",
    		pageSize:20,
    		rownumbers: true,
    		dndRow:true,
    		onLoadSuccess: function(){
    			$.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);
				prettyPrint();
			}
    	});
		
		$("#schedule").combobox({
			onSelect: function(){
				var name = $('#schedule').combobox('getValue');
		    	$("#dg1").datagrid("load", { "name": name});
		    	$("#dg1").datagrid('clearSelections');
			}
		});
		
		$("#dg1").datagrid("load", { "name": $("#schedule").combobox('getValue')});
		
		$("#dg2").datagrid({
    		columns:[[
    			{title:"",checkbox:true},
    			{title : "题号",
    				field : "id",
    				width : 150,
    				formatter : function(value, row) {
    					//console.log(row);查看所在列对象属性
    					return row.question.id;
    				}},
        			{title : "题干",
        				field : "description",
        				width : 650,
        				formatter : function(value, row) {
        					return row.question.description;
        				}},
    			{title:"可做抢答", field:"race", width: 230,
        				formatter: function(value, row) {
        					var c = value?"checked":"";
        					return "<input type='checkbox'  name='race' class='yon' "+c+">";
        					
        				}
    				
    			}
    		]],
    		idField:"id",
    		fitColumns:true,
    		url:"${root}/question/selectByInformation",
    		striped:true,
    		toolbar: "#tb2",
    		rownumbers: true,
    		dndRow:true,
    		onLoadSuccess: function(){
    			$.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);
				prettyPrint();
			}
    	});
		 //抢答试卷根据试卷信息查询
		 
		$("#information").combobox({
			onSelect: function(){
				var iname = $('#information').combobox("getValue");
			    $("#dg2").datagrid("load", { "information": iname});
			    $("#dg2").datagrid('clearSelections');
			}
		});
	
		$("#dg2").datagrid("load", { "information": $('#information').combobox("getValue")});
		
		//添加到右侧方法
		function doAdd() {
			var q = $('#dg1').datagrid('getSelections');
			var sq = $('#dg2').datagrid('getRows');
			if(sq.length==0){
				for(var i=0;i<q.length;i++){
					$('#dg2').datagrid('appendRow',{
						question: {
							id:q[i].id,
							description:q[i].description
						},
						race: false
					});
				}
			}else{
				var a =[];
				for(var i=0;i<q.length;i++){
					var is = true;
					for(var j=0;j<sq.length;j++){
						if(q[i].id==sq[j].question.id){
							a.push(q[i].id);
							is = false;break;
						}
						prettyPrint();
					}
					if(is){
						$('#dg2').datagrid('appendRow',{
							question: {
								id:q[i].id,
								description:q[i].description
							},
							race: false
						});
						prettyPrint();
					}
					
				}
				if(a.length>0){
					$.messager.alert("操作提示:", "题目 "+a.join()+" 在该试卷已存在","warning");
				}
			}
		}
		function doDelete() {
			var dq = $('#dg2').datagrid('getSelections');
			for (var i = dq.length - 1; i >= 0; i--) {  
			    var index = $('#dg2').datagrid('getRowIndex',dq[i]);  
			    $('#dg2').datagrid('deleteRow', index);  
			}                  
		}
		
		function doDeleteRacer() {
			var information = $('#information').combobox('getValue');
			$.get('${root}/question/deleteRacer', "information="+information, function(){
				window.location.href = '${root}/question/testPaper';
			});
		}
		function doSubmit() {
			var dq = $('#dg2').datagrid('getRows');
			var information = $("#information").val();
			var params = [];
			var races = [];
			if (information == null || information == "") {
				$.messager.alert("操作提示", "请先填入试卷信息！","warning");
			} else {
				if (dq.length == 0) {
					$.messager.alert("操作提示", "请选择题目！","warning");
				} else {
					for (var i = 0; i < dq.length; i++) {
						params.push(dq[i].question.id);
					}
					var yons = $(".yon");
					for (var i = 0; i < yons.length; i++) {
						races.push(yons[i].checked);
					}
					
					$.get('${root}/question/racerUpdate', "information="
							+ information + "&id=" + params.join("&id=")
							+ "&race=" + races.join("&race="), function() {
						window.location.href = '${root}/question/testPaper';
					});
				}
			}
		}
		function lookMore(){
			var row = $('#dg1').datagrid('getSelected');
			if(row!=null){
				$("#morePreview").dialog("open");
				$("#showMore").html("<iframe width='600px' height='600px' src='${root}/questiond/"+row.id+"'></iframe>");
				prettyPrint();
			}
			
		}
		function goback(){
			window.history.back();
		}
		
	</script>
</body>

</html>