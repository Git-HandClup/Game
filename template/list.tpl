<!doctype html>
<html>
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="content-language" content="zh-cn"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>游戏门户</title>
	<meta name="keywords" content="游戏门户" />
	<meta name="description" content="游戏门户" />
	<link rel="stylesheet" type="text/css"href="<?php echo $cfg->path['skin']?>/tps.common.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $cfg->path['skin']?>/tps.index.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $cfg->path['skin']?>/tps.list.css"/>
</head>
<body>
<?php require_once 'template/header.tpl' ?>
<a id="banner" target="_blank" style="background-image:url(/img/bg.jpg) ;"></a>
<div id="wrap">
	<div id="navi">
		<i class="ico"></i>
		<i></i>
		<a href="#">频道首页</a>
		<i></i>
		<a href="#">游戏库</a>
		<i></i>
		<span>列表</span>
	</div>
	<div class="img"><img src="img/banner2.png" style="width: 1190px;"></div>
	<div class="itemlist">
		<div class="left">
			<div class="navtab">
				<h3>热门游戏</h3>
				<h3 class="more">
					<a href="#" class="more">+</a>
				</h3>
			</div>
			<?php
                $sql->base = new stdclass;
			$sql->base->tab = $get->get->c;
			$sql->base->cond = isset($get->get->cid) ? 'cid in ('.$core->typeid($get->get->cid).')' : '';
			$sql->base->order = array('udatetimes desc,hits asc');
			$sql->base->psize = 2;
			$sql->base->page = isset($get->get->page) ? $get->get->page : 1;
			$core->run($sql,'itemlist');
			$list = $core->result;
			if($list->pcount > 0)
			{
			foreach($list->data as $k => $v)
			{
			echo '
			<dl>
				<dt><a href="#"><img src="'.$v->litpic.'" /></a></dt>
				<dd>
					<h4>
						<a href="#">网络游戏</a>
						<em>
							<strong>作者：管理员</strong>
							<time>2018-05-08  </time>
						</em>
					</h4>
					<h3><a href="#">'.$v->title.'</a></h3>
					<p>				'.$v->keydesc.'
						<a href="#">[详情]</a>
					</p>
					<label>
						<font>阅读：531</font>
						<font>评论：458</font>
					</label>
				</dd>
			</dl>
			';
			}
			}
			?>
			<div class="page">
				<?php
                    $tool->page($list->pcount,$sql->base->page,'/?m=list&c='.$get->get->c.'');
				?>
			</div>
		</div>
		<div class="right">
			<div class="navtab">
				<h3>栏目分类</h3>
			</div>
			<div class="catalog">
				<?php
				$sk='';
                $sql->base = new stdclass;
				$sql->base->tab = 'catalog';
				$sql->base->cond = "type='".$get->get->c."' and cid = ".(isset($get->get->cid) ? $core->category($get->get->cid) : 0);
				$sql->base->order = array('pid asc');
				$core->run($sql);
				$cat = $core->result;
				if($cat->total > 0 )
				{
					foreach($cat->data as $k => $v)
					{
						if(isset($get->get->cid))
						{
							if($get->get->cid==$v->id)
								$sk='class="fixed"';
							else
								$sk='';
						}
						echo '<a href="/?m=list&c='.$get->get->c.'&cid='.$v->id.'" '.$sk.'>'.$v->title.'</a>';
					}
				}
				?>
			</div>
			<div class="navtab">
				<h3>推荐文章</h3>
				<h3 class="more">
					<a href="#" class="more">+</a>
				</h3>
			</div>
			<div class="focus">
				<?php
                $sql->base = new stdclass;
				$sql->base->tab = 'news';
				$sql->base->cond = "";
				$sql->base->num =4;
				$core->run($sql);
				$pig = $core->result;
				if($pig->total > 0 )
				{
				foreach($pig->data as $k => $v)
				{
				echo '<ul>
					<li>
						<a href="#"><img src="'.$v->litpic.'" /></a>
						<a href="/?m=list&c='.$get->get->c.'" class="t">'.$v->keydesc.'<a href="#">[详情]</a>
					</li>
				</ul>';
				}
				}
				?>
				<label>
					<a></a>
					<a></a>
					<a></a>
					<a></a>
				</label>
			</div>
			<div class="navtab">
				<h3>栏目精选</h3>
				<h3 class="more">
					<a href="#" class="more">+</a>
				</h3>
			</div>
			<div class="info">
				<?php
                $sql->base = new stdclass;
				$sql->base->tab = 'news';
				$sql->base->num = 7;
				$core->run($sql);
				$sor = $core->result;
				if($sor->total > 0 )
				{
				foreach($sor->data as $k => $v)
				{
				echo '<ul>
					<li>
						<a href="#"><i>&bull; </i>'.$v->title.'</a>
						<time>'.date("Y-m").'</time>
					</li>
				</ul>';
				}
				}
				?>
			</div>
			<div class="navtab">
				<h3>你可能喜欢</h3>
			</div>
			<?php
                $sql->base = new stdclass;
			$sql->base->tab = 'news';
			$sql->base->num = 3;
			$core->run($sql);
			$sot = $core->result;
			if($sot->total > 0 )
			{
			foreach($sot->data as $k => $v)
			{
			echo '<dl>
				<dt><a href="#"><img src="'.$v->litpic  .'" /></a></dt>
				<dd>
					<h3><a href="#">'.$v->keyword.'</a></h3>
					<label>
						<font>'.date("Y-m-d").'</font>
						<font>'.$v->author.'</font>
					</label>
				</dd>
			</dl>';
			}
			}
			?>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	<div class="footer">
		<p>
			<a href="#">Archives</a>
			<a href="#">手机版</a>
			<a href="#">小黑屋</a>
			<a href="#">后台管理</a>
		</p>
		<p>Power By G.E.M.Inc V1.0.03.0923 &copy; All Rights Reseved. 鲲鹏IT(中国)有限公司</p>
		<p>中国游戏行业协会秘书长 | 李奶奶保护协会 | 珍惜单身狗</p>
		<p>备案号：湘01413321-1号 | 文网文：[2017]6138-1456号 | 电信增值业务许可证</p>
		<ul>
			<li><a href="#"><img src="/img/1.jpg"/> </a></li>
			<li><a href="#"><img src="/img/2.png"/> </a></li>
			<li><a href="#"><img src="/img/3.png"/> </a></li>
		</ul>
		<div class="clear"></div>
	</div>
</div>
<script type="text/javascript" language="javascript" src="/scripts/tps.pack.js"></script>
<script type="text/javascript" language="javascript" src="/scripts/tps.scroll.js"></script>

<script type="text/javascript" language="javascript">
    $(".focus").slide
    ({
        effect:'fold',
        titCell:'label a',
        mainCell:'ul',
        autoPlay:true
    })
</script>
</body>
</html>