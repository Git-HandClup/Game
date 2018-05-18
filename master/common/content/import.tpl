<div class="pageContent">
	<form method="post" action="handle.php?m=import" target="import">
		<div class="pageFormContent" enctype="multipart/form-data">
			<table class="task" width="100%"> 
				<tr>	
					<td class="td1">选择EXCELL文件：</td>
					<td class="td2">
						<select class="required combox" name="path" curval="">
						<option value="">请选择EXCELL文件</option>
						<?php 
						$ext = array();
						$dir = dir('../data/');
						while($file = $dir->read())
						{		
							$ext = explode('.',$file);
							if($ext[1] == 'csv')
								echo '<option>'.$file.'</option>'."\r"; 
						}
						?>
						</select>
					</td>
				</tr>
				<tr>			
					<td class="td1">处理选项：</td>
					<td class="td2">
						<input type="text" name="psize" id="psize" value="20" class="required digits short"/>
						<ins> 个文件</ins>
					</td>
				</tr>
			</table>
			<hr/>
			<fieldset>
				<legend>运行状态</legend>
				<iframe name="import" frameborder="0" id="import" style="width:100%;height:120px;overflow:hidden"></iframe>
			</fieldset>
		</div>
		<div class="formBar" style="border:1px solid #aec3de;border-left:0;border-right:0">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">导入</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>	</li>
			</ul>
		</div>	
	</form>
</div>
