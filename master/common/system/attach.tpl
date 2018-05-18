<?php
extract($cfg->attach);
?>
<form method="post" action="handle.php?m=system&c=setup&tab=attach" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)">
<div class="pageFormContent" style="border-bottom:1px solid #aec3de;background:#fff">
	<table class="task" width="100%" style="margin-bottom:10px">	
		<tr>
			<td class="td1">附件上传真空路径：</td>
			<td class="td2">
				<input type="text" name="cfg_attach_upload" class="required short" value="<?php echo $cfg_attach_upload?>" />
			</td>
		</tr>
		<tr>
			<td class="td1">附件上传临时路径：</td>
			<td class="td2">
				<input type="text" name="cfg_attach_tmp" class="required short" value="<?php echo $cfg_attach_tmp?>" />
			</td>
		</tr>
		<tr>
			<td class="td1">附件上传子路径：</td>
			<td class="td2">
				<input type="text" name="cfg_attach_path" class="required short" value="<?php echo $cfg_attach_path?>" />
				<ins>(子路径上传格式请参数php日期格式 Y:年 m:月 d:日 H:时 i:分 s:秒。可随意组合)</ins>
			</td>
		</tr>
		<tr>
			<td class="td1">附件会命名规划：</td>
			<td class="td2">
				<input type="text" name="cfg_attach_name" class="required short" value="<?php echo $cfg_attach_name?>" />
				<ins>(附件命名规范，date表示日期，md5表示以16位md5码，留空表示以原始文件名保存)</ins>
			</td>
		</tr>
	</table>
	<fieldset>
		<legend>图片上传参数</legend>			
		<table class="task" width="100%">	
			<tr>
				<td class="td1">允许上传的图片类型：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_imgtype" class="required normal" value="<?php echo $cfg_attach_imgtype?>"  />
					<ins>(上传的图片类型，仅允许上传常用的图片格式，多个类型用 | 隔开)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">允许上传的图片大小：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_maxsize" class="required digits short" value="<?php echo $cfg_attach_maxsize?>" />
					<ins>(上传的图片大小，1kb = 1024k,默认200kb以内)</ins>
				</td>
			</tr>			
			<tr>
				<td class="td1">是否开始图片裁剪：</td>
				<td class="td2">
					<input type="radio" class="cbx" name="cfg_attach_cut"<?php echo $cfg_attach_cut == '1' ?  ' checked="true"' : ''?> value="1"/>开启
					<input type="radio" class="cbx" name="cfg_attach_cut"<?php echo $cfg_attach_cut == '0' ?  ' checked="true"' : ''?> value="0"/>关闭
					<ins>(开启图片裁剪，则每次上传成功后，则需要裁剪后再保存)</ins>
				</td>
			</tr>			
			<tr>
				<td class="td1">裁剪后的图片宽度：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_width" class="required digits short" value="<?php echo $cfg_attach_width?>"/>
				</td>
			</tr>
			<tr>
				<td class="td1">裁剪后的图片高度：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_height" class="required digits short" value="<?php echo $cfg_attach_height?>"/>
				</td>
			</tr>			
			<tr>			
				<td class="td1">图片是否添加水印</td>
				<td class="td2">
					<input type="radio" class="cbx" name="cfg_attach_markup"<?php echo $cfg_attach_markup == '1' ?  ' checked="true"' : ''?> value="1"/>开启
					<input type="radio" class="cbx" name="cfg_attach_markup"<?php echo $cfg_attach_markup == '0' ?  ' checked="true"' : ''?> value="0"/>关闭					
					<ins>(水印参数请到水印设置，只有在些开启了选项，图片才会添加水印，水印设置中的参数才会生效。)</ins>
				</td>
			</tr>
		</table> 
	</fieldset>
	<fieldset>
		<legend>文件上传参数</legend>			
		<table class="task" width="100%">			
			<tr>
				<td class="td1">允许上传的文件类型：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_ftype" class="required normal" value="<?php echo $cfg_attach_ftype?>"  />
					<ins>(上传的文件类型，仅允许上传常用的文档格式，多个类型用 | 隔开)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">允许上传的文件大小：</td>
				<td class="td2">
					<input type="text" name="cfg_attach_fsize" class="required digits short" value="<?php echo $cfg_attach_fsize?>" />
					<ins>(上传的文件大小，1kb = 1024k,默认20MB以内)</ins>
				</td>
			</tr>	
		</table> 
	</fieldset>
</div>
<div class="formBar" style="border-bottom:1px solid #aec3de;border-top:0">
	<ul>
		<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
		<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
	</ul>
</div>	
</form>