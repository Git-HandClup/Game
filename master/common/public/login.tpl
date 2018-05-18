<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理员登录 -- 容易写后台管理系统</title>
<meta name="copyright" content="-第一资源,mellee@foxmail.com" />
<link rel="stylesheet" type="text/css" href="skin/manage/tps.login.css" />
<script type="text/javascript" language="javascript" src="scripts/tps.main.js"></script>
<script type="text/javascript" language="javascript" src="scripts/tps.login.js"></script>
<script type="text/javascript" language="javascript">
	$(document).ready(tps.login)
</script>
</head>
<body onkeydown="if(event.keyCode==13) tps.enter()">
	<div id="logo"></div>
	<div id="login">
		<div class="ucenter">
			<dd><label>用户名：</label><input type="text" id="uid" maxlength="16" /></dd>
			<dd><label>密&nbsp;&nbsp;码：</label><input type="password" id="pwd" maxlength="16" /></dd>
		</div>
	</div>
	<div id="msg"></div>
	<div id="oper">
		<input type="button" id="submit" name="submit" value="登录" />
		<input type="button" id="reset" name="reset" value="重置" />
		<input type="button" id="home" name="home" value="&nbsp;" />
		<p>&copy; 2016 第一资源　版权所有 ver:1.0</p>
	</div>
</body>
</html>