﻿<?php
$data = $tpl->GetSingleInfo('guide','id='.$ids);
extract($data);
?>
<div class="pageContent">
<form method="post" action="handle.php?m=guide&c=edit&ids=<?php echo $ids;?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform"  enctype="multipart/form-data">
	<div class="pageFormContent" layoutH="50">				
		<table class="task" width="100%" style="margin-bottom:6px"> 
			<tr>
				<td class="td1">所属频道节点：</td>
				<td class="td2">
					<select name="cid" class="required combox" curval="<?php echo $cid;?>">
						<option value="">请选择频道节点</option>
						<?php 
						$list = $tpl->GetInfoList('catalog',0,"type='guide'",'pid','asc');
						foreach($list as $k => $v)
						{
							echo '<option value="'.$v['id'].'">'.$v['title'].'</option>';
						}
						?>
					</select>
					<ins>(必选，信息所属频道节点.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">信息标题：</td>
				<td class="td2">
					<input type="text" name="title" class="required normal" value="<?php echo $title;?>" />
					<ins>(不能为空，控制在64个汉字以内.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">信息作者：</td>
				<td class="td2">
					<input type="text" name="author" class="short" value="<?php echo $author;?>" />
					<ins>(信息作者，如"管理员".)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">缩略图：</td>
				<td class="td2">
					<input name="litpic" id="litpic" type="text" class="normal" value="<?php echo $litpic;?>"/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="上传文件">本地上传...</a>
							<input type="file" id="upfiles" name="upfiles" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('litpic','upfiles')"/>
						</div>
					</div>
					<iframe name="upfrm" style="display:none"></iframe>
				</td>
			</tr>
		   <tr>
				<td class="td1">节点关键字</td>
				<td class="td2">
					<input name="keyword" type="text" value="<?php echo $keyword;?>"/>
					<ins>(节点关键字，多个关键字用,隔开)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">摘要信息：</td>
				<td class="td2">
					<textarea  name="keydesc" style="height:60px"><?php echo $keydesc;?></textarea>
				</td>
			</tr>                                                    
			<tr>
				<td class="td1">详细内容：</td>
				<td class="td2"><ins>详细内容支持类似WORD形式的图文混排</ins></td>
			</tr>
			<tr>
				<td class="td2" colspan="2">
					<input type="hidden" name="udatetimes" value="<?php echo time();?>"/>
					<textarea name="content" tool="full" class="editor require" style="width:100%;height:350px;"><?php echo $content;?></textarea>
				</td>
			</tr>
		</table>			
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
</form>
</div>
