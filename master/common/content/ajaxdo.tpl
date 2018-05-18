<?php
	$cond ='';
	$rn='';
	$core = new kernel;
	$sql = new stdclass;
	$sql->base = new stdclass;
/*
if(empty($get->get->ids)){
	exit('[["","请选择频道子节点"]]');
}else{
	$cond='cid='.$get->get->ids;
}*/
if(empty($get->get->type)){
	if(empty($get->get->ids)){
		exit('[["","请选择..."]]');
	}else{
		$cond='cid='.$get->get->ids;
	}
}else{
	$cond = "type='".$get->get->type."' and cid=0";
}

	
	$sql->base->tab = $get->get->tab;
	$sql->base->field = 'id,title';
	$sql->base->cond = $cond;
	$sql->base->order = array('pid asc');
	$core->run($sql);
	$ajax = $core->result;
		$rn = '["0","请选择..."]';
		foreach($ajax->data as $k=>$v){
		$rn .= empty($rn) ? '["'.$v->id.'","'.$v->title.'"]':',["'.$v->id.'","'.$v->title.'"]';
		}
	echo '['.$rn.']';
?>