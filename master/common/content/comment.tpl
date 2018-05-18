<?php
$psize = 16;
$condition = '1=1';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<form id="pagerForm" method="post" action="admin.php?m=content&c=honor">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">
	<div class="panelBar" style="border-top:0">
		<ul class="toolBar">			
			<li><a class="delete" target="selectedTodo" lang="examine"  rel="comment" ids="ids" pos="1" postType="string"  title="确实要审核这些评论吗?"><span>批量审核留言</span></a></li>	
			<li><a class="delete" target="selectedTodo" lang="purge"  rel="comment" ids="ids" pos="2" postType="string"  title="确实要删除这些评论吗?"><span>批量删除评论</span></a></li>	
			
		</ul>
	</div>
	<table class="list" width="100%" layoutH="52">
		<thead>
			<tr>
				<th width="40"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
				<th width="40">序号</th>
				<th>评论类型</th>
				<th>用户名</th>
				<th>信息标题</th>				
				<th>评论星级</th>	
				<th>评论状态</th>				
				<th>提交时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<?php
			$list = $tpl->GetSplitList('comment',$pageNum,$psize,$condition,'udatetimes','desc');
			if(count($list>0))
			{
				foreach($list as $k => $v)
				{
					echo '<tr target="sltobj" rel="'.$v['id'].'">
					<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
					<td>'.($k+1).'</td>
					<td>'.$tpl->GetModule($v['type']).'</td>	
					<td>'.$tpl->GetField($v['uid'],'member','username').'</td>
					<td class="pad">'.$tpl->GetField($v['tid'],$v['type'],'title').'</td>
					<td>'.$v['rank'].'</td>	
					<td>'.($v['fid'] == 0?'<font style="color:red">未审核</font>':'<font style="color:green">已审核</font>' ).'</td>									
					<td>'.date('Y-m-d',$v['udatetimes']).'</td>
					<td>
						<a class="btnSelect" target="ajaxTodo" lang="examine" rel="comment" ids="'.$v['id'].'" pos="1">审核评论</a>							
						<a class="btnDel" target="ajaxTodo" lang="purge" rel="comment" ids="'.$v['id'].'" pos="1"  title="确定要删除当前评论吗?">删除评论</a>
					</td>
				</tr>';	
				}
			}
			else
				echo '<tr><td colspan="8"><font>暂无相关信息</font></td></tr>';
		?>	                
		</tbody>
	</table>
	<div class="panelBar" style="border-bottom:0">
		<div class="pages">
			<span>每页显示 <b><?php echo $psize;?></b> 个项目</span>
			<span>共 <?php echo $tpl->rcount;?> 个项目</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<?php echo $tpl->rcount;?>" numPerPage="<?php echo $psize;?>" pageNumShown="5" currentPage="<?php echo $pageNum;?>"></div>
	</div>
</div>