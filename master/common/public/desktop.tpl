<div class="pageContent" selector="h1" style="float:left;width:50%">
	<div class="panel">
		<h1>登录信息</h1>
		<div id="loginInfo">
			<label>您好： <span id="adminx" style="font-size:14px;color:red;font-weight:700"> - </span></span>
			  - 意见反馈： - <i><a target="navTab" lang="content" rel="payment" title="订单管理" style="color:red"> - </a></i>- 条未处理订单</label>
			<label>角色：<span id="rolex"> - </span></label>
			<hr />
			<label>最后登录时间：<span id="timex"> - </span></label>
			<label>最后登录地址：<span id="ipx"> - </span></label>
			<label>最后登录次数：<span><i id="totalx"></i>次</span></label>
		</div>
	</div>
</div>
<div class="pageContent" selector="h1" style="float:left;width:50%">
	<div class="panel">
		<h1>系统信息</h1>
		<div>
			<table class="task" width="100%">
				<tr><td class="td1 td3">服务器名称：</td><td class="td2"><?php echo $_SERVER['SERVER_NAME'];?></td></tr>
				<tr><td class="td1 td3">操作系统：</td><td class="td2"><?php echo PHP_OS;?></td></tr>
				<tr><td class="td1 td3">服务器版本：</td><td class="td2"><?php echo $_SERVER['SERVER_SOFTWARE'];?></td></tr>
				<tr><td class="td1 td3">数据库信息：</td></tr>
				<tr><td class="td1 td3">服务器时间：</td><td class="td2" id="datetime">
				<script language="javascript" type="text/javascript">
						setInterval("datetime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);</script>
				</td></tr>
			</table>
		</div>
	</div>
</div>
