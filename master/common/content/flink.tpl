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
<form id="pagerForm" method="post" action="admin.php?m=content&c=flink">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=content&c=flink" method="post" onsubmit="return navTabSearch(this)" >
			<div class="searchBar">
				<ul class="searchContent">
					<li><label>信息检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字"/></li>           
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
				<li><a class="add" target="dialog" lang="content" rel="addflink" width="580" height="232"><span>添加链接</span></a></li>
				<li><a class="edit" target="dialog" lang="content" rel="editflink" ids="{sltobj}" width="580" height="232"><span>修改链接</span></a></li>				
				<li><a class="delete" target="selectedTodo" lang="purge"  rel="flink" ids="ids" pos="2" postType="string"  title="确实要删除这些记录吗?"><span>批量删除链接</span></a></li>	
				<li><a class="view" target="selectedTodo" lang="sort" rel="flink" ids="ids" postType="string"  title="批量更新所选项目排序?"><span>更新链接排序</span></a></li>				
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="4%">序号</th>
					<th>链接名称</th>
					<th>链接地址</th>
					<th>链接图片</th>
					<th width="8%">排序号</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$list = $tpl->GetSplitList('flink',$pageNum,$psize,$condition,'pid','asc');
				if(count($list>0))
				{
					foreach($list as $k => $v)
					{
						echo '<tr target="sltobj" rel="'.$v['id'].'">
						<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
						<td>'.($k+1).'</td>
						<td><a href="'.$v['url'].'" title="预览" target="_blank">'.$v['title'].'</a></td>
						<td class="pad">'.$v['url'].'</td>
						<td class="pad">'.$v['img'].'</td>
						<td><input type="text" class="ipt" id="pid_'.$v['id'].'" value="'.$v['pid'].'" /></td>
						<td>
							<a class="btnEdit" target="dialog" lang="content" rel="editflink" ids="'.$v['id'].'" width="580" height="232" title="修改服务">编辑</a>							
							<a class="btnDel" target="ajaxTodo" lang="purge" rel="flink" ids="'.$v['id'].'" pos="1"  title="确定要删除当前信息吗?">删除</a>
						</td>
					</tr>';	
					}
				}
				else
					echo '<tr><td colspan="8"><font>暂无相关信息</font></td></tr>';
			?>	                
			</tbody>
		</table>
	</div>
	<div class="panelBar" style="border-bottom:0">
		<div class="pages">
			<span>每页显示 <b><?php echo $psize;?></b> 个项目</span>
			<span>共 <?php echo $tpl->rcount;?> 个项目</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<?php echo $tpl->rcount;?>" numPerPage="<?php echo $psize;?>" pageNumShown="5" currentPage="<?php echo $pageNum;?>"></div>
	</div>
		
</div>
