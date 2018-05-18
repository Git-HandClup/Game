<?php
$psize = 30;
$condition = '1=1';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($pos))
	$condition .= ' and cid=' . $pos;
if(!empty($keyword))
	$condition .= " and title like '%" .$keyword. "%'";
else
	$keyword = '';
?>

<form id="pagerForm" method="post" action="admin.php?m=content&c=goods">
	<input type="hidden" name="ids" value="<?php echo isset($ids)?$ids:'';?>" />
	<input type="hidden" name="pos" value="<?php echo isset($pos)?$pos:'';?>" />
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent" style="padding:4px">
	<div class="frameWork" layoutH="10">
		<h3 style="color:#f00;padding:0 0 0 24px;font:700 14px/24px '';background:url(/master/skin/manage/images/ico.gif) no-repeat 4px 6px">频道节点</h3>
		<ul class="tree treeFolder">  			
			<li><a href="javascript:void(0);">商品分类</a>
				<ul>
					<?php
					$list = $tpl->getInfoList('catalog',0,"type='goods'",'pid','asc');
					foreach($list as $k => $v)
					{
						echo '<li><a target="navTab" lang="content" rel="goods" ids="'.$ids.'" pos="'.$v['id'].'"  title="商品中心-'.$v['title'].'">'.$v['title'].'</a></li>';
					}
					?>
					<li><a target="navTab" lang="content" rel="goods" ids="0" pos="0"  title="商品中心-冗余数据处理">冗余数据处理</a></li>
				</ul>
			</li>			
		</ul>
	</div>
	<div class="frameSpace" layoutH="10">
		<div class="pageContent">
			<div class="pageHeader">
				<form action="admin.php?m=content&c=goods&ids=<?php echo isset($ids)?$ids:'';?>&pos=<?php echo isset($pos)?$pos:'';?>" method="post" onsubmit="return navTabSearch(this)" >
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
					<li><a class="add" target="dialog" lang="content" rel="addgoods" pos="<?php echo $ids?>" width="850" height="0"><span>添加商品</span></a></li>
					<li><a class="edit" target="dialog" lang="content" rel="editgoods" ids="{sltobj}" pos="<?php echo $ids?>" width="850" height="0"><span>修改商品</span></a></li>
					<li><a class="add" target="selectedTodo" lang="examine"  rel="<?php echo $ids?>" ids="ids" pos="100" postType="string"  title="确实要推荐这些商品吗?"><span>批量推荐商品</span></a></li>	
					<li><a class="add" target="selectedTodo" lang="examine"  rel="<?php echo $ids?>" ids="ids" pos="1" postType="string"  title="确实要上架这些商品吗?"><span>批量上架商品</span></a></li>	
					<li><a class="delete" target="selectedTodo" lang="examine"  rel="<?php echo $ids?>" ids="ids" pos="0" postType="string"  title="确实要下架这些商品吗?"><span>批量下架商品</span></a></li>	
					<li><a class="delete" target="selectedTodo" lang="purge"  rel="<?php echo $ids?>" ids="ids" pos="2" postType="string"  title="确实要删除这些记录吗?"><span>批量删除商品</span></a></li>	
					<li><a class="icon" target="navTab" lang="content" rel="import"  width="850" height="0"><span>导入商品信息</span></a></li>					
				</ul>
			</div>
			<table class="list" width="100%" layoutH="101">
				<thead>
					<tr>
						<th width="40"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
						<th width="40">序号</th>
						<th>频道节点</th>
						<th width="480">商品名称</th>
						<th>所属店铺</th>
						<th>平台类型</th>
						<th>商品价格</th>
						<th>折扣比率</th>
						<th>折扣金额</th>
						<th>优惠券面额</th>
						<th>有效期</th>						
						<th>入库时间</th>
						<th>商品状态</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
				<?php
					$list = $tpl->GetSplitList('goods',$pageNum,$psize,$condition,'fid,udatetimes','desc,desc');
					if(count($list>0))
					{
						foreach($list as $k => $v)
						{
							echo '<tr target="sltobj" rel="'.$v['id'].'">
							<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
							<td>'.($k+1).'</td>
							<td>'.$tpl->GetField($v['cid'],'catalog','title').'</td>
							<td class="pad">
								<a href="/goods/detail/'.$v['id'].'" title="预览" target="_blank" style="display:block;width:480px;height:30px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">'.$v['title'].'</a> 
							</td>
							<td class="pad">'.$v['store'].'</td>
							<td>'.$tpl->GetStatus($v['platform']).'</td>
							<td>'.sprintf('%.2f',($v['price'] / 100)).' 元</td>
							<td>'.sprintf('%.2f',($v['percent'] / 100)).'%</td>
							<td>'.sprintf('%.2f',($v['money'] / 100)).' 元</td>
							<td>'.$v['discount'].'</td>
							<td>'.$tpl->floorTime($v['sdatetimes'],$v['edatetimes']).'天</td>
							<td>'.date('Y-m-d',$v['udatetimes']).'</td>
							<td>'.$tpl->GetStatus($v['fid']).'</td>
							<td>									
								<a class="btnEdit" target="dialog" lang="content" rel="editgoods" ids="'.$v['id'].'" pos='.$ids.' width="850" height="0" title="修改商品">修改商品</a>	
								<a class="btnDel" target="ajaxTodo" lang="purge" rel="'.$ids.'" ids="'.$v['id'].'" pos="1"  title="确定要删除当前商品信息吗?">删除商品</a>
								<a class="btnView" target="_blank" href="/goods/detail/'.$v['id'].'" title="预览商品">预览商品</a>
								'.($v['fid'] == 0 ? '<a class="btnSelect" target="ajaxTodo" lang="examine"  rel="'.$ids.'" ids="'.$v['id'].'" pos="1" postType="string"  title="确实要上架这些商品吗?">上架商品</a>':'').'
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
