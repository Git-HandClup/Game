<?php
$q['cond'] = 'id='.$ids;
$q['table'] = 'flink';
$core->parameter($q);
$core->single();
$std = $core->result['data'];
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=attach&c=edit&a=flink&ids=<?php echo $ids?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">	
				<tr>					
					<td class="td1">链接类型：</td>
					<td class="td2">
						<input type="radio" class="cbx" name="fid" value="0"<?php echo $std->fid == 0 ?' checked="true"':''?>/>友情链接
						<input type="radio" class="cbx" name="fid" value="1"<?php echo $std->fid == 1 ?' checked="true"':''?>/>合作伙伴
						<ins style="display:block">
					</td>
				</tr>					
				<tr>                        
					<td class="td1">链接名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" value="<?php echo $std->title?>"/></td>
				</tr>
				<tr>
					<td class="td1">链接地址：</td>
					<td class="td2"><input type="text" name="url" class="required normal" value="<?php echo $std->url?>"/></td>
				</tr>
				<tr>
					<td class="td1">链接图片：</td>
					<td class="td2">
						<input name="img" id="img" type="text" class="normal" value="<?php echo $std->img?>"/>
						<div class="buttonActive">
							<div class="buttonContent">
								<a class="upload" title="上传文件">本地上传...</a>
								<input type="file" name="up_adv_img" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('img','adv','up_adv_img')"/>
							</div>
						</div>
						<iframe name="up_adv_img" style="display:none"></iframe>
					</td>
				</tr>					
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required short digits" value="<?php echo $std->pid?>" />
						<input type="hidden" name="udatetimes" value="<?php echo time()?>" />
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
