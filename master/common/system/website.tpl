<?php
extract($cfg->website);
?>
<form id="upform" method="post" action="handle.php?m=system&c=setup&tab=website" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone)" enctype="multipart/form-data">
	<div class="pageFormContent" style="border-bottom:1px solid #aec3de">
					<table class="task" width="100%">	
						<tr>
							<td class="td1">站点名称：</td>
							<td class="td2">
								<input type="text" name="cfg_website_name" class="required normal" value="<?php echo $cfg_website_name?>" />
							</td>
						</tr>	
						<tr>
							<td class="td1">网站标题：</td>
							<td class="td2">
								<input type="text" name="cfg_website_title" class="required normal" value="<?php echo $cfg_website_title?>"  />
							</td>
						</tr>
						<tr>
							<td class="td1">网站域名：</td>
							<td class="td2">
								<input type="text" name="cfg_website_domain" class="normal" value="<?php echo $cfg_website_domain?>" />
								<ins>(合法的网址或域名，以http://开头)</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">网站logo预览图</td>
							<td class="td2"><img style="width:120px;" id="up_website_logo"/></td>
						</tr>
						<tr>
							<td class="td1">网站LOGO：</td>
							<td class="td2">
								<input type="text" name="cfg_website_logo" id="cfg_website_logo" class="normal" value="<?php echo $cfg_website_logo?>"/>
								<div class="buttonActive">
									<div class="buttonContent">
										<a class="upload" title="上传文件">本地上传...</a>
										<input type="file" name="up_website_logo" value="<?php echo $cfg_website_key?>" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('cfg_website_logo','logo','up_website_logo')"/>
									</div>
								</div>
								<iframe name="up_website_logo" style="display:none"></iframe>
								<ins>(网站LOGO地址，如有更新，请重新上传)</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">网站关键字：</td>
							<td class="td2">
								<input type="text" name="cfg_website_key" class="long" value="<?php echo $cfg_website_key?>"/>
								<ins>(关键字以英文逗号隔开，控制在128个字符左右)</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">网站描述：</td>
							<td class="td2">
								<textarea style="height:60px" name="cfg_website_desc"><?php echo $cfg_website_desc?></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">版权所有：</td>
							<td class="td2">
								<textarea style="height:60px" name="cfg_website_corp"><?php echo $cfg_website_corp?></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">管理员邮箱：</td>
							<td class="td2">
								<input type="text" name="cfg_website_mail" class="normal" value="<?php echo $cfg_website_mail?>"  />
								<ins>(管理员邮箱地址，如"mellee@foxmail.com")</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">ICP备案号：</td>
							<td class="td2">
								<input type="text" name="cfg_website_cert" class="normal" value="<?php echo $cfg_website_cert?>"  />
								<ins>(ICP备案号，如有备案号，请如实填写)</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">链接模式：</td>
							<td class="td2">
								<select class="combox" name="cfg_website_link" curval="<?php echo $cfg_website_link?>">
									<option value="rewrite">伪静态模式</option>
									<option value="static">纯静态模式</option>
									<option value="dynamic">仅动态模式</option>
								</select>
								<ins>(表示前台展示页所使用的链接方式，除动态模式外，其它模式需要配置链接参数。)</ins>
							</td>
						</tr>
						<tr>
							<td class="td1">链接后缀：</td>
							<td class="td2">
								<input type="text" name="cfg_website_ext" class="short" value="<?php echo $cfg_website_ext?>"/>
								<ins>(动态模式下无需设置后缀，如果是伪静态，建议采用.html后缀,参考：.php,.htm,.html,.shtml)</ins>
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