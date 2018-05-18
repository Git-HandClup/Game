<?php
$data = $tpl->GetSingleInfo('hotkey','id='.$ids);
extract($data);
$skin = explode(';',$style);
?>
<div class="pageContent">
	<form method="post" action="handle.php?m=hotkey&c=edit&ids=<?php echo $id?>" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform" enctype="multipart/form-data">
		<div class="pageFormContent" layoutH="51">
			<table class="task" width="100%">				
				<tr>                        
					<td class="td1">关键字名称：</td>
					<td class="td2"><input type="text" name="title" class="required normal" value="<?php echo $title?>"/></td>
				</tr>
				<tr>
					<td class="td1">字体颜色：</td>
					<td class="td2">
						<select style="width:152px" onchange="tps.setskin(0,this,'color',this.value)">
							<option style="background:Black;color:Black" value="Black">默认(黑色)</option>
							<option style="background:#5A5A5A;color:#5A5A5A" value="#5A5A5A">灰色</option>
							<option style="background:Red;color:Red" value="Red">红色</option>
							<option style="background:Yellow;color:Yellow" value="Yellow">黄色</option>
							<option style="background:Green;color:Green" value="Green">绿色</option>
							<option style="background:Orange;color:Orange" value="Orange">橙色</option>
							<option style="background:Purple;color:Purple" value="Purple">紫色</option>
							<option style="background:Blue;color:Blue" value="Blue">蓝色</option>
							<option style="background:Brown;color:Brown" value="Brown">褐色</option>
							<option style="background:Teal;color:Teal" value="Teal">墨绿</option>
							<option style="background:Navy;color:Navy" value="Navy">深蓝</option>
							<option style="background:Maroon;color:Maroon" value="Maroon">赭石</option>
							<option style="background:#00FFFF;color: #00FFFF" value="#00FFFF">粉绿</option>
							<option style="background:#7FFFD4;color: #7FFFD4" value="#7FFFD4">淡绿</option>
							<option style="background:#FFE4C4;color: #FFE4C4" value="#FFE4C4">黄灰</option>
							<option style="background:#7FFF00;color: #7FFF00" value="#7FFF00">翠绿</option>
							<option style="background:#D2691E;color: #D2691E" value="#D2691E">综红</option>
							<option style="background:#FF7F50;color: #FF7F50" value="#FF7F50">砖红</option>
							<option style="background:#6495ED;color: #6495ED" value="#6495ED">淡蓝</option>
							<option style="background:#DC143C;color: #DC143C" value="#DC143C">暗红</option>
							<option style="background:#FF1493;color: #FF1493" value="#FF1493">玫瑰红</option>
							<option style="background:#FF00FF;color: #FF00FF" value="#FF00FF">紫红</option>
							<option style="background:#FFD700;color: #FFD700" value="#FFD700">桔黄</option>
							<option style="background:#DAA520;color: #DAA520" value="#DAA520">军黄</option>
							<option style="background:#808080;color: #808080" value="#808080">烟灰</option>
							<option style="background:#778899;color: #778899" value="#778899">深灰</option>
							<option style="background:#B0C4DE;color: #B0C4DE" value="#B0C4DE">灰蓝</option>						
						</select>
						<script>
						$("select").val('<?php $fc = explode(':',$skin[0]);echo $fc[1]?>');
						</script>
						<ins>示例：<tt>这是设置的文字颜色</tt></ins>
					</td>
				</tr>
				<tr>
					<td class="td1">字体样式：</td>
					<td class="td2">
						<select class="combox" curval="<?php $ff = explode(':',$skin[1]);echo $ff[1]?>" onchange="tps.setskin(1,this,'font-family',this.value)">
							<option value="宋体">默认</option>
							<option value="黑体">黑体</option>
							<option value="仿宋">仿宋</option>
							<option value="幼圆">幼圆</option>
							<option value="新宋体">新宋体</option>
							<option value="微软雅黑">微软雅黑</option>
						</select>
						<ins>示例：<tt>这是设置的文字字体</tt></ins>
					</td>
				</tr>
				<tr>
					<td class="td1">文字大小：</td>
					<td class="td2">
						<select class="combox" curval="<?php $fs = explode(':',$skin[2]);echo $fs[1]?>" onchange="tps.setskin(2,this,'font-size',this.value)">
							<option value="14px">默认</option>
							<option value="10px">10px</option>
							<option value="12px">12px</option>
							<option value="14px">14px</option>
							<option value="16px">16px</option>
							<option value="18px">18px</option>
							<option value="20px">20px</option>
						</select>	 
						<ins>示例：<tt>这是设置的文字大小</tt></ins>
					</td>
				</tr>
				<tr>
					<td class="td1">是否加粗：</td>
					<td class="td2">
					<input type="checkbox" style="width:40px" onclick="tps.setskin(3,this,'font-weight','700')"<?php  
					if(isset($skin[3]))
					{
						if(!empty($skin[3]))						
							echo 'checked="checked"';						
					}?>/>
					</td>
				</tr>				
				<tr>
					<td class="td1">排序号：</td>
					<td class="td2">
						<input type="hidden" name="style" id="style" value="<?php echo $style?>"/>
						<input type="text" name="pid" class="required short digits" value="<?php echo $pid?>" />
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
