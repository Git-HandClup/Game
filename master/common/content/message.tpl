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
<form id="pagerForm" method="post" action="admin.php?m=content&c=message">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=content&c=message" method="post" onsubmit="return navTabSearch(this)" >
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
				<li><a class="view" target="selectedTodo" lang="examine" rel="message" ids="ids" postType="string"  title="批量更新留言状态?"><span>批量审核留言</span></a></li>	
				<li><a class="delete" target="selectedTodo" lang="purge"  rel="message" ids="ids" pos="2" postType="string"  title="确实要删除这些记录吗?"><span>批量删除留言</span></a></li>								
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="40"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="40">序号</th>
					<th width="160">用户名称</th>
					<th width="120">联系电话</th>
					<th width="120">微信或QQ</th>
					<th>电子邮件</th>
					<th width="80">信息状态</th>
					<th width="120">发布时间</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$list = $tpl->GetSplitList('message',$pageNum,$psize,$condition,'cdatetimes','desc');
				if(count($list>0))
				{
					foreach($list as $k => $v)
					{
						echo '<tr target="sltobj" rel="'.$v['id'].'">
						<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
						<td>'.($k+1).'</td>
						<td>'.$v['username'].'</a> </td>
						<td>'.$v['telphone'].'</a> </td>
						<td>'.$v['tencentq'].'</a> </td>
						<td class="pad">'.$v['email'].'</a> </td>
						<td>'.($v['fid']==1?'<font>已审核</font>':'未审核').'</td>
						<td>'.date('Y-m-d',$v['cdatetimes']).'</td>
						<td>
							<a class="btnSelect" target="ajaxTodo" lang="examine" rel="message" ids="'.$v['id'].'" title="审核留言">审核</a>							
							<a class="btnDel" target="ajaxTodo" lang="purge" rel="message" ids="'.$v['id'].'" pos="1"  title="确定要删除当前信息吗?">删除</a>
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
