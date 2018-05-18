<?php
$core = new kernel;
$para = new stdclass;
$para->base = new stdclass;
$para->base->tab = 'catalog';
$para->base->method = 'single';
$para->base->cond = 'id='.$get->get->ids;
$core->run($para);
$list = $core->result->data;
?>
<div class="pageContent">
	<form method="post" id="upform" action="handle.php?m=catalog&c=edit&tab=catalog&ids=<?php echo $get->get->ids?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" enctype="multipart/form-data">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">	
				<tr>                        
					<td class="td1">所属频道类型</td>
					<td class="td2">
						<select class="combox require" name="type" curval="<?php echo $list->type?>" rel="m=content&c=ajaxdo&tab=catalog&type={value}" ref="cid">
							<option value="">请选择频道节点</option>
							<option value="news">新闻</option>
							<option value="evaluate">评测</option>
							<option value="technique">攻略</option>
							<option value="video">视频</option>
							<option value="photo">图片</option>
							<option value="game">游戏库</option>
						</select>
						<ins>(必选，所属频道类型)</ins>
					</td>
				</tr>	
				<tr>                        
					<td class="td1">所属父节点：</td>
					<td class="td2">
						<select class="combox" id="cid" curval="<?php echo $list->cid?>" name="cid">
							<option value="0">请选择...</option>
							<?php
								$para->base->cond = "type='".$list->type."' and cid=0";
								$para->base->method = 'select';
								$para->base->order = array('pid asc');
								$core->run($para);
								$std = $core->result;
								
								if($std->total>0){
									foreach($std->data as $k => $v){
										if($list->id == $v->id)
											continue;
										echo '<option value="'.$v->id.'" >'.$v->title.'<option>';
									}
								}
							?>
						</select>
						<ins>(不选择，则表示添加的为顶层节点)</ins>
					</td>
				</tr>	
				<tr>
					<td class="td1">频道节点名称：</td>
					<td class="td2">
						<input type="text" name="title" class="required normal" value="<?php echo $list->title;?>" />
					</td>
				</tr>		
				<tr>
					<td class="td1">搜索引擎优化标题</td>
					<td class="td2">
						<input type="text" name="seotitle" class="normal" />
					</td>
				</tr>
				<tr>
					<td class="td1">频道节点缩略图：</td>
					<td class="td2">
						<input type="text" name="litpic" id="litpic" class="normal"/>
						<div class="buttonActive">
							<div class="buttonContent">
								<a class="upload" title="上传文件">本地上传...</a>
								<input type="file" name="up_litpic"  style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('litpic','catalog','up_litpic')"/>
							</div>
						</div>
						<img id="up_litpic" width="120"/>
						<ins style="clear:both;display:block">(频道节点缩略图：，如有更新，请重新上传)</ins>
					</td>
				</tr>	
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required digits short" value="0" />
					</td>
				</tr>		
				<tr>
					<td class="td1">搜索引擎优化关键字：</td>
					<td class="td2">
						<input type="text" name="keyword" class="normal" />
					</td>
				</tr>			
				<tr>
					<td class="td1">频道节点信息描述：</td>
					<td class="td2">
						<textarea style="height:60px" name="keydesc"></textarea>
						<ins>(类别信息的详细说明)</ins>
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
