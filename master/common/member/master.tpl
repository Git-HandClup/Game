<?php
$condition = '1=1';
if(!empty($keyword))
	$condition .= " and username like '%" .$keyword. "%'";
else
	$keyword = '';
?>
<div class="pageContent">	
	<div class="pageContent">
		<div class="pageHeader">
			<form action="admin.php?m=member&c=master" method="post" onsubmit="return navTabSearch(this)" >
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
				<li><a class="add" lang="m=member&c=masterx" width="420" height="210" target="dialog"><span>添加管理员</span></a></li>
				<li><a class="edit" lang="m=member&c=mastery&ids={sltobj}" width="420" height="210" target="dialog"><span>修改管理员</span></a></li>
				<li><a class="delete" lang="m=member&c=clear&tab=master" ids="ids" postType="string" target="selectedTodo" title="确实要删除这些记录吗?"><span>批量删除管理员</span></a></li>								
			</ul>
		</div>
		<table class="list" width="100%" layoutH="90">
			<thead>
				<tr>
					<th width="4%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="4%">序号</th>
					<th>用户名称</th>
					<th width="12%">用户角色</th>
					<th width="8%">登录次数</th>
					<th width="10%">创建时间</th>
					<th width="10%">最后登录日期</th>                                
					<th width="8%">最后登录地址</th>
					<th width="12%">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$k = 1;				
				$sql['cond'] = $condition;
				$sql['length'] = 0;
				$sql['table'] = 'master';
				$sql['sort'] = 'udatetimes desc';
				$core->parameter($sql);
				$core->item();				
				$list = $core->result;
				if($list['total'] > 0)
				{
					foreach($list['data'] as $v)
					{
						echo 
						'<tr target="sltobj" rel="'.$v->id.'">
							<td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
							<td>'.$k.'</td>
							<td class="pad">'.$v->username.'</td>
							<td>'.$v->role.'</td>
							<td>'.$v->logintotal.'</td>
							<td>'.date('Y-m-d H:i:s',$v->cdatetimes).'</td>
							<td>'.date('Y-m-d H:i:s',$v->udatetimes).'</td>
							<td>'.$v->ipaddress.'</td>
							<td>
								<a class="btnEdit" lang="m=member&c=mastery&ids='.$v->id.'" width="420" height="210" target="dialog" title="修改管理员">编辑</a>
								<a class="btnDel" lang="m=member&c=clear&tab=master&ids='.$v->id.'" target="ajaxTodo" title="确定要删除当前信息吗?">删除</a>
							</td>
						</tr>';	
						$k++;
					}
				}
				else
					echo '<tr><td colspan="8"><font>暂无相关信息</font></td></tr>';
			?>	                
			</tbody>
		</table>
		<div class="panelBar">
		<div class="pages">                
			<span>每页显示 <b><?php echo $list['total']?></b> 个项目&nbsp;</span>
			<span>总计 <b><?php echo $list['total']?></b> 个项目&nbsp;</span>
		</div>        
		<div class="pagination" targetType="navTab" totalCount="1" numPerPage="1" pageNumShown="1" currentPage="1"></div>
	</div>
	</div>
</div>
