<?php
	$dbo->dbase();
	$dbo->query('show table status');
	$dbo->select('table');
	$total = $dbo->result['total'];
	$row = $dbo->result['table'];
?>
<div class="pageHeader">	
	<div class="searchBar">
		<ul class="searchContent">
			<li style="width:230px"><label>备份名称：</label><input id="bakpath" name="bakpath" type="text" placeholder="备份名称"/></li>		
			<li class="subBar"><div class="buttonActive"><div class="buttonContent"><button type="button" lang="system" rel="bakframe" ids="form" pos="bakpath" target="dialog" width="480" height="300">备份数据库</button></div></div></li>
		</ul>		
	</div>
</div>
<div class="pageContent">	
	<div class="panelBar">
		<ul class="toolBar">	
			<li><a class="add" lang="system" rel="bakgrame" ids="ids" pos="bakpath" tab="table" target="dialog" width="480" height="300" title="备份数据表"><span>备份数据表</span></a></li>
			<li><a class="edit" lang="system" rel="dbOptimize" ids="ids" pos="0" tab="table" postType="string" target="selectedTodo" title="确实要优化所选数据表吗?"><span>优化数据表</span></a></li>
			<li><a class="view" lang="system" rel="dbRepair" ids="ids" pos="0" tab="table"  postType="string" target="selectedTodo" title="确实要修复所选数据表吗？"><span>修复数据表</span></a></li>
			<li><a class="icon" lang="system" rel="dbTruncate" ids="ids" pos="0" tab="table" postType="string" target="selectedTodo" title="确实要清空所选数据表吗？?"><span>清空数据表</span></a></li>					
			<li><a class="delete" lang="system" rel="dbClear" ids="ids" pos="0" tab="table" postType="string" target="selectedTodo" pos="0" tab="table" title="确实要删除所选数据表吗?"><span>删除数据表</span></a></li>					
		</ul>
	</div>
	<table class="list" width="100%" layoutH="90">
		<thead>
			<tr>
				<th width="4%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="4%">序号</th>
				<th>数据表名称(点击可查看字段详情)</th>
				<th width="10%">存储引擎</th>
				<th width="12%">编码</th>
				<th width="10%">总记录数</th>
				<th width="10%">占用空间(记录+索引)</th>
				<th width="10%">碎片空间</th>
				<th width="12%">操作</th>
			</tr>
		</thead>
		<tbody>
		<?php
		foreach($row as $k => $v)
		{			
			echo '
			<tr target="slt_user" rel="{$path}">
				<td><input name="ids"  type="checkbox" value="'.$v->Name.'" /></td>
				<td>'.($k + 1).'</td>
				<td class="pad"><img src="skin/manage/images/dot.gif" style="vertical-align:middle;margin-right:4px"/><a lang="system" rel="construct" ids="'.$v->Name.'" pos="'.$v->Rows.'" target="dialog" width="680" height="480" title="查看表结构 - '.$v->Name.'">
				'.$v->Name.'</a></td>
				<td>'.$v->Engine.'</td>
				<td>'.$v->Collation.'</td>
				<td><font>'.number_format($v->Rows).'</font> 条记录</td>
				<td>'.$tools->formatsize($v->Data_length + $v->Index_length).'</td>
				<td>'.$tools->formatsize($v->Data_free).'</td>
				<td class="pad">
					<a class="btnAdd" lang="system" rel="backup" ids="'.$v->Name.'" pos="0" tab="table" target="ajaxTodo" title="确实要备份此数据表吗？">备份</a>
					<a class="btnSelect" lang="system" rel="dbOptimize" ids="'.$v->Name.'"  pos="0" tab="table" callback="ajaxSltDone" target="ajaxTodo" title="确实要优化此数据表吗?">优化</a>
					<a class="btnEdit" lang="system" rel="dbRepair" ids="'.$v->Name.'" pos="0" tab="table" callback="ajaxSltDone" target="ajaxTodo" title="确实要修复此数据表吗?">修复</a>	
					<a class="btnDel" lang="system" rel="dbClear" ids="'.$v->Name.'"  pos="0" tab="table" callback="ajaxSltDone" target="ajaxTodo" title="确实要删除此数据表吗?">删除</a>
					<a class="btnAttach" lang="system" rel="dbTruncate" ids="'.$v->Name.'" pos="0" tab="table" callback="ajaxSltDone" target="ajaxTodo" title="确实要清空此数据表中所有记录吗?">清空</a>
				</td>
			</tr>';
			
		}
		?>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">                
			<span>每页显示 <b><?php echo $total?></b> 个项目&nbsp;</span>
			<span>总计 <b><?php echo $total?></b> 个项目&nbsp;</span>
		</div>        
		<div class="pagination" targetType="navTab" totalCount="<?php echo $total?>" numPerPage="1" pageNumShown="1" currentPage="1"></div>
	</div>
</div>