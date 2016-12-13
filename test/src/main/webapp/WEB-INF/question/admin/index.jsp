<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>抢答试题主页面</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/prettify.js"></script>
	<link href="js/prettify.css" type="../text/css" rel="stylesheet">
	<style type="text/css">
	/* desert scheme ported from vim to google prettify */
	pre.prettyprint { display: block; background-color: #333 }
	pre .nocode { background-color: none; color: #000 }
	pre .str { color: #ffa0a0 } /* string  - pink */
	pre .kwd { color: #f0e68c; font-weight: bold }
	pre .com { color: #87ceeb } /* comment - skyblue */
	pre .typ { color: #98fb98 } /* type    - lightgreen */
	pre .lit { color: #cd5c5c } /* literal - darkred */
	pre .pun { color: #fff }    /* punctuation */
	pre .pln { color: #fff }    /* plaintext */
	pre .tag { color: #f0e68c; font-weight: bold } /* html/xml tag    - lightyellow */
	pre .atn { color: #bdb76b; font-weight: bold } /* attribute name  - khaki */
	pre .atv { color: #ffa0a0 } /* attribute value - pink */
	pre .dec { color: #98fb98 } /* decimal         - lightgreen */
	
	/* Specify class=linenums on a pre to get line numbering */
	ol.linenums { margin-top: 0; margin-bottom: 0; color: #AEAEAE } /* IE indents via margin-left */
	li.L0,li.L1,li.L2,li.L3,li.L5,li.L6,li.L7,li.L8,li.L9 { list-style-type: decimal !important }
	/* Alternate shading for lines */
	li.L1,li.L3,li.L5,li.L7,li.L9 { background-color: transparent; }
	pre { font-size:1.5em; }
	.answer { visibility: hidden;}
	.show { visibility:visible; }
	.center { text-align: center; }
	.q { display: none;}
	.c{ background-color:lightgreen; width:100%;height:30px;
		text-align:center;line-height:30px; font-family:微软雅黑; font-size:16px;}
	.win,.s{ background-color:blue;color:white;}
	.r{ background-color:red;color:white;}
	.row { margin-bottom:2px; }
	.c .form-control {float:none;}
	.c .input-group-btn {font-size:20px;}
	</style>
	<%@include file="/common/alljs.jsp" %>
  </head>
  <body onload="prettyPrint()">
    <div class="container-fluid">
    	<div class="row q">
		<div class="col-lg-12 col-sm-12 col-xs-12 center">
			<h1><input type="button" class="btn btn-primary btn-lg next" value="开始"/></h1>
		</div>
	</div>
	
	
	
	<c:forEach items="${racerWithQuestionAll }" var="rqa" varStatus="start">
		<div class="row q">
		<div class="col-lg-12 col-sm-12 col-xs-12">
		<h2>${rqa.racerWithQuestion.question.description }</h2>
		<c:if test="${!empty rqa.choiceWithOption }">
			<c:forEach items="${rqa.choiceWithOption }" var="cwo">
			<h3>${cwo.options } </h3>
			</c:forEach>
		</c:if> 
		<c:if test="${empty rqa.choiceWithOption ==null}">
			
		</c:if> 
		<!-- 按钮 -->
		<c:if test="${rqa.racerWithQuestion.race==false }">
		<h3>
			<input type="button" class="btn btn-primary show-answer" value="查看答案"/>
			<c:if test="${!start.last }">
				<input type="button" class="btn btn-default next" value="下一题"/>
			</c:if>
		</h3>
		</c:if>
		<c:if test="${rqa.racerWithQuestion.race==true }">
		<h3>
			<input type="button" class="btn btn-primary show-answer" value="查看答案"/>
			<c:if test="${!start.last }">
				<input type="button" class="btn btn-default next" value="下一题"/>
			</c:if>
			<input type="button" class="btn btn-success race" value="抢答"/>
		</h3>
		</c:if>
		

	<c:if test="${rqa.choiceWithAnswer!=null }">
		<h3 class="answer">答案:${rqa.choiceWithAnswer.answer }</h3>
	</c:if>
	<c:if test="${rqa.choiceWithAnswer==null }">
		<h3 class="answer">答案:${rqa.programWithAnswer.answer }</h3>
	</c:if>

		</div>
	</div>
	</c:forEach>
	
	
	
	
	<div class="row">
			<div class="col-lg-12 col-sm-12 col-xs-12"><hr/></div>
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
    <script src="js/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script>
    $(".show-answer").click(function(){
    	$(this).parent().next("h3").addClass("show");
    });
    $(".next").click(function(){
    	$(".c").removeClass("win");
    	var $q = $(this).parents(".q");
    	$q.hide();
    	var n = $q.index(".q")+1;
    	var nextpage = window.location.href.replace(/#.+/,"") + "#" + n;
    	$(".q:eq("+n+")").show();
    	history.pushState({},"title");
    	history.replaceState({n:n},"title",nextpage);
    });
    window.onpopstate = function(event){    	
    	if(event.state && event.state.n){
    		var n = event.state.n;
    		$(".q:eq("+(n+1)+")").hide();
    		$(".q:eq("+n+")").show();
    	}
    }
    
	$.get("${pageContext.request.contextPath}/admin/all").success(function(json){
		var $c = $(".c");
		$c.each(function(idx, dom){
			if(json[idx]){
				$(dom).text(json[idx].name);
			}
		});
	});
	
	$(".race").click(function(){
		$(".c").removeClass("win");
		$btn = $(this);
		$btn.prop("disabled", true);
		$.get("${pageContext.request.contextPath}/admin/begin").success(function(user){
			$(".c:eq("+user.index+")").addClass("win");
		}).complete(function(){
			//$btn.removeAttr("disabled");
			$btn.prop("disabled", false);
		});
	});

	$(function(){
		var h = window.location.hash;
		if(!h || h == "#0"){
			$(".q:eq(0)").show();
		} else {
			$(".q:eq("+h.replace("#","")+")").show();
		}
	});
	</script>
  </body>
</html>