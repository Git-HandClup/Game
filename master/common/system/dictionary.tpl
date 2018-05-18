<?php
$psize = 16;
$condition = ' 1 ';
if(empty($pageNum))
	$pageNum = 1;
if(empty($ids))
	$ids = 'collage';
if(empty($pos))
	$pos = 'collage';
if(empty($tab))
	$tab = 0;
$lv = $tab;
$condition .= " and type='".$pos."' and lv=".$lv;	
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
$lng = $lang['system']['dictionary'];
$pr = (isset($lng[$pos][$ids]) ? $lng[$pos][$ids] : $lng[$ids][$pos]);
$pq =(isset($lng[$pos][$ids]) ? $ids : $pos);
?>
<form id="pagerForm" method="post" action="admin.php?m=system&c=dictionary">
	<input type="hidden" name="ids" value="<?php echo $ids?>" />
	<input type="hidden" name="pos" value="<?php echo $pos?>" />
	<input type="hidden" name="tab" value="<?php echo $lv?>" />
	<input type="hidden" name="pageNum" value="<?php echo $pageNum?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword?>" />
</form>
<div class="pageContent" style="padding:4px">
	<div class="frameWork" layoutH="10">		
		<h3>院校字典</h3>
		<ul class="tree treeFolder"> 	
			<?php 
				$tab = 0;
				$col = $lng['collage'];
				foreach($col as $k => $v)
				{
					echo 
					'<li'.($k == $ids ? ' class="hover"' : '').'><a target="navTab" lang="m=system&c=dictionary&pos=collage&tab='.$tab.'&ids='.$k.'" rel="dictionary" title="数据字典-'.$v.'">'.$v.'</a></li>';
					$tab++;
				}
			?>			
		</ul>
		<h3>学科字典</h3>
		<ul class="tree treeFolder"> 		
			<?php 
				$tab = 0;
				$col = $lng['subject'];
				foreach($col as $k => $v)
				{
					echo 
					'<li'.($k == $ids ? ' class="hover"' : '').'><a target="navTab" lang="m=system&c=dictionary&pos=subject&tab='.$tab.'&ids='.$k.'" rel="dictionary" title="数据字典-'.$v.'">'.$v.'</a></li>';
					$tab++;
				}
			?>			
		</ul>
		<h3>其它字典</h3>
		<ul class="tree treeFolder"> 		
			<?php 
				$col = $lng['other'];
				foreach($col as $k => $v)
				{
					echo 
					'<li'.($k == $pos ? ' class="hover"' : '').'><a target="navTab" lang="m=system&c=dictionary&ids=other&pos='.$k.'" rel="dictionary" title="数据字典-'.$v.'">'.$v.'</a></li>';
				}
			?>			
		</ul>
	</div>
	<div class="frameSpace" layoutH="10">
		<div class="pageContent">
			<div class="pageHeader">
				<form action="admin.php?m=system&c=dictionary&ids=<?php echo $ids?>&pos=<?php echo $pos?>&tab=<?php echo $lv?>" method="post" onsubmit="return navTabSearch(this)" >
				<div class="searchBar">
					<ul class="searchContent">
						<li><label>检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字"/></li>                        
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
					<li><a class="add" lang="m=system&c=<?php echo $pq?>x" target="dialog" width="680" height="352"><span>添加<?php echo $pr?></span></a></li>
					<li><a class="edit" lang="m=system&c=<?php echo $pq?>y&ids={sltobj}" target="dialog" width="680" height="352"><span>修改<?php echo $pr?></span></a></li>
					<li><a class="delete" lang="m=system&c=purge&pos=dictionary&tab=dictionary" ids="ids" postType="string" target="selectedTodo" title="确实要删除这些记录吗?"><span>批量删除<?php echo $pr?></span></a></li>
					<li><a class="view" lang="m=system&c=sort&tab=dictionary" ids="ids" postType="string" target="selectedTodo" title="批量更新所选项目排序?"><span>更新<?php echo $pr?>排序</span></a></li>					
				</ul>
			</div>
			<table class="list" width="100%" layoutH="101">
				<thead>
					<tr>
						<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
						<th width="3%">序号</th>
						<th width="20%">所属级别</th>
						<th width="20%"><?php echo (isset($lng[$pos][$ids]) ? $lng[$pos][$ids] : $lng[$ids][$pos])?>名称</th>		
						<th>使用说明</th>
						<th width="6%">排序号</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
				<tbody>
				<?php
					$sql['cond'] = $condition;
					$sql['page'] = $pageNum;
					$sql['psize'] = $psize;
					$sql['table'] = 'dictionary';
					$sql['sort'] = 'pid asc';
					$core->parameter($sql);
					$core->itemlist();				
					$list = $core->result;
					if($list['total'] > 0)
					{
						foreach($list['data'] as $k => $v)
						{
							//echo ;
							//print_r($core->result['list']);
							echo '<tr target="sltobj" rel="'.$v->id.'">
							<td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
							<td>'.($k + 1).'</td>
							<td class="pad">'.$core->node('dictionary',$v->cid).'</td>
							<td class="pad">'.$v->title.'</td>
							<td class="pad">'.$v->intro.'</a></td>
							<td><input type="text" class="ipt" id="pid_'.$v->id.'" value="'.$v->pid.'" /></td>							
							<td>
								<a class="btnEdit" lang="m=system&c='.$pq.'y&ids='.$v->id.'" target="dialog" width="680" height="352" title="修改'.$pr.'">编辑</a>							
								<a class="btnDel" lang="m=system&c=purge&pos=dictionary&tab=dictionary&ids='.$v->id.'" target="ajaxTodo" title="确定要删除当前信息吗?">删除</a>
							</td>
						</tr>';	
						}
					}
					else
						echo '<tr><td colspan="7"><font>暂无相关信息</font></td></tr>';
				?>	                
				</tbody>
			</table>
			<div class="panelBar" style="border-bottom:0">
				<div class="pages">
					<span>每页显示 <b><?php echo $psize?></b> 个项目</span>
					<span>共 <b><?php echo $list['total']?></b> 个项目</span>
				</div>
				<div class="pagination" targetType="navTab" totalCount="<?php echo $list['total']?>" numPerPage="<?php echo $psize?>" pageNumShown="5" currentPage="<?php echo $pageNum?>"></div>
			</div>
		</div>
	</div>
</div>
