<?php
global $cfg;
require_once '../include/tps.config.cfg';
$file =$cfg->path['libraries']. 'tps.'.$get->get->m.'.lib';
if(file_exists($file)){
	require_once $file;
	if(class_exists($get->get->m)){
		$obj = new $get->get->m;
		$obj->run($get,$get->get->c);
	}
}
?>
