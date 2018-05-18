<?php
//error_reporting(E_ALL);
include(dirname(__FILE__).'/../include/tps.config.cfg');

if(!isset($get->get->m))
{
	define('TEMPLATE','common/public/login.tpl');	
}
else
{	
	if(!isset($get->get->c))
	{
		if($get->get->m == 'manage')
			define('TEMPLATE','common/public/manage.tpl');	
		else
			define('TEMPLATE','common/public/login.tpl');	
	}
	else
	{
		define('TEMPLATE','common/' .$get->get->m. '/' .$get->get->c.'.tpl');		
	}		
}
if(!file_exists(TEMPLATE))
{
	header('content-type:text/html;charset=utf-8');
	echo '视图加载失败，访问拒绝！';
	exit;
}
include (TEMPLATE);
?>