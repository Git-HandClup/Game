<?php
extract($cfg->backup);
?>
<form id="upform" method="post" action="handle.php?m=system&c=setup&tab=backup" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)" enctype="multipart/form-data">
	<div class="pageFormContent" style="border-bottom:1px solid #aec3de">
		<table class="task" width="100%">	
			<tr>
				<td class="td1">备份选项：<?php echo $cfg_backup_path?></td>
				<td class="td2">
					<input type="radio" class="cbx" name="cfg_backup_type"<?php echo $cfg_backup_type == '1' ? ' checked="true"' : ''?> value="1"/>按文件大小
					<input type="radio" class="cbx" name="cfg_backup_type"<?php echo $cfg_backup_type == '0' ? ' checked="true"' : ''?> value="0"/>按表记录数
					<ins>(数据库备份选项，表记录数较大，请选择按表记录数备份。)</ins>
				</td>
			</tr>	
			<tr>
				<td class="td1">每组备份文件大小：</td>
				<td class="td2">
					<input type="text" name="cfg_backup_size" class="required digits short" value="<?php echo $cfg_backup_size?>" />
					<ins>(每组备份文件大小，以KB以为单位，1MB=1024KB。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">每组备份记录数：</td>
				<td class="td2">
					<input type="text" name="cfg_backup_num" class="required digits short" value="<?php echo $cfg_backup_num?>" />
					<ins>(每组备份记录数，请设置合理的数值，默认500条记录为一个文件。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">是否自动识别自动增长列：</td>
				<td class="td2">
					<input type="checkbox" class="cbx"  value="1"<?php echo $cfg_backup_ai == '1' ? ' checked="true"' : ''?> onclick="this.checked  == true ? $('#cfg_backup_ai').val(1) : $('#cfg_backup_ai').val(0)"/>
					<input type="hidden" id="cfg_backup_ai" name="cfg_backup_ai"  value="<?php echo $cfg_backup_ai?>"/>
					<ins>(是否自动识别自动增长列，启用此方式效率高。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">是否备份数据库结构：</td>
				<td class="td2">
					<input type="checkbox" class="cbx"  value="1"<?php echo $cfg_backup_struct == '1' ? ' checked="true"' : ''?> onclick="this.checked  == true ? $('#cfg_backup_struct').val(1) : $('#cfg_backup_struct').val(0)"/>
					<input type="hidden" id="cfg_backup_struct" name="cfg_backup_struct"  value="<?php echo $cfg_backup_struct?>"/>
					<ins>(是否备份数据库结构，没有特殊情况，请启用此选项)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">备份使用的编码：</td>
				<td class="td2">
					<select class="combox" name="cfg_backup_charset" curval="<?php echo $cfg_backup_charset?>">
						<option value="auto">自动识别编码</option>
						<option value="">不设置</option>
						<option value="gbk">gbk</option>
						<option value="utf8">utf8(推荐)</option>
						<option value="gb2312">gb2312</option>
						<option value="big5">big5</option>
						<option value="latin1">latin1(不推荐)</option>
					</select>
					<ins>(从mysql4.0导入mysql4.1以上版本需要选择固定编码，不能选自动。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">数据存放格式：</td>
				<td class="td2">
					<input type="radio" class="cbx" name="cfg_backup_code"<?php echo $cfg_backup_code == '0' ? ' checked="true"' : ''?> value="0"/>常规格式
					<input type="radio" class="cbx" name="cfg_backup_code"<?php echo $cfg_backup_code == '1' ? ' checked="true"' : ''?> value="1"/>十六进制
					<ins>(十六进制备份文件会占用更多的存储空间。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">数据存放目录：</td>
				<td class="td2">
					<input type="text" name="cfg_backup_path" class="normal" value="<?php echo $cfg_backup_path?>"/>
					<ins>(目录不存在，系统会自动建立。默认使用数据库名称加日期<?php echo $cfg_backup_path?>)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">数据导入方式：</td>
				<td class="td2">
					<select class="combox" name="cfg_backup_import" curval="<?php echo $cfg_backup_import?>">
						<option value="replace" selected>REPLACE</option>
						<option value="insert">INSERT</option>
					</select>
					<input type="checkbox" class="cbx"  value="1"<?php echo $cfg_backup_method == '1' ? ' checked="true"' : ''?> onclick="this.checked  == true ? $('#cfg_backup_method').val(1) : $('#cfg_backup_method').val(0)"/>
					<input type="hidden" id="cfg_backup_method" name="cfg_backup_method"  value="<?php echo $cfg_backup_method?>"/>
					完整插入，
					<input type="checkbox" class="cbx"  value="1"<?php echo $cfg_backup_convert == '1' ? ' checked="true"' : ''?> onclick="this.checked  == true ? $('#cfg_backup_convert').val(1) : $('#cfg_backup_convert').val(0)"/>
					<input type="hidden" id="cfg_backup_convert" name="cfg_backup_convert"  value="<?php echo $cfg_backup_convert?>"/>
					转成MYSQL4.0格式，需要转换数据表编码时选择
				</td>
			</tr>
			<tr>
				<td class="td1">每组执行延迟时间：</td>
				<td class="td2">
					<input name="cfg_backup_delay" type="text" class="required digits short" value="<?php echo $cfg_backup_delay?>"/>
				</td>
			</tr>
			<tr>
				<td class="td1">备份说明：</td>
				<td class="td2">
					<textarea style="height:60px" name="cfg_backup_memo"><?php echo $cfg_backup_memo?></textarea>
					<ins>(备份说明，系统会生成一个readme.txt说明文档)</ins>
				</td>
			</tr>
		</table> 
		<div class="formBar" style="border:1px solid #aec3de;border-top:0">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</div> 
</form>