<?php
extract($cfg->markup);
?>
<form id="upform" method="post" action="handle.php?m=system&c=setup&tab=markup" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)" enctype="multipart/form-data">
<div class="pageFormContent" style="border-bottom:1px solid #aec3de">
	<table class="task" width="100%">	
		<tr>
			<td class="td1">添加图片的水印类型：</td>			
			<td class="td2">
				<input type="radio" class="cbx" name="cfg_markup_type"<?php echo $cfg_markup_type == 'gif' ?  ' checked="true"' : ''?> value="gif"/>GIF
				<input type="radio" class="cbx" name="cfg_markup_type"<?php echo $cfg_markup_type == 'png' ?  ' checked="true"' : ''?> value="png"/>PNG
				<input type="radio" class="cbx" name="cfg_markup_type"<?php echo $cfg_markup_type == 'text' ?  ' checked="true"' : ''?> value="text"/>文字
				<ins>(水印类型，默认使用PNG图片作为水印)</ins>
			</td>			
		</tr>
		<tr>
			<td class="td1">水印效果预览图：</td>
			<td class="td2">
				<img src="<?php echo $cfg_markup_img?>"/>
			</td>
		</tr>
		<tr>
			<td class="td1">重新上传水印图片：</td>
			<td class="td2">
				<input type="text" name="cfg_markup_img" id="cfg_markup_img" class="required normal" value="<?php echo $cfg_markup_img?>"/>
				<div class="buttonActive">
					<div class="buttonContent">
						<a class="upload" title="上传文件">本地上传...</a>
						<input type="file" name="up_markup_logo" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('cfg_markup_img','logo','up_markup_logo')"/>
					</div>
				</div>
				<iframe name="up_markup_logo" style="display:none"></iframe>
				<ins>(水印图片地址，如有更新，请重新上传，支持的图片格式，请参照附件设置中图片上传的格式)</ins>
			</td>
		</tr>
		<tr>
			<td class="td1">水印文字：</td>
			<td class="td2">
				<input type="text" name="cfg_markup_text" class="required normal" value="<?php echo $cfg_markup_text?>"/>
				<ins>(水印文字，使用文字水印时，请确保对应目录下存在font.ttf字体文件)</ins>
			</td>
		</tr>		
		<tr>
			<td class="td1">水印文字字体大小：</td>
			<td class="td2">
				<input type="text" name="cfg_markup_fsize" class="required digits short" value="<?php echo $cfg_markup_fsize?>"/>
			</td>
		</tr>
		<tr>
			<td class="td1">水印文字颜色：</td>
			<td class="td2">
				<input type="text" name="cfg_markup_fcolor" class="required short" value="<?php echo $cfg_markup_fcolor?>"/>
				<ins>(水印文字颜色，可以使用十六进制颜色代码或RGB颜色代码)</ins>
			</td>
		</tr>
		<tr>
			<td class="td1">水印图片透明度：</td>
			<td class="td2">
				<input type="text" name="cfg_markup_trans" class="required digits short" value="<?php echo $cfg_markup_trans?>"/>
				<ins>(设置 GIF，PNG 类型水印图片与原始图片的融合度,水印透明度（0—100，值越小越透明）：)</ins>
			</td>
		</tr>
		<tr>
			<td class="td1">水印位置：</td>
			<td class="td2">
				<input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '0' ?  ' checked="true"' : ''?> value="0" style="margin-left:26px"/>随机位置
				<table class="task" width="360px">
					<tr>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '1' ?  ' checked="true"' : ''?> value="1"/>顶部居左</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '2' ?  ' checked="true"' : ''?> value="2"/>顶部居中</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '3' ?  ' checked="true"' : ''?> value="3"/>顶部居右</td>
					</tr>
					<tr>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '4' ?  ' checked="true"' : ''?> value="4"/>中心居左</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '5' ?  ' checked="true"' : ''?> value="5"/>中心居中</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '6' ?  ' checked="true"' : ''?> value="6"/>中心居右</td>
					</tr>
					<tr>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '7' ?  ' checked="true"' : ''?> value="7"/>底部居左</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '8' ?  ' checked="true"' : ''?> value="8"/>底部居中</td>
						<td><input type="radio" class="cbx" name="cfg_markup_pos"<?php echo $cfg_markup_pos == '9' ?  ' checked="true"' : ''?> value="9"/>底部居右</td>
					</tr>
				</table>
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