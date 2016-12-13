<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/alljs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>添加新试卷</title>


</head>
<body class="easyui-layout" >

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
	
	<!-- 查看完整题目对话框  -->
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
			<input type="text" placeholder="请输入试题信息：xx班抢答试题" size="25"
				id="information" onblur="checkInformation()" /><span id="message"
				style="color: red">请先填入试卷信息</span><br /> <a href="#"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-remove'" onclick="doDelete()">移除选中题</a>
			<a class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-save'" onclick="doSubmit()">
				提交 </a>
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
				width : 500
			},{
					title : "查看详情",
					field : "more",
					width : 230,
					formatter : function(more, row, idx) {
						//return "<a href='${root}/question/"+row.id+"'>查看更多</a>";
						return "<input type='button' value='双击查看更多' id='more' onclick='lookMore()'/>";
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
			onLoadSuccess: function(){
    			$.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);
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
		$("#dg2").datagrid({
			columns : [ [ {
				title : "",
				checkbox : true
			}, {
				title : "题号",
				field : "id",
				width : 150
			}, {
				title : "题干",
				field : "description",
				width : 650
			}, {
				title : "可做抢答",
				field : "yon",
				width : 230,
				formatter : function(yon, row, idx) {
					return "是:<input type='checkbox' name='race' class='yon'>";
				}
			} ] ],
			idField : "id",
			fitColumns : true,
			striped : true,
			toolbar : "#tb2",
			rownumbers : true,
			dndRow : true,
			onLoadSuccess: function(){
    			$.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);
				prettyPrint();
			}
		});

		function doAdd() {
			var information = $("#information").val();
			if (information == null || information == "") {
				$.messager.alert("操作提示", "请先填入试卷信息！","warning");
			} else {
				var message = $("#message").text();
				if (message == "该试卷名已存在") {
					$.messager.alert("操作提示", "请修改试卷信息！","warning");
				} else {
					var q = $('#dg1').datagrid('getSelections');
					var sq = $('#dg2').datagrid('getRows');
					if (sq.length == 0) {
						for (var i = 0; i < q.length; i++) {
							$('#dg2').datagrid('appendRow', {
								"id" : q[i].id,
								"description" : q[i].description
							});
							prettyPrint();
						}
					} else {
						var a = [];
						for (var i = 0; i < q.length; i++) {
							var is = true;
							for (var j = 0; j < sq.length; j++) {
								if (q[i].id == sq[j].id) {
									a.push(q[i].id);
									is = false;
									break;
								}
							}
							if (is) {
								$('#dg2').datagrid('appendRow', {
									"id" : q[i].id,
									"description" : q[i].description
								});
								prettyPrint();
							}
						}
						if(a.length>0){
							$.messager.alert("操作提示:", "题目 "+a.join()+" 在该试卷已存在","warning");
						}
					}
				}

			}
		}
		function doDelete() {
			var dq = $('#dg2').datagrid('getSelections');
			for (var i = dq.length - 1; i >= 0; i--) {
				var index = $('#dg2').datagrid('getRowIndex', dq[i]);
				$('#dg2').datagrid('deleteRow', index);
			}
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
					var message = $("#message").text();
					if (message == "该试卷名已存在") {
						$.messager.alert("操作提示", "请修改试卷信息！","warning");
					} else {
						for (var i = 0; i < dq.length; i++) {
							params.push(dq[i].id);
						}
						var yons = $(".yon");
						for (var i = 0; i < yons.length; i++) {
							races.push(yons[i].checked);
						}
						$.get('${root}/question/racer', "information="
								+ information + "&id=" + params.join("&id=")
								+ "&race=" + races.join("&race="), function() {
							window.location.href = '${root}/question/testPaper';
						});
					}
				}
			}
		}
		//ajax 异步验证试卷信息是否存在
		function checkInformation() {
			var information = $("#information").val();
			$.get('${root}/question/checkInformation', "information="
					+ information, function(json) {
				$("#message").text(json.rows);
			});

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