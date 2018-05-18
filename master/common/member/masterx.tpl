<div class="pageContent">
	<form method="post" action="handle.php?m=member&c=add&tab=master" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">
				<tr>                        
					<td class="td1">用户角色：</td>
					<td class="td2">
						<input type="hidden" name="cdatetimes" value="<?php echo time();?>"/>
						<input type="hidden" name="ipaddress" value="0.0.0.0"/>
						<select class="required combox" name="role">
							<option value="">请选择角色</option>
							<option value="administrator">超级管理员</option>
							<option value="manage">普通管理员</option>
						</select>
					</td>
				</tr>
				<tr>                        
					<td class="td1">用户名：</td>
					<td class="td2"><input type="text" name="username" class="required normal alphanumeric" /></td>
				</tr>
				<tr>
					<td class="td1">密码：</td>
					<td class="td2"><input type="password" name="password" class="required normal" /></td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
