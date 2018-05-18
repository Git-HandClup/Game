<?php
	$dbo->dbase();
	$dbo->query('show fields from '.$ids);
	$dbo->select('field');
	$field = $dbo->result['field'];
?>
<div class="pageContent">	
	<div class="panelBar">
		<ul class="toolBar">	
			<li><a class="add" lang="system" rel="backup" ids="<?php echo $ids?>" pos="1" tab="table" callback="ajaxSltDone" postType="string" target="ajaxTodo" title="确实要备份所选数据表吗？"><span>备份数据表</span></a></li>
			<li><a class="edit" lang="system" rel="dbOptimize" ids="<?php echo $ids?>" pos="1" tab="table" callback="ajaxSltDone" postType="string" target="ajaxTodo" title="确实要优化所选数据表吗？"><span>优化数据表</span></a></li>
			<li><a class="view" lang="system" rel="dbRepair" ids="<?php echo $ids?>" pos="1" tab="table" callback="ajaxSltDone" postType="string" target="ajaxTodo" title="确实要修复所选数据表吗？"><span>修复数据表</span></a></li>
			<li><a class="icon" lang="system" rel="dbTruncate" ids="<?php echo $ids?>" pos="1" tab="table" callback="ajaxSltDone" postType="string" target="ajaxTodo" title="确实要清空所选数据表吗？"><span>清空数据表</span></a></li>				
			<li><a class="delete" lang="system" rel="dbClear" ids="<?php echo $ids?>" pos="1" tab="table" callback="dialogAjaxDone" postType="string" target="ajaxTodo" title="确实要删除所选数据表吗?"><span>删除数据表</span></a></li>					
		</ul>
	</div>
	<table class="list" width="100%" layoutH="30">
		<thead>
			<tr>
				<th>序号</th>
				<th>字段名</th>
				<th>字段类型</th>
				<th>字段属性</th>
				<th>默认值</th>
				<th>附加属性</th>
			</tr>
		</thead>
		<tbody>
			<?php
			foreach($field as $k => $v)
			{
				echo '
				<tr target="slt_user" rel="{$path}">
					<td>'.($k+1).'</td>
					<td class="pad"><img src="skin/manage/images/ico.png" style="vertical-align:middle;margin-right:10px"/>'.$v->Field.'</td>
					<td class="pad">'.$v->Type.'</td>
					<td>'.$v->Key.'</td>				
					<td>'.$v->Default.'</td>				
					<td>'.$v->Extra.'</td>				
				</tr>';
			}		
			?>
			<tr>
				<td colspan="7" class="pad" style="height:30px">本数据表共计：<font><b><?php echo number_format($pos)?></b></font> 条记录</td>
			</tr>
		</tbody>
	</table>
</div>