<?php
extract($cfg->contact);
?>
<form method="post" action="handle.php?m=system&c=setup&tab=contact" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)" id="upform" enctype="multipart/form-data">
	<div class="pageFormContent" style="border-bottom:1px solid #aec3de">
		<table class="task" width="100%">	
			<tr>
				<td class="td1">公司名称：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_company" class="normal" value="<?php echo $cfg_contact_company?>" />					
				</td>
			</tr>				
			<tr>
				<td class="td1">微信号或公众号：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_weixin" class="normal" value="<?php echo $cfg_contact_weixin?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">微博图片预览</td>
				<td class="td2"><img style="width:120px;" id="upfiles"/></td>
			</tr>
			<tr>
				<td class="td1">微信二维码图片：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_wxcode" id="cfg_contact_wxcode" class="normal" value="<?php echo $cfg_contact_wxcode?>"/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="上传文件">本地上传...</a>
							<input type="file" name="upfiles" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('cfg_contact_wxcode','logo','upfiles')"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">微博名称：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_weibo" class="normal" value="<?php echo $cfg_contact_weibo?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">微博图片预览</td>
				<td class="td2"><img style="width:120px;" id=""/></td>
			</tr>
			<tr>
				<td class="td1">微博二维码图片：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_wbcode" id="cfg_contact_wbcode" class="normal" value="<?php echo $cfg_contact_wbcode?>"/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="上传文件">本地上传...</a>
							<input type="file" name="upimgs" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('cfg_contact_wbcode','logo','upimgs')"/>
						</div>						
					</div>
					<iframe name="upimgs" style="display:none"></iframe>
				</td>
			</tr>
			<tr>
				<td class="td1">联系人：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_proxy" class="short" value="<?php echo $cfg_contact_proxy?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">联系手机：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_mobile" class="short" value="<?php echo $cfg_contact_mobile?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">联系电话：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_telphone" class="short" value="<?php echo $cfg_contact_telphone?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">400电话：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_tel400" class="short" value="<?php echo $cfg_contact_tel400?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">联系QQ：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_tencentq" class="short" value="<?php echo $cfg_contact_tencentq?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">电子邮箱：</td>
				<td class="td2">
					<input type="text" name="cfg_contact_foxmail" class="normal" value="<?php echo $cfg_contact_foxmail?>"  />
				</td>
			</tr>
			<tr>
				<td class="td1">联系地址：</td>
				<td class="td2">
					<textarea style="height:60px" name="cfg_contact_address"><?php echo $cfg_contact_address?></textarea>
				</td>
			</tr>
			<tr>
				<td class="td1">办公地址：</td>
				<td class="td2">
					<textarea style="height:60px" name="cfg_contact_location"><?php echo $cfg_contact_location?></textarea>
				</td>
			</tr>
		</table>  
		<div class="formBar" style="border:1px solid #aec3de;border-top:0">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>	</li>
			</ul>
		</div>
	</div> 
</form>