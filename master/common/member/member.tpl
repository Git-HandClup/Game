<?php
$psize = 16;
$condition = '1=1';
if(!isset($pageNum))
	$pageNum = 1;
if(!empty($keyword))
	$condition .= " and username like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<form id="pagerForm" method="post" action="admin.php?m=ucenter&c=member">
	<input type="hidden" name="pageNum" value="<?php echo $pageNum;?>" />
	<input type="hidden" name="keyword" value="<?php echo $keyword;?>" />
</form>
<div class="pageContent">	
	
		<div class="pageHeader">
			<form action="admin.php?m=ucenter&c=member" method="post" onsubmit="return navTabSearch(this)" >
			<div class="searchBar">
				<ul class="searchContent">
					<li><label>用户检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字"/></li>                        
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
				<li><a class="delete" target="selectedTodo" lang="examine" rel="member" ids="ids" pos="0" postType="string" title="是否立即审核该用户"><span>批量审核用户</span></a></li>
				<li><a class="delete" target="selectedTodo" lang="purge"  rel="member" ids="ids" pos="100" postType="string"  title="确实要删除这些用户吗?"><span>批量删除用户</span></a></li>								
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="4%">序号</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>用户等级</th>
					<th>用户积分</th>
					<th>帐户余额</th>
					<th>登录次数</th>
					<th>最后登录IP</th>
					<th>用户状态</th>
					<th>帐户创建时间</th>
					<th>最后登录时间</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$list = $tpl->GetSplitList('member',$pageNum,$psize,$condition,'fid','desc');
				if(count($list>0))
				{
					foreach($list as $k => $v)
					{
						echo '<tr target="sltobj" rel="'.$v['id'].'">
						<td><input name="ids" type="checkbox" value="'.$v['id'].'" /></td>
						<td>'.($k+1).'</td>
						<td>'.$v['username'].'</td>
						<td>'.$tpl->GetUser($v['id'],'userinfo','realname').'</td>
						<td>'.($tpl->GetUser($v['id'],'userinfo','sex') == 0?'男':'女').'</td>
						<td>'.$v['rank'].' 级</td>
						<td>'.$v['score'].' 分</td>
						<td>'.$v['money'].' 元</td>
						<td>'.$v['logintotal'].' 次</td>
						<td>'.$v['loginip'].' 次</td>						
						<td>'.($v['fid']==0?'<font style="color:green">正常</font>':($v['fid'] == 1?'<font style="color:gray">未审核</font>':'<font style="color:red">已禁用</a>')).'</td>						
						<td>'.date('Y-m-d',$v['cdatetimes']).'</td>
						<td>'.date('Y-m-d',$v['udatetimes']).'</td>
						<td>
							<a class="btnSelect" target="ajaxTodo" lang="examine" rel="member" ids="'.$v['id'].'" pos="0" title="是否立即审核该用户">审核用户</a>							
							<a class="btnDel" target="ajaxTodo" lang="purge" rel="member" ids="'.$v['id'].'" pos="100"  title="确定要删除当前用户吗?">删除用户</a>
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
