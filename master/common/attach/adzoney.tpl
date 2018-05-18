<?php
$sql = array();
$sql['cond'] = 'id='.$ids;
$sql['table'] = 'adzone';
$core->parameter($sql);
$core->single();
$std = $core->result['data'];
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=attach&c=edit&a=adzone&ids=<?php echo $ids?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">
				<tr>                        
					<td class="td1">广告位名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal"  value="<?php echo $std->title?>"/></td>
				</tr>
				<tr>
					<td class="td1">广告位说明：</td>
					<td class="td2"><textarea style="height:80px" name="intro"><?php echo $std->intro?></textarea></td>
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
