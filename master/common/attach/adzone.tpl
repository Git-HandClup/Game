<?php
$condition = '1=1';
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=attach&c=adzone" method="post" onsubmit="return navTabSearch(this)" >
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
				<li><a class="add" lang="m=attach&c=adzonex" width="580" height="266" target="dialog"><span>添加广告位</span></a></li>
				<li><a class="edit" lang="m=attach&c=adzoney&ids={sltobj}" target="dialog" width="580" height="266"><span>修改广告位</span></a></li>
				<li><a class="delete" lang="m=attach&c=clear&tab=adzone" ids="ids" postType="map" target="selectedTodo" title="确定要删除当前信息吗？"><span>删除广告位</span></a></li>	
				<li><a class="view" lang="m=attach&c=sort&tab=adzone" ids="ids"  postType="map" target="selectedTodo" title="批量更新所选项目排序?"><span>更新广告位排序</span></a></li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="4%">序号</th>
					<th>广告位名称</th>
					<th>广告位说明</th>
					<th width="8%">排序号</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$sql['cond'] = $condition;
				$sql['length'] = 0;
				$sql['table'] = 'adzone';
				$sql['sort'] = 'pid asc';
				$core->parameter($sql);
				$core->item();				
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
							<td class="pad">'.$v->intro.'</td>
							<td><input type="text" class="ipt" id="pid_'.$v->id.'" value="'.$v->pid.'" /></td>
							<td>
								<a class="btnEdit" lang="m=attach&c=adzoney&ids='.$v->id.'" width="580" height="266" target="dialog" title="修改广告位">编辑</a>	
								<a class="btnDel" lang="m=attach&c=clear&tab=adzone&ids='.$v->id.'" target="ajaxTodo" title="确定要删除当前信息吗？">删除</a>
							</td>
						</tr>';	
					}
				}
				else
					echo '<tr><td colspan="6"><font>暂无相关信息</font></td></tr>';
			?>	                
			</tbody>
		</table>
	</div>
	<div class="panelBar" style="border-bottom:0">
		<div class="pages">
			<span>每页显示 <b><?php echo $list['total']?></b> 个项目</span>
			<span>共 <b><?php echo $list['total']?></b> 个项目</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="1" numPerPage="1" pageNumShown="1" currentPage="1"></div>
	</div>		
</div>
