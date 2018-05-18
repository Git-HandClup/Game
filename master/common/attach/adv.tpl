<?php
$sql = array();
$qeury = array();
$psize = 16;
$lng = $lang['attach']['adv'];
$condition = ' 1 ';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<form id="pagerForm" method="post" action="admin.php?m=attach&c=adv">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=attach&c=adv" method="post" onsubmit="return navTabSearch(this)" >
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
				<li><a class="add" lang="m=attach&c=advx" target="dialog" width="680" height="534"><span>添加广告</span></a></li>
				<li><a class="edit" lang="m=attach&c=advy&ids={sltobj}" target="dialog" width="680" height="534"><span>修改广告</span></a></li>				
				<li><a class="delete" lang="m=attach&c=clear&tab=adv" ids="ids" target="selectedTodo" postType="string" title="确实要删除这些记录吗?"><span>批量删除广告</span></a></li>	
				<li><a class="view" target="selectedTodo" lang="m=attach&c=sort&tab=adv" ids="ids" postType="string" title="批量更新所选项目排序?"><span>更新广告排序</span></a></li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="3%">序号</th>
					<th width="8%">广告版位</th>
					<th width="6%">广告类型</th>
					<th>广告名称</th>
					<th>广告地址</th>
					<th width="10%">广告图片</th>
					<th width="6%">起始时间</th>
					<th width="6%">结束时间</th>
					<th width="10%">广告状态</th>
					<th width="6%">排序号</th>
					<th width="6%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$sql['cond'] = $condition;
				$sql['page'] = $pageNum;
				$sql['psize'] = $psize;
				$sql['table'] = 'adv';
				$sql['sort'] = 'pid asc';
				$core->parameter($sql);
				$core->itemlist();				
				$list = $core->result;
				if($list['total'] > 0)
				{
					foreach($list['data'] as $k => $v)
					{				
						
						$core->field('id','adzone',$v->cid,'title');
						echo '<tr target="sltobj" rel="'.$v->id.'">
						<td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
						<td>'.($k + 1).'</td>
						<td>'.$core->result['data']->title.'</td>
						<td>'.$lng[$v->fid].'</td>
						<td class="pad">'.$v->title.'</td>
						<td class="pad">'.$v->url.'</td>
						<td><img src="'.$v->img.'" style="width:120px;height:60px;padding:4px 0"/></td>
						<td>'.date('Y-m-d',$v->sdatetimes).'</td>
						<td>'.date('Y-m-d',$v->edatetimes).'</td>
						<td>'.$tools->timer($v->edatetimes - time()).'</td>
						<td><input type="text" class="ipt" id="pid_'.$v->id.'" value="'.$v->pid.'" /></td>
						<td>
							<a class="btnEdit" lang="m=attach&c=advy&ids='.$v->id.'" width="680" height="534" target="dialog" title="修改广告">编辑</a>
							<a class="btnDel" lang="m=attach&c=clear&tab=adv&ids='.$v->id.'" target="ajaxTodo"  title="确定要删除当前信息吗?">删除</a>
						</td>
					</tr>';	
					}
				}
				else
					echo '<tr><td colspan="12"><font>暂无相关信息</font></td></tr>';
			?>	                
			</tbody>
		</table>
	</div>
	<div class="panelBar" style="border-bottom:0">
		<div class="pages">
			<span>每页显示 <b><?php echo $psize;?></b> 个项目</span>
			<span>共 <b><?php echo $list['total']?></b> 个项目</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<?php echo $list['total']?>" numPerPage="<?php echo $psize?>" pageNumShown="5" currentPage="<?php echo $pageNum;?>"></div>
	</div>
		
</div>
