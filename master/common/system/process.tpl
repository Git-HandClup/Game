<!doctype html>
<html>
<head>       
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<title>备份数据中...</title>  
	<meta name="copyright" content="-第一资源-,mellee@foxmail.com" />
	<link rel="stylesheet" type="text/css" href="skin/manage/ryx.manage.css" />
	<style>
		html,body{marign:0;padding:0;background:#fff}
		center{font-size:16px;margin:50px 0;color:green}
	</style>
</head>
<body>
	<?php
	$dbms = array();
	$option = array();
	$cpath = '';
	$dbk = $config['backup'];
	$dba = $config['connect'];
	$tmp_path = '..'.$dbk['cfg_backup_path'].'/';
	
	if(empty($ids))
		echo '<center>准备就绪...</center>';
	else
	{		
		if($pos == 'rand')
		{
			$cpath = $dba['cfg_db_name'];
			$tmp_path .= $dba['cfg_db_name'];
		}
		else
		{
			$tmp_path .= $pos;
			$cpath = $pos;
		}
		if(empty($step))
		{			
			echo '<center>1，初始化配置信息...</center>';	
			if(!file_exists($tmp_path))
				@mkdir($tmp_path);
			else
			{
				$dh = dir($tmp_path);
				print_r($dh);				
				while($fso = $dh->read())
				{
					if(!preg_match("#bak$#", $fso))
					{
						continue;
					}
					$fso = $tmp_path.'/'.$fso;
					if(!is_dir($fso))
					{
						unlink($fso);
					}
				}
				$dh->close();				
			}
			$content = '备份说明：'.$dbk['cfg_backup_memo']."\r\n";
			$dbo->dbase();
			$dbo->query('show table status');
			$dbo->select('table');
			$total = $dbo->result['total'];
			$row = $dbo->result['table'];	
			foreach($row as $v)
			{
				if($ids == 'all')
				{				
					$option[] = array('tname'=>$v->Name,'rows' => $v->Rows);
				}
				else
				{
					$tmp = explode(',',$ids);
					foreach($tmp as $t)
					{
						if($v == $t)
						{
							$option[] = array('tname'=>$v->Name,'rows' => $v->Rows);
						}
					}
					$total = count($tmp);
				}
			}
			$cfg = @include($tmp_path.'/../config.inc');
			$ini['name'] = $tmp_path;
			$ini['total'] = $total;
			$ini['btime'] = time();
			$ini['rtime'] = '-';
			$ini['num'] = 0;
			$cfg[$cpath] = $ini;
			$content .= '共需处理： '.$total.' 张数据表'."\r\n";
			echo '<script>parent.$("#bakTable").html("'.$total.'")</script>';
			$content .= '备份开始时间：'.date('Y-m-d H:i:s',time())."\r\n";			
			$tools->write($tmp_path.'/readme.txt',$content);
			$tools->write($tmp_path.'/../config.inc',"<?php\nreturn\n".var_export($cfg, true)."\n?>");
			$tools->write($tmp_path.'/config.inc',"<?php\nreturn\n".var_export($option, true)."\n?>");
			echo '<script>locatidon.href="admin.php?m='.$m.'&c='.$c.'&ids='.$ids.'&pos='.$pos.'&step=1"</script>';
		}
		else if($step == '1')
		{			
			echo '<center>2，初始化成功，开始备份表结构...</center>';
			$option = include($tmp_path.'/config.inc');
			foreach($option as $op)
			{
				$dbms[] = 'drop table if exists `'.$op['tname'].'`';
				$dbo->dbase();
				$dbo->query('set sql_quote_show_create = 1');
				$dbo->limited();
				$dbo->query('show create table '.$op['tname']);
				$dbo->select('sql','array');
				$s = $dbo->result['sql'][0][1];
				$s = preg_replace('#AUTO_INCREMENT=([0-9]{1,})[ \r\n\t]{1,}#i','',$s);
				$dbms[] = str_replace("\"","\\\"",strtolower($s));
				$tools->write($tmp_path.'/construct.bak',"<?php\nreturn\n".var_export($dbms, true)."\n?>");
			}
			echo '<script>location.href="admin.php?m='.$m.'&c='.$c.'&ids='.$ids.'&pos='.$pos.'&step=2&path='.$path.'"</script>';
		}
		else if($step == '2')
		{
			echo '<center>3,表结构备份完成，开始备份数据...</center>';
		}
		else
		{
			echo '<center>备份成功...</center>';
		}
	}
	?>
</body>
</html>