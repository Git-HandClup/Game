<?php
$data = $tpl->GetSingleInfo('flink','id='.$ids);
extract($data);
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=flink&c=edit&ids=<?php echo $ids;?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">				
				<tr>                        
					<td class="td1">链接名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" value="<?php echo $title;?>" /></td>
				</tr>
				<tr>
					<td class="td1">链接地址：</td>
					<td class="td2"><input type="text" name="url" class="required normal" value="<?php echo $url;?>"/></td>
				</tr>
				<tr>
					<td class="td1">链接图片：</td>
					<td class="td2">
						<input name="img" id="img" type="text" class="normal" value="<?php echo $img;?>"/>
						<div class="buttonActive">
							<div class="buttonContent">
								<a class="upload" title="上传文件">本地上传...</a>
								<input type="file" id="upfiles" name="upfiles" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('img','upfiles')"/>
							</div>
						</div>
						<iframe name="upfrm" style="display:none"></iframe>
					</td>
				</tr>
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required short digits" value="<?php echo $pid;?>" />
					</td>
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
