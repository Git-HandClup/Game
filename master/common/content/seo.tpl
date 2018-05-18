<?php
if(empty($ids))
	$ids = 'news';
$condition = "type='".$ids."'";
$data = $tpl->GetSingleInfo('seo',$condition);	
extract($data);
?>
<div class="pageContent" style="padding:4px">
	<div class="frameWork" layoutH="10">
		<h3 style="color:#f00;padding:0 0 0 24px;font:700 14px/24px '';background:url(/master/skin/manage/images/ico.gif) no-repeat 4px 6px">优化项目</h3>
		<ul class="tree treeFolder expand">
			<li><a target="navTab" lang="content" rel="seo" ids="guide" title="SEO-评测导购">评测导购</a></li>	
			<li><a target="navTab" lang="content" rel="seo" ids="coupon" title="SEO-发现好券">发现好券</a></li>	
			<li><a target="navTab" lang="content" rel="seo" ids="promotion" title="SEO-特品特惠">特品特惠</a></li>	
			<li><a target="navTab" lang="content" rel="seo" ids="haitao" title="SEO-海外代购">海外代购</a></li>				
			<li><a target="navTab" lang="content" rel="seo" ids="store" title="SEO-店铺平台">店铺平台</a></li>				
		</ul>
	</div>
	<div class="frameSpace" layoutH="10">
		<form method="post" action="handle.php?m=seo&c=save&ids=<?php echo isset($id)?$id:'0';?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
			<div class="pageFormContent">				
				<table class="task" width="100%">					
					<tr>
						<td class="td1">SEO标题</td>
						<td class="td2">
							<input type="hidden" name="type" class="long" value="<?php echo $ids;?>" />
							<input type="text" name="title" class="long" value="<?php echo $title;?>" />
							<ins>(SEO标题，控制在64个汉字以内.)</ins>
						</td>
					</tr>	
					<tr>
						<td class="td1">SEO关键字</td>
						<td class="td2">
							<input type="text" name="keyword" class="long" value="<?php echo $keyword;?>" />
							<ins>(SEO关键字，控制在128个汉字以内.)</ins>
						</td>
					</tr>				
					<tr>
						<td class="td1">SEO描述信息：</td>
						<td class="td2">
							<textarea  name="keydesc" style="height:80px"><?php echo $keydesc;?></textarea>
						</td>
					</tr> 
				</table>
				<div class="formBar" style="border:1px solid #b8d0d6;border-top:0">
					<ul>
						<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
						<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
					</ul>
				</div>			
			</div>	
		</form>		
	</div>
</div>
