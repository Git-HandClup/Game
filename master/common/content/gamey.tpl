<?php
	$core = new kernel;
	$sql = new stdclass;
	$sql->base = new stdclass;
$sql->base->tab ='gamebox';
$sql->base->cond = "id=".$get->get->ids;
$sql->base->order = null;
$sql->base->method = 'single';
$sql->base->num = 1;
$core->run($sql);
$data = $core->result->data;

$sql->base->tab='catalog';
$sql->base->cond = 'id='.$data->cid;
$sql->base->field = ' id,cid,title ';
$core->run($sql);
$sub = $core->result->data;

$sql->base->cond = 'id='.$sub->cid;
$core->run($sql);
$parent = $core->result->data;
?>
<div class="pageContent">
    <form method="post" action="handle.php?m=content&c=edit&tab=gamebox&ids=<?php echo $get->get->ids ?>"
          class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)" id="upform"
          enctype="multipart/form-data">
        <div class="pageFormContent" layoutH="50">
            <table class="task" width="100%" style="margin-bottom:6px">
                <tr>
                    <td class="td1">所属频道顶层节点：</td>
                    <td class="td2">
                        <select name="xx" class="required combox" name="cid" curval="<?php echo $parent->id?>">
                            <option value="">请选择频道顶层节点</option>
                            <?php
							$sql->base->cond = "type='game' and cid =0 ";
                            $sql->base->order = array('pid asc');
                            $sql->base->num = 0;
                            $sql->base->method = '';
                            $core->run($sql);
                            $node = $core->result;
                            if($node->total>0){
                            foreach($node->data as $k => $v){
                            echo '
                            <option value="'.$v->id.'">'.$v->title.'</option>
                            ';
                            }
                            }
                            ?>
                        </select>
                        <ins>(必选，信息所属频道顶层节点.)</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td1">游戏名称：</td>
                    <td class="td2">
                        <input type="text" name="title" class="required normal" value="<?php echo $data->title?>"/>
                        <ins>(不能为空，控制在64个汉字以内.)</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td1">游戏状态：</td>
                    <td class="td2">
                        <?php
                            foreach($cfg->language['content']['status'] as $k=>$v)
                        {
                        $fid=explode(',',$data->fid);
                        echo $v.'：<input type="checkbox" name="fid[]" class="cbx" value="'.$k.'"'.(in_array($k,$fid) ?
                        'checked="true"' : '').' />';
                        }
                        ?>
                    </td>
                </tr>
                <tr>
                    <td class="td1">游戏运营商</td>
                    <td class="td2">
                        <input type="text" name="platform" class="short" value="<?php echo $data->platform?>"/>
                        <ins>(信息来源，如"腾讯游戏".)</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td1">缩略图：</td>
                    <td class="td2">
                        <input name="litpic" id="litpic" type="text" class="normal" value="<?php echo $data->litpic?>"/>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <a class="upload" title="上传文件">本地上传...</a>
                                <input type="file" id="upfiles" name="upfiles" value=""
                                       style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;"
                                       onchange="tps.upload('litpic','info','upfiles')"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td1">专区图：</td>
                    <td class="td2">
                        <input name="banner" id="banner" type="text" class="normal" value="<?php echo $data->banner?>"/>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <a class="upload" title="上传文件">本地上传...</a>
                                <input type="file" id="up_banner" name="up_banner" value=""
                                       style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;"
                                       onchange="tps.upload('banner','litpic','up_banner')"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td1">游戏地址：</td>
                    <td class="td2">
                        <input name="url" id="url" type="text" class="normal" value="<?php echo $data->url?>"/>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <a class="upload" title="上传文件">本地上传...</a>
                                <input type="file" id="up_url" name="up_url" value=""
                                       style="margin-left:-90px;width:90px;height:21px;background:transparent;text-indent:-9990px;"
                                       onchange="tps.upload('url','file','up_url')"/>
                            </div>
                        </div>
                        <ins style="display: block; clear:both;">(填写游戏的下载地址或试玩地址，如有必要，可以本地上传)</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td1">节点关键字</td>
                    <td class="td2">
                        <input name="keyword" type="text" value="<?php echo $data->keydesc?>"/>
                        <ins>(节点关键字，多个关键字用,隔开)</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td1">摘要信息：</td>
                    <td class="td2">
					<textarea name="keydesc" style="height:60px">
						<?php echo $data->keydesc?>
					</textarea>
                    </td>
                </tr>
                <tr>
                    <td class="td1">详细内容：</td>
                    <td class="td2">
                        <ins>详细内容支持类似WORD形式的图文混排</ins>
                    </td>
                </tr>
                <tr>
                    <td class="td2" colspan="2">
                        <input type="hidden" name="udatetimes" value="<?php echo time();?>"/>
                        <textarea name="content" tool="full" class="editor require" style="width:100%;height:350px;">
						</textarea>
                    </td>
                </tr>
            </table>
        </div>
        <div class="formBar">
            <ul>
                <li>
                    <div class="buttonActive">
                        <div class="buttonContent">
                            <button type="submit">保存</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <div class="buttonContent">
                            <button type="button" class="close">取消</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</div>
