<?php 
$lng = $lang['content']['single'];
if(empty($ids))
	$ids = 'about';
$sg = @include($config['path']['cache'].'item/tps.'.$ids.'.cache');
extract($sg);
?>
<div class="pageContent" style="padding:4px">
	<div class="frameWork" layoutH="10">		
		<h3>单页信息</h3>
		<ul class="tree treeFolder"> 	
			<?php 
				foreach($lng['item'] as $k => $v)
				{
					echo 
					'<li'.($k == $ids ? ' class="hover"' : '').'><a target="navTab" lang="m=content&c=single&ids='.$k.'" rel="single" title="单页信息-'.$v.'">'.$v.'</a></li>';
				}
			?>	
			
		</ul>
	</div>
	<div class="frameSpace">
		<div class="pageContent">
		<form method="post" action="handle.php?m=content&c=single&a=<?php echo $ids?>" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
			<div class="pageFormContent" layoutH="56">
				<table class="task" width="100%">	
					<tr>
						<td class="td1">页面名称：</td>
						<td class="td2">
							<input type="text" name="title" class="required normal" value="<?php echo $title?>" />
							<ins>(页面名称，如"关于我们")</ins>
						</td>
					</tr>					
					<tr>
						<td class="td1">页面关键字</td>
						<td class="td2">
							<input name="keyword" type="text" class="normal" value="<?php echo $keyword?>"/>
							<ins>(页面关键字，多个关键字用,隔开)</ins>
						</td>
					</tr>
					<tr>
						<td class="td1">页面描述：</td>
						<td class="td2">
							<textarea  name="keydesc" style="height:80px"><?php echo $keydesc?></textarea>
						</td>
					</tr>
					<tr>
						<td class="td1">页面内容：</td>
						<td class="td3">&nbsp;</td>
					</tr>
					<tr>
						<td class="td2" colspan="2">
							<input type="hidden" name="udatetimes" value="<?php echo time()?>"/>
							<textarea name="content" class="editor" style="width:100%;height:536px"><?php echo $content?></textarea>
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
	</div>
</div>
