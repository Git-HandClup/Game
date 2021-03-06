<?php
$q['cond'] = 'id='.$ids;
$q['table'] = 'dictionary';
$core->parameter($q);
$core->single();
$std = $core->result['data'];
$core->field('id','dictionary',$std->cid,'title');
$fd = $core->result['data'];
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=system&c=edit&a=dictionary&ids=<?php echo $ids?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">	
				<tr>
					<td class="td1">所属学科：</td>
					<td class="td2">
						 <input type="hidden" name="type" value="subject"/>
						 <input type="hidden" name="lv" value="1"/>
						 <input type="hidden" name="lookup.cid" class="required digits" value="<?php echo $std->cid?>"/>
                        <input type="text" name="lookup.title" class="required short" value="<?php echo $fd->title?>" lookupGroup="lookup" disabled="disabled"/>
						 <a class="btnLook" lang="m=system&c=dict&ids=subject&pos=subject&tab=0" width="680" height="560" lookupGroup="lookup" title="选择学科">选择学科</a>
						<ins>(必选，专业所属学科。)</ins>
					</td>
				</tr>
				<tr>                        
					<td class="td1">类别信息名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" value="<?php echo $std->title?>"/></td>
				</tr>				
				<tr>
					<td class="td1">类别信息说明：</td>
					<td class="td2">
						<textarea style="height:60px" name="intro"><?php echo $std->intro?></textarea>
						<ins>(类别信息的详细说明)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required short digits" value="<?php echo $std->pid?>" />
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
