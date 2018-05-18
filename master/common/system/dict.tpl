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
$condition .= " and type='".$pos."' and lv=".$tab;	
if(!empty($cid))
	$condition .= ' and cid='.$cid;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
$lng = $lang['system']['dictionary'];
$pr = (isset($lng[$pos][$ids]) ? $lng[$pos][$ids] : $lng[$ids][$pos]);
$pq =(isset($lng[$pos][$ids]) ? $ids : $pos);
?>
<form id="pagerForm" method="post" action="admin.php?m=system&c=dict">
	<input type="hidden" name="ids" value="<?php echo $ids?>" />
	<input type="hidden" name="pos" value="<?php echo $pos?>" />
	<input type="hidden" name="tab" value="<?php echo $tab?>" />
	<input type="hidden" name="pageNum" value="<?php echo $pageNum?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword?>" />
</form>

<div class="pageContent">
	<div class="pageHeader" style="border:0;border-top:1px solid #aec3de;">
		<form action="admin.php?m=system&c=dict&ids=<?php echo $ids?>&pos=<?php echo $pos?>&tab=<?php echo $lv?>" method="post" onsubmit="return dialogSearch(this)" >
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
	<table class="list" width="100%" layoutH="64">
		<thead>
			<tr>
				<th width="6%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
				<th width="6%">序号</th>
				<th width="20%"><?php echo $pr?>名称</th>		
				<th>使用说明</th>
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
					echo 
					'<tr target="sltobj" rel="'.$v->id.'">
						<td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
						<td>'.($k + 1).'</td>
						<td class="pad">'.$v->title.'</td>
						<td class="pad">'.$v->intro.'</a></td>
						<td>';
						if(isset($flag))
						{
							echo '<a class="btnSelect" href="javascript:;" onclick="$.bringBack({nid:'."'".$v->id."',ntitle:'".$v->title."'".'})" title="选择">选择</a>';
						}
						else
						{
							echo '<a class="btnSelect" href="javascript:;" onclick="$.bringBack({cid:'."'".$v->id."',title:'".$v->title."'".'})" title="选择">选择</a>';
						}
						echo'</td>
					</tr>';	
				}
			}
			else
				echo '<tr><td colspan="7"><font>暂无相关信息</font></td></tr>';
		?>	                
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>每页显示 <b><?php echo $psize?></b> 个项目</span>
			<span>共 <b><?php echo $list['total']?></b> 个项目</span>
		</div>
		<div class="pagination" targetType="dialog" totalCount="<?php echo $list['total']?>" numPerPage="<?php echo $psize?>" pageNumShown="5" currentPage="<?php echo $pageNum?>"></div>
	</div>
</div>
