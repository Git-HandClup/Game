<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理员登录 -- 容易写后台管理系统</title>
<meta name="copyright" content="-第一资源-,mellee@foxmail.com" />
<link rel="stylesheet" type="text/css" href="skin/manage/tps.manage.css" />
<link rel="stylesheet" type="text/css" href="skin/framework/azure/tps.azure.css" />
<link rel="stylesheet" type="text/css" href="skin/framework/main/tps.core.css" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="skin/framework/css/tps.iehack.css"/>
<![endif]-->
<script type="text/javascript" language="javascript" src="scripts/tps.main.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.core.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.func.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.cookie.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.validate.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.language.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.upload.js"></script>
<script type="text/javascript" language="javascript" src="editor/tps.xheditor.js"></script>
<script type="text/javascript" language="javascript" src="editor/xheditor_lang/zh-cn.js"></script>
<!--[if lte IE 9]>
<script  type="text/javascript" language="javascript" src="scripts/framework/tps.speed.js"></script>
<![endif]-->
<script type="text/javascript" language="javascript">
	window.onresize = tps.frame;
	$(function ()
	{
		TopSource.chkLogin();
		TopSource.init("config/config.xml", 
		{
			debug: false,
			callback: function ()
			{
				initEnv();
				tps.frame();
				$("#themeList").theme({ themeBase: "../skin/framework" });
				navTab.openTab("main", TopSource.linkUrl.PANEL + "?m=public&c=desktop", { title: "我的工作台", fresh: true, data: {} });
			}
		});
	});             
</script>
</head>
<body>
<div id="top">
	<div class="logos"></div>
	<div class="menus">
		<div class="ucenter">
			<span class="myhome" onclick="tps.redirect('/')"></span>
			<span class="refresh" onclick="tps.refresh()">刷新</span>
			<span class="exit" lang="member" rel="quit" tab="master" target="ajax">退出</span>
			<span class="pwd" lang="member" rel="mastery" target="dialog" width="420" height="210">改密</span>
			<span class="uname">您好：<strong id="uid"></strong></span>                        
		</div>
		<div class="tabitem">
			<a href="javascript:;" id="item_1" class="fixed" onclick="tps.load(1)">工作台</a>
			<a href="javascript:;" id="item_2" onclick="tps.load(2)">系统设置</a>
			<a href="javascript:;" id="item_3" onclick="tps.load(3)">内容管理</a>
			<a href="javascript:;" id="item_4" onclick="tps.load(4)">模板管理</a>
			<a href="javascript:;" id="item_5" onclick="tps.load(5)">生成管理</a>
			<a href="javascript:;" id="item_7" onclick="tps.load(7)">用户管理</a>
			<a href="javascript:;" id="item_8" onclick="tps.load(8)">财务管理</a>
			<a href="javascript:;" id="item_6" onclick="tps.load(6)">扩展管理</a>
		</div>
	</div>
</div>
<div id="layout">       
	<div id="leftside">
		<div id="sidebar_s">
			<div class="collapse">
				<div class="toggleCollapse">
					<div></div>
				</div>
			</div>
		</div>
		<div id="sidebar">
			<!-- 导航菜单 -->
			<div class="toggleCollapse">
				<h2>主菜单</h2>
				<div title="收起所有">收缩</div>
			</div>
			<div class="accordion" fillspace="sidebar"> 
				<div class="accordionHeader">
					<h2 id="stitle"><span></span>我的工作台</h2>
				</div>
				<div class="accordionContent">
				<ul class="tree treeFolder">
					<li><a href="javascript:;">主操作面板</a>
						<ul>
							<li><a lang="m=public&c=desktop" rel="desktop" target="navTab">我的工作台</a></li>						
						</ul>
					</li>
				</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="navTab" class="tabsPage">
			<div class="tabsPageHeader">
				<div class="tabsPageHeaderContent">
					<ul class="navTab-tab">
						<li tabid="main" class="main"><a><span><span class="home_icon">我的工作台</span></span></a></li>
					</ul>
				</div>
				<div class="tabsLeft">left</div>
				<div class="tabsRight">right</div>
				<div class="tabsMore">more</div>
			</div>
			<ul class="tabsMoreList">
				<li><a href="javascript:;">我的工作台</a></li>
			</ul>
			<div class="navTab-panel tabsPageContent layoutBox">
				<div class="page unitBox">                                                
					<div class="pageFormContent" layouth="80" style="margin-right: 230px" id="mainInfo">
					载入中，请稍候……
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="footer">Copyright &copy; 2016 <a target="dialog" panel="panel" rel="copyright"  width="480" height="360">第一资源</a> Power by Mellee.TopSource.inc E-mail:mellee@foxmail.com</div>
</body>
</html>
