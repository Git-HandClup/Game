<div class="pageContent">
	<form method="post" action="handle.php?m=system&c=add&a=dictionary" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">	
				<tr>
					<td class="td1">所属学科：</td>
					<td class="td2">
						 <input type="hidden" name="type" value="subject"/>
						 <input type="hidden" name="lv" value="2"/>
						 <input type="hidden" name="lookup.nid" class="required digits" disabled="disabled" id="nodeid"/>
                        <input type="text" name="lookup.ntitle" class="required short" value="请选择所属学科" lookupGroup="lookup" disabled="disabled"/>
						 <a class="btnLook" lang="m=system&c=dict&ids=subject&pos=subject&tab=0&flag=p" width="680" height="560" lookupGroup="lookup" title="选择学科">选择学科</a>
						<ins>(必选，专业所属学科。)</ins>
					</td>
				</tr>
				<tr>
					<td class="td1">所属类别：</td>
					<td class="td2">						 
						 <input type="hidden" name="lookup.cid" class="required digits" value=""/>						
                        <input type="text" name="lookup.title" class="required short" value="请选择所属学科" lookupGroup="lookup" disabled="disabled"/>
						 <a class="btnLook" lang="m=system&c=dict&ids=subject&pos=subject&tab=1&cid={nodeid}" width="680" height="560" lookupGroup="lookup" title="选择类别" warn="请先选择学科">选择类别</a>
						<ins>(必选，专业所属类别。)</ins>
					</td>
				</tr>
				<tr>                        
					<td class="td1">专业信息名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" /></td>
				</tr>				
				<tr>
					<td class="td1">专业信息说明：</td>
					<td class="td2">
						<textarea style="height:60px" name="intro"></textarea>
						<ins>(专业信息的详细说明)</ins>
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
