<div class="pageContent" style="border:0">
	<table class="task" width="100%" style="border:0">		
		<tbody>
			<tr>
				<td>
					<iframe name="statusBar" style="width:100%;height:190px;overflow:hidden" scrolling="no" src="admin.php?m=system&c=process" frameborder="0"></iframe>
				</td>
			</tr>
			<tr>
				<td colspan="7" style="height:30px">
					<font style="color:green">本数据库共计：<b id="bakTable" style="color:red"> -  </b> 张表需要处理。</font>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="formBar" style="border:1px solid #aec3de;border-top:0">
		<form method="get" action="admin.php" target="statusBar"> 
		<ul>
			<input type="hidden" name="m" value="system" />
			<input type="hidden" name="c" value="process" />
			<input type="hidden" name="ids" value="<?php echo $ids?>" />
			<input type="hidden" name="pos" value="<?php echo $pos?>" />
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
		</ul>
		</form>
	</div>
</div>
