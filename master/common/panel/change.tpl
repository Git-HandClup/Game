<div class="pageContent">	
	<form method="post" action="oper/event.aspx?app=admin&action=changepwd" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" >
		<div class="pageFormContent" layoutH="58">
			<table class="task" width="100%">
                                <tr>
				<td class="td1">原始密码：</td>
                                        <td class="td2"><input type="password" name="oldPassword"  class="required" /></td>
			</tr>
			<tr>
				<td class="td1">新设密码：</td>
				<td class="td2"><input type="password" id="cp_newPassword" name="newPassword" class="required alphanumeric"/></td>
			</tr>
			<tr>
				<td class="td1">确认密码：</td>
                                <td class="td2"><input type="password" name="rnewPassword" equalto="#cp_newPassword" class="required alphanumeric" /></td>
			</tr>
                </table>			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>	
</div>
