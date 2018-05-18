<?php
$sql = array();
$qeury = array();
$psize = 16;
$lng = $lang['attach']['flink'];
$condition = ' 1 ';
if(!isset($ids))
	$ids = 0;
if(!isset($pageNum))
	$pageNum = 1;
$condition .= ' and fid='.$ids;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<form id="pagerForm" method="post" action="admin.php?m=attach&c=flink">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=attach&c=flink" method="post" onsubmit="return navTabSearch(this)" >
			<div class="searchBar">
				<ul class="searchContent">
					<li><label>检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字" value="<?php echo $keyword?>"/></li>           
					<li class="subBar" style="width:60px">
						<div class="buttonActive">
							<div class="buttonContent"><button type="submit">检索</button></div>
						</div>
					</li>
				</ul>		
			</div>
			</form>
		</div>
		<div class="panelBar" style="border-top:0">
			<ul class="toolBar">
				<li><a class="add" lang="m=attach&c=flinkx" target="dialog" width="680" height="286"><span>添加链接</span></a></li>
				<li><a class="edit" lang="m=attach&c=flinky&ids={sltobj}" target="dialog"  width="680" height="286"><span>修改链接</span></a></li>				
				<li><a class="delete" lang="m=attach&c=clear&tab=flink" ids="ids" target="selectedTodo" postType="string" title="确实要删除这些记录吗?"><span>批量删除链接</span></a></li>	
				<li><a class="view" lang="m=attach&c=sort&tab=flink" ids="ids" postType="string" target="selectedTodo" title="批量更新所选项目排序?"><span>更新链接排序</span></a></li>				
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="3%">序号</th>
					<th width="6%">链接类型</th>
					<th>链接名称</th>
					<th>链接地址</th>
					<th width="10%">链接图片</th>					
					<th width="8%">排序号</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$sql['cond'] = $condition;
				$sql['page'] = $pageNum;
				$sql['psize'] = $psize;
				$sql['table'] = 'flink';
				$sql['sort'] = 'pid asc';
				$core->parameter($sql);
				$core->itemlist();				
				$list = $core->result;
				
				if($list['total'] > 0)
				{
					foreach($list['data'] as $k => $v)
					{				
						
						echo '<tr target="sltobj" rel="'.$v->id.'">
						<td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
						<td>'.($k + 1).'</td>
						<td>'.$lng[$v->fid].'</td>
						<td class="pad">'.$v->title.'</td>
						<td class="pad">'.$v->url.'</td>
						<td><img src="'.$v->img.'" style="width:120px;height:60px;padding:4px 0"/></td>						
						<td><input type="text" class="ipt" id="pid_'.$v->id.'" value="'.$v->pid.'" /></td>
						<td>
							<a class="btnEdit" lang="m=attach&c=flinky&ids='.$v->id.'" width="680" height="286" target="dialog" title="修改链接">编辑</a>							
							<a class="btnDel" lang="m=attach&c=clear&tab=flink&ids='.$v->id.'" target="ajaxTodo" title="确定要删除当前信息吗?">删除</a>
						</td>
					</tr>';	
					}
				}
				else
					echo '<tr><td colspan="7"><font>暂无相关信息</font></td></tr>';
			?>	                
			</tbody>
		</table>
	</div>
	<div class="panelBar" style="border-bottom:0">
		<div class="pages">
			<span>每页显示 <b><?php echo $psize;?></b> 个项目</span>
			<span>共 <b><?php echo $list['total']?></b> 个项目</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<?php echo $list['pcount']?>" numPerPage="<?php echo $psize?>" pageNumShown="5" currentPage="<?php echo $pageNum;?>"></div>
	</div>
		
</div>
