<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="/common/alljs.jsp" %>
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
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-5 col-sm-5 col-xs-5">
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>
				<div class="col-lg-6 col-sm-6 col-xs-6"><div class="c">输入姓名</div></div>				
			</div>
			<div class="col-lg-1 col-sm-1 col-xs-1"></div>
			<div class="col-lg-6 col-sm-6 col-xs-6">
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
				<div class="col-lg-4 col-sm-4 col-xs-4"><div class="c">输入姓名</div></div>
			</div>
		</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${root }/js/jquery-1.9.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${root }/js/bootstrap.min.js"></script>
	<script>
	var $c = $(".c");
	// 添加单击事件
	$c.click(function(){
		var $this = $(this);
		if($this.text()=="输入姓名"){
			var idx = $this.index(".c");
			$this.html('<form action="${root}/register" method="post"><div class="col-lg-11"><div class="input-group">'+
					  '<input type="hidden" name="index" class="index" value="'+idx+'">'+
				      '<input type="text" name="name" class="form-control" placeholder="姓名">'+
		      '<span class="input-group-btn">'+
		        '<button class="btn btn-default" type="submit">确定</button>'+
		      '</span>'+
		    '</div></div></form>');
		}
		
	});
	
	var size = $c.length;
	/*计时因子*/
	var x = 1;
	/*递增因子*/
	var z = 0.1;
	/*最大间隔毫秒*/
	var maxTime = 400;
	/*被选中的div*/
	var current = null;
	/*开始程序*/
	function begin(){
		if(current!=null){
			current.removeClass("r");
		}
		setTimeout(runtab, Math.pow(2,x));
	}

	function runtab(){
		//清除上一次的选择
		if(current!=null){
			current.removeClass("s");
			current = null;
		}
		//随机选择行列
		current = $($c.get(parseInt(Math.random()*1000)%size)).addClass("s");
		//如果间隔时间不足maxTime，增加计时因子，重新选择
		if(Math.pow(2,x)<maxTime){
			x = x+z;
			setTimeout(runtab, Math.pow(2,x));
		}else{
			// 显示结果
			current.addClass("r");
			x=1;
		}
	}
	//begin();
	</script>
  </body>
</html>