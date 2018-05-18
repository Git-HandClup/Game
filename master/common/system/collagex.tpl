<div class="pageContent">
	<form method="post" action="handle.php?m=system&c=add&a=dictionary" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">				
				<tr>                        
					<td class="td1">院校信息名称：</td>
					<td class="td2">
						<input type="hidden" name="type" value="collage" />
						<input type="hidden" name="cid" value="0" />
						<input type="hidden" name="lv" value="0" />
						<input type="text" name="title" class="required normal" />
					</td>
				</tr>				
				<tr>
					<td class="td1">院校信息说明：</td>
					<td class="td2">
						<textarea style="height:60px" name="intro"></textarea>
						<ins>(院校信息的详细说明)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="text" name="pid" class="required short digits" value="0" />						
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
