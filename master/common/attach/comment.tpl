<?php
$sql = array();
$qeury = array();
$psize = 16;
$condition = ' 1 ';
$input = '';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($type))	
{
	$condition .= " and `type`='".$type."'";
	$input .= '<input type="hidden" name="type" value="'.$type.'" />';
}
if(isset($fid))	
{	
	if(empty($fid))
		$fid = 0;
	$condition .= ' and `fid`='.$fid;
	$input .= '<input type="hidden" name="fid" value="'.$fid.'" />';
}
if(!empty($cdatetimes))
{
	$condition .= ' and `cdatetimes` > '.strtotime($cdatetimes);
	$input .= '<input type="hidden" name="cdatetimes" value="'.$cdatetimes.'" />';
	if(!empty($edatetimes))
	{
		$condition .= ' and `cdatetimes` < '.strtotime($edatetimes);
		$input .= '<input type="hidden" name="edatetimes" value="'.$edatetimes.'" />';
	}
}
else
{
	if(!empty($edatetimes))
	{
		$condition .= ' and `cdatetimes` < '.strtotime($edatetimes);
		$input .= '<input type="hidden" name="edatetimes" value="'.$edatetimes.'" />';
	}
}
$lng = $lang['attach']['comment'];
?>
<form id="pagerForm" method="post" action="admin.php?m=attach&c=comment">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<?php echo $input?>
</form>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=attach&c=comment" method="post" onsubmit="return navTabSearch(this)" >		
			<div class="searchBar">			
				<ul class="searchContent">	
					<li style="width:162px">
						<select class="combox" name="type" curval="<?php echo !empty($type) ? $type : ''?>" lang="m=attach&c=comment&type={value}" ref="comment" rel="comment" title="评论信息管理">
							<option value="">请选择筛选类型</option>
							<?php
								foreach($lng['option'] as $k => $v)
								{
									echo '<option value="'.$k.'">'.$v.'</option>';
								}
							?>
						</select>
					</li>
					<li style="width:162px">
						<select class="combox" name="fid" curval="<?php echo isset($fid) ? $fid : ''?>" lang="m=attach&c=comment&fid={value}<?php echo isset($type) ? ('&type='.$type) : ''?>" ref="comment" rel="comment" title="评论信息管理">
							<option value="">请选择审核类型</option>
							<option value="0">未审核</option>
							<option value="1">已审核</option>
						</select>
					</li>					
					<li style="width:324px">
						<input name="cdatetimes" class="require date" type="text" placeholder="开始时间" value="<?php echo !empty($cdatetimes) ? $cdatetimes : ''?>"/>
						-
						<input name="edatetimes" class="require date" type="text" placeholder="结束时间" value="<?php echo !empty($edatetimes) ? $edatetimes : ''?>"/>
					</li> 
					<li class="subBar" style="width:60px">
						<div class="buttonActive">
							<div class="buttonContent"><button type="submit">筛选</button></div>
						</div>
					</li>					
				</ul>		
			</div>
			</form>
		</div>
		<div class="panelBar" style="border-top:0">
			<ul class="toolBar">
				<li><a class="edit" lang="m=attach&c=view&ids={sltobj}" target="dialog" width="680" height="534"><span>查看评论</span></a></li>				
				<li><a class="delete" lang="m=attach&c=purge&tab=comment" ids="ids" target="selectedTodo" postType="string" title="确实要删除这些记录吗?"><span>批量删除评论</span></a></li>	
				<li><a class="view" target="selectedTodo" lang="m=attach&c=examine&tab=comment" ids="ids" postType="string" title="批量更新所选项目状态?"><span>批量审核评论</span></a></li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="3%">序号</th>
					<th width="8%">评论类型</th>
					<th width="10%">评论人</th>					
					<th width="10%">所属导师</th>
					<th>论文标题</th>
					<th width="10%">评论时间</th>
					<th width="6%">评论状态</th>
					<th width="6%">是否回复</th>
					<th width="10%">回复时间</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$sql['cond'] = $condition;
				$sql['page'] = $pageNum;
				$sql['psize'] = $psize;
				$sql['table'] = 'comment';
				$sql['sort'] = 'fid asc,cdatetimes desc';
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
						<td>'.$lng['option'][$v->type].'</td>
						<td class="pad">'.$v->uid.'</td>
						<td class="pad">'.$v->mid.'</td>
						<td class="pad">'.$v->cid.'</td>
						<td>'.date('Y-m-d H:i:s',$v->cdatetimes).'</td>		
						<td>'.$lng['status'][$v->fid].'</td>						
						<td>'.$lng['replay'][$v->rid].'</td>
						<td>'.date('Y-m-d H:i:s',$v->rdatetimes).'</td>
						<td>
							<a class="btnSelect" lang="m=attach&c=examine&tab=comment&ids='.$v->id.'" target="ajaxTodo" title="确定要审核当前信息吗">审核</a>
							<a class="btnEdit" lang="m=attach&c=view&ids='.$v->id.'" width="680" height="534" target="dialog" title="查看评论">查看</a>
							<a class="btnDel" lang="m=attach&c=purge&tab=comment&ids='.$v->id.'" target="ajaxTodo"  title="确定要删除当前信息吗?">删除</a>
						</td>
					</tr>';	
					}
				}
				else
					echo '<tr><td colspan="11"><font>暂无相关信息</font></td></tr>';
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
