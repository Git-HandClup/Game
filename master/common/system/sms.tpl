<?php
extract($cfg->sms);
?>
<form method="post" action="handle.php?m=system&c=setup&tab=sms" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<div class="pageFormContent" style="border-bottom:1px solid #aec3de">	
		<table class="task" width="100%">		
			<tr>
				<td class="td1">App Key：</td>
				<td class="td2"><input type="text" name="cfg_sms_appkey" class="required normal" value="<?php echo $cfg_sms_appkey?>" /></td>
			</tr>
            <tr>
				<td class="td1">Key Secret</td>
				<td class="td2"><input type="text" name="cfg_sms_keycode" class="required normal" value="<?php echo $cfg_sms_keycode?>"/></td>
			</tr>
            <tr>
				<td class="td1">用户签名：</td>
				<td class="td2"><input type="text" name="cfg_sms_signname" class="required normal" value="<?php echo $cfg_sms_signname?>"/></td>
			</tr>
            <tr>
				<td class="td1">模板代码：</td>
				<td class="td2"><input type="text" name="cfg_sms_template" class="required normal" value="<?php echo $cfg_sms_template?>"/></td>
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
			1，App Key短信服务提供商后台显示的APP KEY<br />
			2，Key Secret短信服务提供商后台显示的APP KEY<br />3，模板代码指用户在短信服务提供商后台设置的模板，代码一般为SMS_XXX
		</fieldset>
	</div>		
</form>