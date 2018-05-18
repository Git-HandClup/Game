<?php
extract($cfg->email);
?>
<form method="post" action="handle.php?m=system&c=setup&tab=email" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<div class="pageFormContent" style="border-bottom:1px solid #aec3de">	
		<table class="task" width="100%">		
			<tr>
				<td class="td1">服务器地址：</td>
				<td class="td2"><input type="text" name="cfg_mail_server" class="required short" value="<?php echo $cfg_mail_server?>" /></td>
			</tr>
            <tr>
				<td class="td1">发信帐户名：</td>
				<td class="td2"><input type="text" name="cfg_mail_account" class="required email short" value="<?php echo $cfg_mail_account?>"/></td>
			</tr>
            <tr>
				<td class="td1">发信人密码：</td>
				<td class="td2"><input type="text" name="cfg_mail_password" class="required short" value="<?php echo $cfg_mail_password?>"/></td>
			</tr>
            <tr>
				<td class="td1">服务器端口：</td>
				<td class="td2"><input type="text" name="cfg_mail_port" class="required digits short" value="<?php echo $cfg_mail_port?>"/></td>
			</tr>                                
        </table>
        <div class="formBar" style="border:1px solid #aec3de;border-top:0">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
		<hr />
		<fieldset>
			<legend>说明</legend>
			1，服务器地址，一般为POP服务器或SMTP服务器，如：smtp.qq.com<br />
			2，发信帐户和密码就是邮箱的登录名和密码<br />
			3，服务器端口，一般服务器端口为25
		</fieldset>
	</div>		
</form>