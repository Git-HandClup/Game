<form id="pagerForm" method="post" action="admin.php?m=content&c=catalog">
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" lang="m=content&c=catalogx" rel="catalogx" target="dialog" height="462"><span>增加频道节点 </span> </a> </li>
				<li><a class="edit" lang="m=content&c=catalogy&ids={option}" rel="catalogx" target="dialog" height="462"><span>修改频道节点 </span> </a> </li>
				<li><a class="delete" lang="m=catalog&c=clear&tab=catalog" ids="ids" postType="string" target="selectedTodo" title="是否删除所选择的记录？"><span>删除频道节点 </span> </a> </li>
				<li><a class="view" lang="m=catalog&c=order&tab=catalog" ids="ids" postType="string" target="selectedTodo"><span>更新频道排序 </span> </a> </li>
			</ul>
		</div>
		<table class="list" width="100%" layoutH="26">
			<thead>
				<tr target="option">
					<th width="40"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
					<th width="40">序号</th>
					<th width="40">ID</th>
					<th width="120">频道节点标识</th>
					<th width="160">所属父节点</th>
					<th>频道节点名称</th>
					<th width="80">文档数量</th>
					<th width="80">排序号</th>
					<th width="180">操作</th>
				</tr>
			</thead>
			<tbody>
			<?php
				$core = new kernel;
				$para = new stdclass;
				$para->base = new stdclass;
				$para->base->tab = 'catalog';
				$para->base->num = 20;
				$para->base->order = array('pid asc');
				$core->run($para);
				$obj = $core->result;
				$lng=$cfg->language['catalog']['type'];
				if($obj->total > 0){
					foreach($obj->data as $k => $v){
						echo' 
						<tr target="option" rel="'.$v->id.'" class="trbgs">
							<td><input type="checkbox" name="ids" value="'.$v->id.'"></td>
							<td>'.($k+1).'</td>
							<td>'.$v->id.'</td>
							<td>'.$lng[$v->type].'</td>
							<td >';
							if($v->cid==0)
								echo '<font>顶层节点</font>';
							else
								echo $core->node($v->cid);
							
							echo '</td>
							<td class="pad">'.$v->title.'</td>
							<td>'.$v->total.'条</td>
							<td>
								<input type="text" id="pid_'.$v->id.'" class="ipt" value="'.$v->pid.'" />
							</td>
							<td class="pad">
								<a class="btnEdit" lang="m=content&c=catalogy&ids='.$v->id.'" rel="catalogy" target="dialog" height="464">修改频道节点</a>
								<a class="btnDel" lang="m=catalog&c=clear&tab=catalog&ids='.$v->id.'" target="ajaxTodo" title="是否删除本条记录">删除</a>
							</td>
						</tr>';
					}
					
				}else{
					echo '<tr><td colspan="9"><font color="red"> 暂无相关数据</font></td></tr>';
				}
			?>
			</tbody>
		</table>
	</div>
</form>