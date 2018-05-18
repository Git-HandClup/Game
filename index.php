<?php
//header("Content-type:text/html;charset=utf-8");
require_once 'include/tps.config.cfg';
$core = new kernel;
$sql = new stdclass;
//define('TEMPLATE','template/');
if(!isset($get->get->m))
	define('TEMPLATE','template/index.tpl');
else
    define('TEMPLATE','template/'.$get->get->m.'.tpl');
if(!file_exists(TEMPLATE))
	exit('视图加载失败！');
require_once TEMPLATE;``
?>