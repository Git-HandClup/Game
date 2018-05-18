<form id="pagerForm" method="post" action="admin.php?m=system&c=database">
<input type="hidden" name="pageNum" value="<?php echo $page?>" />
</form>
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
			<li><a class="add" lang="system" rel="connect" target="navTab"><span>修改连接配置</span></a></li>    						
			<li><a class="add" lang="system" rel="backup" target="navTab"><span>修改备份配置</span></a></li>    						
			<li><a class="edit" lang="database" rel="restore" ids={slt_user}" target="ajaxTodo" title="还原所选数据库备份?"><span>还原数据库</span></a></li>
			<li><a class="delete" lang="system" rel="record" ids="ids" pos="0" tab="database" callback="ajaxSltDone" postType="string" target="selectedTodo"  title="确实要删除这些记录吗?" ><span>批量删除备份</span></a></li>					
		</ul>
	</div>
	<table class="list" width="100%" layoutH="90">
		<thead>
			<tr>
				<th width="4%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="4%">序号</th>
				<th style="text-align:left;padding-left:4px">备份子目录名称</th>
				<th width="10%">备份表数量</th>
				<th width="10%">备份时间</th>
				<th width="10%">还原时间</th>
				<th width="8%">还原次数</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
		<?php
		$bak = @include('/..'.$config['connect']['cfg_db_backup'].'/config.inc');		
		if(empty($page))
			$page = 1;
		if(count($bak) > 0)
		{
			$i = 1;
			foreach($bak as $k => $v)
			{				
				echo '
				<tr target="slt_user" rel="'.$k.'">
					<td><input name="ids"  type="checkbox" value="'.$k.'" /></td>
					<td>'.($i++).'</td>
					<td class="pad"><img src="skin/manage/images/ico.gif" style="vertical-align:middle;margin-right:10px"/>'.$k.'</td>
					<td>共 <font>'.$v['total'].'</font> 张表</td>
					<td>'.date('Y-m-d H:i:s',$v['btime']).'</td>
					<td>'.($v['rtime'] != '-' ? date('Y-m-d H:i:s',$v['rtime']) : '-').'</td>
					<td> '.$v['num'].' </td>
					<td class="pad">
						<a class="btnSelect" lang="system" rel="restorebackup" ids="'.$k.'" target="ajaxSltDone"  title="确实要还原这条记录吗？">还原</a>
						<a class="btnDel" lang="system" rel="record" ids="'.$k.'"  pos="0" tab="database" target="ajaxTodo" callback="ajaxSltDone" title="确实要删除这条备份记录吗?">删除</a>
						<a class="btnAttach" lang="system" rel="download" ids="'.$k.'" target="ajaxSltDone" title="确实要删除这条记录吗?">打包下载</a>
					</td>
				</tr>';
			}
		}
		else
		{
			echo '<tr><td colspan="8"><center><font>暂无相关备份记录</font></center></td></tr>';
		}
		?>
		</tbody>
	</table>
</div>