<div class="tabs" style="border-bottom:1px solid #aec3de;background:#fff">
	<div class="tabsHeader">
		<div class="tabsHeaderContent">
			<ul>
				<li><a><span>基本信息</span></a></li>
				<li><a><span>推广信息</span></a></li>
				<li><a><span>详细内容</span></a></li>					
			 </ul>
		</div>
	</div>
	<form method="post" action="handle.php?m=<?php echo $pos?>&c=add" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
	<div class="tabsContent" style="padding:0"> 
	<div class="pageFormContent" style="border-top:0">				
		<table class="task" width="100%"> 
			<tr>
				<td class="td1">所属频道节点：</td>
				<td class="td2">
					<select name="cid" class="required combox" curval="">
						<option value="">请选择频道节点</option>
						<?php 
						$list = $tpl->GetInfoList('catalog',0,"type='goods'",'pid','asc');
						foreach($list as $k => $v)
						{
							echo '<option value="'.$v['id'].'">'.$v['title'].'</option>';
						}
						?>
					</select>
					<ins>(必选，信息所属频道节点.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品状态：</td>
				<td class="td2">
					<select name="fid" class="required combox" curval="">
						<option value="">请选择商品状态</option>
						<option value="1">正常销售</option>
						<option value="100">热门推荐</option>	
						<option value="0">下架商品</option>	
					</select>
					<ins>(必选，商品信息状态，库存商品表示该商品仅入库，不上架。)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品名称：</td>
				<td class="td2">
					<input type="text" name="title" class="required normal" value="" />
					<ins>(不能为空，控制在64个汉字以内.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品编号：</td>
				<td class="td2">
					<input type="text" name="pid" class="required digits short" value="0" />
					<ins>(商品编号，由公司自行决定.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品价格：</td>
				<td class="td2">
					<input type="text" name="price" class="required digits short" value="0" />
					<ins>(商品价格，请填写售价100倍.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品库存：</td>
				<td class="td2">
					<input type="text" name="volume" class="required digits short" value="0" />
					<ins>(商品库存，商品目前最大库存量.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">商品折扣：</td>
				<td class="td2">
					<input type="text" name="percent" class="required digits short" value="0" />
					<ins>(商品折扣，默认为0，表示商品进货入库价.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">折扣金额：</td>
				<td class="td2">
					<input type="text" name="money" class="required digits short" value="0" />
					<ins>(商品折扣金额，默认为0，请填写金额的100倍.)</ins>
				</td>
			</tr>	
			<tr>
				<td class="td1">详情页地址：</td>
				<td class="td2">
					<input type="text" name="infourl" class="long" value="" />
					<ins>(商品详情页地址，部分产品可以是某个单页)</ins>
				</td>
			</tr>			
			<tr>
				<td class="td1">缩略图：</td>
				<td class="td2">
					<input name="litpic" id="litpic" type="text" class="normal"/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="上传文件">本地上传...</a>
							<input type="file" id="upfiles" name="upfiles" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('litpic','upfiles')"/>
						</div>
					</div>
					<iframe name="upfrm" style="display:none"></iframe>
				</td>
			</tr>
			<tr>
				<td class="td1">图片列表：</td>
				<td class="td2">
					<input id="picname" type="text" class="normal" readonly="readonly"/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="上传文件">本地上传...</a>
							<input type="file" id="upimgs" name="upimgs" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('picname','upimgs')"/>
						</div>
					</div>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" onclick="tps.add('picname','piclist')">附加到列表</a>
						</div>
					</div>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" onclick="tps.clear('piclist')">清空列表</a>
						</div>
					</div>
					<textarea  name="piclist" id="piclist" style="height:60px;line-height:18px;margin-top:4px" readonly="readonly"></textarea>
				</td>
			</tr>
			<tr>
				<td class="td1">节点关键字</td>
				<td class="td2">
					<input name="keyword" type="text" value=""/>
					<ins>(节点关键字，多个关键字用,隔开)</ins>
				</td>
			</tr>				
			<tr>
				<td class="td1">摘要信息：</td>
				<td class="td2">
					<textarea name="keydesc" style="height:60px"></textarea>
				</td>
			</tr> 
		</table>			
	</div>
	</div>	
	<div class="tabsContent" style="padding:0">
		<div class="pageFormContent" style="border-top:0">
			<table class="task" width="100%">
				<tr>
					<td class="td1">推广平台：</td>
					<td class="td2">
						<select name="platform" class="required combox" curval="">
							<option value="">请选择推广平台</option>
							<option value="tm">天猫</option>
							<option value="tb">淘宝</option>
							<option value="jd">京东</option>
						<ins>(推广平台，更多平台敬请期待.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券编号：</td>
					<td class="td2">
						<input type="text" name="coupon" class="required normal" value="" />
						<ins>(优惠券编号，以优惠券系统生成的编号为准.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券数量：</td>
					<td class="td2">
						<input type="text" name="maxtotal" class="required digits short" value="0" />
						<ins>(优惠券数量，系统共发行多少张优惠券.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券剩余量：</td>
					<td class="td2">
						<input type="text" name="mintotal" class="required digits short" value="0" />
						<ins>(优惠券剩余数量，优惠券总量减去使用量得到.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券面值：</td>
					<td class="td2">
						<input type="text" name="discount" class="required normal" value="" />
						<ins>(优惠券面值，如使用购物满多少减多少，<font>满8元减1元</font>.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券有效期起始时间：</td>
					<td class="td2">
						<input type="text" name="sdatetimes" class="required date short" value="" />
						<ins>(优惠券有效期起始时间.)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券有效期结束时间：</td>
					<td class="td2">
						<input type="text" name="edatetimes" class="required date short" value="" />
						<ins>(优惠券有效期结束时间.)</ins>
					</td>
				</tr>
				
				<tr>
					<td class="td1">店铺ID：</td>
					<td class="td2">
						<input type="text" name="seller" class="normal" value="" />
						<ins>(商品来源的店铺ID)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">店铺名称：</td>
					<td class="td2">
						<input type="text" name="store" class="normal" value="" />
						<ins>(商品来源的店铺名称)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">店铺客服：</td>
					<td class="td2">
						<input type="text" name="contact" class="normal" value="" />
						<ins>(店铺客户人员联系方式，如旺旺，QQ等)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券领取地址：</td>
					<td class="td2">
						<input type="text" name="acturl" class="long" value="" />
						<ins>(优惠券领取地址)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">优惠券推广地址：</td>
					<td class="td2">
						<input type="text" name="actpath" class="long" value="" />
						<ins>(优惠券领取地址)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">商品推广地址：</td>
					<td class="td2">
						<input type="text" name="taokeurl" class="long" value="" />
						<ins>(商品推广地址)</ins>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="tabsContent" style="padding:0">   
		<div class="pageFormContent" style="border-top:0">
			<table class="task" width="100%">		                                              
				<tr>
					<td class="td1">详细内容：</td>
					<td class="td2"><ins>详细内容支持类似WORD形式的图文混排</ins></td>
				</tr>
				<tr>
					<td class="td2" colspan="2">
						<input type="hidden" name="udatetimes" value="<?php echo time();?>"/>
						<textarea name="content" tool="full" class="editor require" style="width:100%;height:544px;"></textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="formBar" style="border-left:1px solid #aec3de;border-right:1px solid #aec3de;border-bottom:0">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
	</div>
 </form>
</div>
</div>
