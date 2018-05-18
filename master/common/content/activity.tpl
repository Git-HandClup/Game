<?php
$psize = 16;
$condition = '1=1';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($ids))
	$condition .= ' and cid=' . $ids;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>

<form id="pagerForm" method="post" action="admin.php?m=content&c=news">
	<input type="hidden" name="ids" value="<?php echo isset($ids)?$ids:'';?>" />
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent" style="padding:4px">
	<div class="frameWork" layoutH="10">
		<h3 style="color:#f00;padding:0 0 0 24px;font:700 14px/24px '';background:url(/master/skin/manage/images/ico.gif) no-repeat 4px 6px">频道节点</h3>
		<ul class="tree treeFolder expand">
		<?php
		$list = $tpl->getInfoList('catalog',0,"type='activity'",'pid','asc');
		foreach($list as $k => $v)
		{
			echo '<li><a target="navTab" lang="content" rel="activity" ids="'.$v['id'].'"  title="'.$v['title'].'">'.$v['title'].'</a></li>';
		}
		?>
		</ul>
	</div>
	<div class="frameSpace" layoutH="10">
		<div class="pageContent">
			<div class="pageHeader">
				<form action="admin.php?m=content&c=activity&ids=<?php echo isset($ids)?$ids:'';?>" method="post" onsubmit="return navTabSearch(this)" >
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
					<li><a class="add" target="dialog" lang="content" rel="addactivity" width="850" height="0"><span>添加活动</span></a></li>
					<li><a class="edit" target="dialog" lang="content" rel="editactivity" ids="{sltobj}" width="850" height="0"><span>修改活动</span></a></li>
					<li><a class="delete" target="selectedTodo" lang="purge"  rel="activity" ids="ids" pos="2" postType="string"  title="确实要删除这些记录吗?"><span>批量删除信息</span></a></li>								
				</ul>
			</div>
			<table class="list" width="100%" layoutH="101">
				<thead>
					<tr>
						<th width="40"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
						<th width="40">序号</th>
						<th width="160">频道节点</th>
						<th>活动信息标题</th>
						<th width="120">开始时间</th>
						<th width="120">结束时间</th>
						<th width="120">发布时间</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
				<?php
					$list = $tpl->GetSplitList('activity',$pageNum,$psize,$condition,'udatetimes','desc');
					if(count($list>0))
					{
						foreach($list as $k => $v)
						{
							echo '<tr target="sltobj" rel="'.$v['id'].'">
							<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
							<td>'.($k+1).'</td>
							<td>'.$tpl->GetField($v['cid'],"catalog","title").'</td>
							<td class="pad">
								<a href="/activity/'.date('Ym',$v['udatetimes']).'/'.$v['cid'].'-'.$v['id'].'.html" title="预览" target="_blank">'.$v['title'].'</a> 
							</td>
							<td>'.date('Y-m-d',$v['sdatetimes']).'</td>
							<td>'.date('Y-m-d',$v['edatetimes']).'</td>
							<td>'.date('Y-m-d',$v['udatetimes']).'</td>
							<td>
								<a class="btnEdit" target="dialog" lang="content" rel="editactivity" ids="'.$v['id'].'" width="850" height="0" title="修改活动">编辑</a>							
								<a class="btnDel" target="ajaxTodo" lang="purge" rel="activity" ids="'.$v['id'].'" pos="1"  title="确定要删除当前信息吗?">删除</a>
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
	</div>
</div>
