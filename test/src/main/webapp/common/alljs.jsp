<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="root"></c:set>

<!--java代码样式  -->
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



<link href="${root}/js/jquery-easyui-theme/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="${root}/js/jquery-easyui-theme/icon.css" rel="stylesheet" type="text/css" />
<link href="${root}/js/icons/icon-all.css" rel="stylesheet" type="text/css" />

<script src="${root}/js/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<!--<script src="jquery/jquery-1.11.1.min.js"></script>-->

<script src="${root}/js/jquery-easyui-1.3.6/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${root}/js/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>

<script src="${root}/js/jquery.jdirk.js" type="text/javascript"></script>
<!--<script src="release/jquery.jdirk.min.js"></script>-->

<link href="${root}/js/jeasyui-extensions/jeasyui.extensions.css" rel="stylesheet" type="text/css" />

<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.progressbar.js"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.slider.js"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.linkbutton.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.form.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.validatebox.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.combo.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.combobox.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.menu.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.searchbox.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.panel.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.window.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.dialog.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.layout.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.tree.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.datagrid.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.treegrid.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.combogrid.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.combotree.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.tabs.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.theme.js" type="text/javascript"></script>
<!--<script src="release/jeasyui.extensions.all.min.js"></script>-->

<script src="${root}/js/icons/jeasyui.icons.all.js" type="text/javascript"></script>
<!--<script src="release/jeasyui.icons.all.min.js"></script>-->

<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.icons.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jeasyui.extensions.gridselector.js" type="text/javascript"></script>
<script src="${root}/js/plugins/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

<script src="${root}/js/jeasyui-extensions/jquery.toolbar.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jquery.comboicons.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jquery.comboselector.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jquery.my97.js" type="text/javascript"></script>
<script src="${root}/js/jeasyui-extensions/jquery.portal.js" type="text/javascript"></script>

<!--kindeditor  -->
<link rel="stylesheet" href="${root}/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${root}/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="${root}/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="${root}/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${root}/kindeditor/plugins/code/prettify.js"></script>
	