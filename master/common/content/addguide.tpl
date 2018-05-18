<div class="pageContent">
<form method="post" action="handle.php?m=guide&c=add" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
	<div class="pageFormContent" layoutH="50">				
		<table class="task" width="100%" style="margin-bottom:6px"> 
			<tr>
				<td class="td1">??????:</td>
				<td class="td2">
					<select name="cid" class="required combox" curval="">
						<option value="">???????</option>
						<?php 
						
						?>
					</select>
					<ins>(??,????????.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">????:</td>
				<td class="td2">
					<input type="text" name="title" class="required normal" value="" />
					<ins>(????,???64?????.)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">????:</td>
				<td class="td2">
					<input type="text" name="author" class="short" value="???" />
					<ins>(????,?"???".)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">???:</td>
				<td class="td2">
					<input name="litpic" id="litpic" type="text" class="normal" value=""/>
					<div class="buttonActive">
						<div class="buttonContent">
							<a class="upload" title="????">????...</a>
							<input type="file" id="upfiles" name="upfiles" value="" style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;" onchange="tps.upload('litpic','upfiles')"/>
						</div>
					</div>
					<iframe name="upfrm" style="display:none"></iframe>
				</td>
			</tr>
		   <tr>
				<td class="td1">?????</td>
				<td class="td2">
					<input name="keyword" type="text" value=""/>
					<ins>(?????,??????,??)</ins>
				</td>
			</tr>
			<tr>
				<td class="td1">????:</td>
				<td class="td2">
					<textarea  name="keydesc" style="height:60px"></textarea>
				</td>
			</tr>                                                    
			<tr>
				<td class="td1">????:</td>
				<td class="td2"><ins>????????WORD???????</ins></td>
			</tr>
			<tr>
				<td class="td2" colspan="2">
					<input type="hidden" name="cdatetimes" value="<?php echo time();?>"/>
					<input type="hidden" name="udatetimes" value="<?php echo time();?>"/>
					<input type="hidden" name="hits" value="<?php echo rand(100,500);?>"/>
					<textarea name="content" tool="full" class="editor require" style="width:100%;height:350px;"></textarea>
				</td>
			</tr>
		</table>			
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">??</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">??</button></div></div></li>
		</ul>
	</div>
	</form>
</div>
