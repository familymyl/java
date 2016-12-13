<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/common/alljs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生页面</title>

    <!-- Bootstrap -->
    <link href="${root }/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		.c{ background-color:lightgreen; width:100%;height:90px;
			text-align:center;line-height:90px; font-family:微软雅黑; font-size:20px;}
		.s{ background-color:blue;color:white;}
		.r{ background-color:red;color:white;}
		.row { margin-bottom:5px; }
		.c .form-control {float:none;}
		.c .input-group-btn {font-size:20px;}
	</style>
  </head>
  <body>
     <div class="container-fluid">
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c"></div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c"></div></div>
			</div>
		</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${root }/js/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${root }/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		var $c = $(".c");
		$.get("${root}/sitdown").success(function(json){
			var current = json.current;
			if(current == null){
				alert("该座位被别人占了");
				return;
			}
			//console.log($c[current.index]);
			
			/* $c.each(function(){
				var $this = $(this);
				var idx = $this.index(".c");
				if(all[idx]) {
					$this.text(all[idx]["name"]);
				}
			}); */
			$($c[current.index]).html('<button id="race" class="btn btn-primary btn-lg" type="button">抢答</button>');
			
		});		
	});
	
	$("body").on("click", "#race", function(){
		$.get("${root}/race?ts="+new Date().getTime()).success(function(){});
	});
	</script>
  </body>
</html>