<div class="pageContent">
	<form method="post" action="handle.php?m=attach&c=add&a=adv&pos=0" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">	
				<tr>
					<td class="td1">广告类型：</td>
					<td class="td2">
						<input type="radio" class="cbx" name="fid" value="0" checked="true"/>普通广告
						<input type="radio" class="cbx" name="fid" value="1"/>代码广告
						<ins style="display:block">(普通广告在下方的代码文本中无须填写代码。)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">广告版位：</td>
					<td class="td2">
						<select name="cid" class="required digits combox" curval="">
						<?php
							$sql['length'] = 0;
							$sql['table'] = 'adzone';
							$sql['sort'] = 'pid asc';
							$core->parameter($sql);
							$core->item();				
							$list = $core->result;
							if($list['total'] > 0)
							{
								echo '<option value="">请选择广告版位</option>';
								foreach($list['data'] as $v)
								{
									echo '<option value="'.$v->id.'">'.$v->title.'</option>';
								}
							}
							else
							{
								echo '<option value="">请先设置广告位</option>';
							}
						?>
						</select>
						<ins>(必选，广告所属类型或版位.)</ins>
					</td>
				</tr>
				<tr>                        
					<td class="td1">广告名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" /></td>
				</tr>
				<tr>
					<td class="td1">广告地址：</td>
					<td class="td2"><input type="text" name="url" class="required normal" /></td>
				</tr>
				<tr>
					<td class="td1">广告图片：</td>
					<td class="td2">
						<input name="img" id="img" type="text" class="normal" value=""/>
						<div class="buttonActive">
							<div class="buttonContent">
								<a class="upload" title="上传文件">本地上传...</a>
								<input type="file" name="up_adv_img" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('img','adv','up_adv_img')"/>
							</div>
						</div>
						<iframe name="up_adv_img" style="display:none"></iframe>
					</td>
				</tr>
				<tr>
					<td class="td1">广告起始时间：</td>
					<td class="td2">
						<input type="text" name="sdatetimes" readonly="readonly" class="required short date" value="<?php echo date('Y-m-d',time())?>"/>
						<ins>(开始时间，直接点击选取时间即可)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">广告结束时间：</td>
					<td class="td2">
						<input type="text" name="edatetimes" readonly="readonly" class="required short date" value="<?php echo date('Y-m-d',time() + 3600 * 24 * 7)?>"/>
						<ins>(结束时间，直接点击选取时间即可)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">广告代码：</td>
					<td class="td2">
						<textarea style="height:60px" name="code"></textarea>
						<ins>(广告代码，填写或复制JS广告代码即可)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required short digits" value="0" />
						<input type="hidden" name="udatetimes" value="<?php echo time()?>" />
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
