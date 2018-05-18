<?php
$pos = 'news';
$pageNum = 1;
$ids = 0;
$keyword = '';
if(isset($get->get->pos))
    $pos = $get->get->pos;
if(isset($get->post->pos))
$pos = $get->post->pos;
if(isset($get->get->pageNum))
$pageNum = $get->get->pageNum +0;
if(isset($get->post->pageNum))
$pageNum = $get->post->pageNum +0;

if(isset($get->get->ids))
$ids = $get->get->ids;
if(isset($get->post->ids))
$ids = $get->post->ids;

if(isset($get->get->keyword))
$keyword = $get->get->keyword;
if(isset($get->post->keyword))
$keyword = $get->post->keyword;


?>
<form id="pagerForm" method="post" action="admin.php?m=content&c=info">
    <input type="hidden" name="ids" value="<?php echo $ids?>" />
    <input type="hidden" name="pos" value="<?php echo $pos ?>" />
    <input type="hidden" name="pageNum" value="<?php echo $pageNum ?>" />
    <input type="hidden" name="keyword" value="<?php echo $keyword?>" />
</form>
<style>
    ul li a.aaa{color:red;text-decoration:overline;};
</style>
<div class="pageContent" style="padding:4px">
    <div class="frameWork" layoutH="10">
        <h3 style="color:#f00;padding:0 0 0 24px;font:700 14px/24px '';background:url(/master/skin/manage/images/ico.gif) no-repeat 4px 6px">频道节点</h3>
        <ul class="tree treeFolder">
            <?php
			$core = new kernel;
			$sql = new stdclass;
			$sql->base = new stdclass;
            $sql->base->tab = 'catalog';
            $sql->base->cond = "type='game' and cid =0";
            $sql->base->order = array('pid asc');
            $core->run($sql);
            $list = $core->result;
            if($list->total > 0){
            foreach($list->data as $k=>$v){
            echo'
            <li><a href="javascript:void(0);" lang="m=content&c=game&ids='.$v->id.'" target="navTab" rel="gamebox" title="游戏库管理——'.$v->title.'">'.$v->title.'</a>
            </li>';
            }
            }
            ?>
        </ul>
    </div>
    <div class="frameSpace" layoutH="15">
        <div class="pageContent">
            <div class="pageHeader">
                <form action="admin.php?m=content&c=info&pos=<?php echo $pos?>&ids=<?php echo $ids?>" method="post" onsubmit="return navTabSearch(this)" >
                    <div class="searchBar">
                        <ul class="searchContent">
                            <li style="width:260px;"><label>信息检索：</label><input name="keyword" class="ipt" type="text" placeholder="搜索关键字" value="<?php echo $keyword?>"/></li>
                            <li class="subBar" style="width:60px">
                                <div class="buttonActive">
                                    <div class="buttonContent"><button type="submit">检索</button></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
            <div class="panelBar" style="border-top:0">
                <ul class="toolBar">
                    <li><a class="add" target="dialog" lang="m=content&c=gamex&pos=gamebox" rel="gamex" width="850" height="0"><span>添加游戏</span></a></li>
                    <li><a class="edit" target="dialog" lang="m=content&c=gamey&pos=gamebox&ids={option}" rel="gamey" width="850" height="0"><span>修改游戏</span></a></li>
                    <li><a class="delete" target="selectedTodo" lang="m=content&c=clearx&tab=gamebox" ids="ids" pos="2" postType="string"  title="确实要删除这些记录吗?"><span>批量删除游戏</span></a></li>
                </ul>
            </div>
            <table class="list" width="100%" layoutH="101">
                <thead>
                <tr>
                    <th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
                    <th width="4%">序号</th>
                    <th width="15%">频道节点</th>
                    <th>游戏名称</th>
                    <th width="16%">发布时间</th>
                    <th width="10%">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php
				$sql = new stdclass;
				$sql->base = new stdclass;
                $sql->base->tab = 'gamebox';
                $sql->base->psize = 8;
                $sql->base->page = $pageNum;
                $core->result->data=array();
                $sql->base->cond = !empty($ids) ? 'cid='.$ids : '1';
                if(!empty($keyword))
                $sql->base->cond.=" and title like '%".$keyword."%'";
                $sql->base->order = array(' udatetimes desc ',' id desc ');
                $core->run($sql,'itemlist');
                $item = $core->result;
                if($item->rcount >0){
                foreach($item->data as $k=>$v){
                echo '<tr target="option" rel="'.$v->id.'">
                    <td><input name="ids" type="checkbox" value="'.$v->id.'" /></td>
                    <td>'.($k+1).'</td>
                    <td>'.$core->node($v->cid).'</td>
                    <td class="pad">
                        <a href="/guide/details/1" title="预览" target="_blank">'.$v->title.'</a>
                        '.$tool->flag($v->fid,$cfg->language['content']['status']).'
                    </td>   
                    <td>'.date('Y-m-d H:i:s',$v->cdatetimes).'</td>
                    <td>
                        <a class="btnEdit" target="dialog" lang="m=content&c=gamey&ids='.$v->id.'" width="850" height="0" title="修改信息">编辑</a>
                        <a class="btnDel" target="ajaxTodo" lang="m=content&c=clearx&tab=gamebox&ids='.$v->id.'""  title="确定要删除当前信息吗?">删除</a>
                    </td>
                </tr> ';
                }
                }else{
                echo '<tr><td colspan = "8"><font>暂无相关信息</font></td></tr>';
                }
                ?>
                </tbody>
            </table>
            <div class="panelBar" style="border-bottom:0">
                <div class="pages">
                    <span>每页显示 <b><?php echo $sql->base->psize?></b> 个项目</span>
                    <span>共 <?php echo $item->rcount ?> 个项目</span>
                </div>
                <div class="pagination" targetType="navTab" totalCount="<?php echo $item->rcount ?>" numPerPage="<?php echo $sql->base->psize ?>" pageNumShown="5" currentPage="<?php echo $sql->base->page ?>"></div>
            </div>
        </div>
    </div>
</div>
