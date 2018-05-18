<?php 
	extract($cfg->connect);
?>
<form method="post" action="handle.php?m=system&c=setup&tab=connect" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<div class="pageFormContent"  style="border-bottom:1px solid #aec3de">	
		<table class="task" width="100%">	
			<tr>
				<td class="td1">数据库类型：</td>
				<td class="td2">
					<select class="combox" name="cfg_db_type" curval="">
						<option value="mysql">MYSQL</option>
					</select>
					<ins>(项目所使用数据库，推荐使用MYSQL。)</ins>
				</td>
			</tr>	
			<tr>
				<td class="td1">服务器地址：</td>
				<td class="td2">
					<input type="text" name="cfg_data_host" class="require normal" value="<?php echo $cfg_data_host?>" />
					<ins>(mysql数据库填写，如localhost，sqlite请留空.)
				</td>
			</tr>
			<tr>
				<td class="td1">数据库名称：</td>
				<td class="td2">
					<input type="text" name="cfg_data_dbname" class="required alphanumeric normal" value="<?php echo $cfg_data_dbname?>" />
					<ins>(必填，数据库名称.)
				</td>
			</tr>
            <tr>
				<td class="td1">数据库用户名：</td>
				<td class="td2">
					<input type="text" name="cfg_data_user" class="alphanumeric normal" value="<?php echo $cfg_data_user?>"/>
					<ins>(数据库用户，一般sqlite无须填写.)
				</td>
			</tr>
            <tr>
				<td class="td1">数据库密码：</td>
				<td class="td2">
					<input type="text" name="cfg_data_pass" class="normal" value="<?php echo $cfg_data_pass?>"/>
					<ins>(数据库用户，一般sqlite无须填写.)
				</td>
			</tr>
            <tr>
				<td class="td1">数据表前缀：</td>
				<td class="td2">
					<input type="text" name="cfg_data_fix" class="required alphanumeric normal short" value="<?php echo $cfg_data_fix?>"/>
					<ins>(用于区分表，如gem_)</ins>
				</td>
			</tr>
            <tr>
				<td class="td1">服务器端口：</td>
				<td class="td2">
					<input type="text" name="cfg_data_post" class="required digist normal" value="<?php echo $cfg_data_post?>"/>
					<ins>(设置端口，如3306)</ins>
				</td>
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
			1，mysql数据库填写，如localhost，sqlite请留空.<br />
			2，数据库用户，一般sqlite无须填写.<br />
			3，数据表前缀，用于区分表，如tps_
		</fieldset>
	</div>		
</form>