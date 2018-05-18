<?php
$sql = array();
if(empty($ids))
{
	$tp = json_decode($_COOKIE['master']);
	$ids = $tp->uname;
	$sql['cond'] = "username='".$ids."'";	
}
else
	$sql['cond'] = 'id='.$ids;
$sql['table'] = 'master';
$core->parameter($sql);
$core->single();
$std = $core->result['data'];
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=member&c=edit&tab=master&ids=<?php echo $std->id?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">
				<tr>                        
					<td class="td1">用户角色：</td>
					<td class="td2">
						<select class="required combox" name="role" curval="<?php echo $std->role?>">
							<option value="">请选择角色</option>
							<option value="administrator">超级管理员</option>
							<option value="manage">普通管理员</option>
						</select>
					</td>
				</tr>
				<tr>                        
					<td class="td1">用户名：</td>
					<td class="td2"><input type="text" name="username" class="required normal alphanumeric" value="<?php echo $std->username?>"/></td>
				</tr>
				<tr>
					<td class="td1">密码：</td>
					<td class="td2"><input type="password" name="password" class="normal" placeholder="无须修改请留空"/></td>
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
