<?php
$psize = 16;
$condition = '1=1';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($keyword))
	$condition .= " and sno like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<form id="pagerForm" method="post" action="admin.php?m=content&c=payment">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	
		<div class="pageHeader">
			<form action="admin.php?m=content&c=payment" method="post" onsubmit="return navTabSearch(this)" >
			<div class="searchBar">
				<ul class="searchContent">
					<li><label>订单检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字"/></li>                        
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
				<li><a class="edit" target="selectedTodo" lang="examine" rel="payment" ids="ids" pos="100" postType="string" title="立即结算该订单？"><span>批量结算订单</span></a></li>
				<li><a class="delete" target="selectedTodo" lang="purge"  rel="payment" ids="ids" pos="2" postType="string"  title="确实要删除这些订单吗?"><span>批量删除订单</span></a></li>								
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="30">序号</th>
					<th>订单编号</th>
					<th>产品列表</th>
					<th>产品单价</th>
					<th>订购数量</th>
					<th>总数量</th>
					<th>订单金额</th>
					<th>订单状态</th>
					<th>创建时间</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$list = $tpl->GetSplitList('payment',$pageNum,$psize,$condition,'fid','asc');
				if(count($list>0))
				{
					foreach($list as $k => $v)
					{
						echo '<tr target="sltobj" rel="'.$v['id'].'">
						<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
						<td>'.($k+1).'</td>
						<td>'.$v['sno'].'</td>
						<td class="pad">'.$tpl->GetArrList($v['pid'],$v['module'],'p').'</td>
						<td>'.$tpl->GetArrList($v['price']).'</td>
						<td>'.$tpl->GetArrList($v['num']).'</td>
						<td>'.$v['total'].'</td>						
						<td>'.$v['money'].'</td>		
						<td>'.($v['fid']==0?'<font style="color:red">结算中</font>':($v['fid'] == 1?'<font style="color:gray">已失效</font>':'<font style="color:green">已结算</a>')).'</td>							
						<td>'.date('Y-m-d',$v['cdatetimes']).'</td>
						<td>
							<a class="btnSelect" target="ajaxTodo" lang="examine" rel="payment" ids="'.$v['id'].'" pos="100" title="立即结算该订单？">立即结算</a>							
							<a class="btnDel" target="ajaxTodo" lang="purge" rel="service" ids="'.$v['id'].'" pos="1"  title="确定要删除当前信息吗?">删除</a>
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
