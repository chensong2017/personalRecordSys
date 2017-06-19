<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8"/>
	<title>用户组添加用户 - bjyadmin</title>
	<link rel="stylesheet" href="/personalRecordSys/Public/bootstrap-3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/personalRecordSys/Public/bootstrap-3.3.5/css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" href="/personalRecordSys/Public/font-awesome-4.4.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="/personalRecordSys/Public/css/base.scss" />
</head>
<body>
<div class="bjy-admin-nav">
	<a href="<?php echo U('Admin/Index/index');?>"><i class="fa fa-home"></i> 首页</a>
	&gt;
	<a href="<?php echo U('Admin/Rule/group');?>">用户组列表</a>
	&gt;
	用户组添加用户
</div>
<table class="table table-striped table-bordered table-hover table-condensed">
	<tr>
		<th width="10%">
			搜索用户名：
		</th>
		<td>
			<form class="form-inline" action="">
				<input class="form-control" type="text" name="username" value="<?php echo ($_GET['username']); ?>">
				<input class="btn btn-success" type="submit" value="搜索">
			</form>
		</td>
	</tr>
</table>
<table class="table table-striped table-bordered table-hover table-condensed">
	<tr>
		<th width="10%">用户名</th>
		<th>操作</th>
	</tr>
	<?php if(is_array($user_data)): foreach($user_data as $key=>$v): ?><tr>
			<th><?php echo ($v['username']); ?></th>
			<td>
				<?php if(in_array($v['id'],$uids)): ?>已经是<?php echo ($group_name); ?>
				<?php else: ?>
					<a href="<?php echo U('Admin/Rule/add_user_to_group',array('uid'=>$v['id'],'group_id'=>$_GET['group_id'],'username'=>$_GET['username']));?>">设为<?php echo ($group_name); ?></a><?php endif; ?>
			</td>
		</tr><?php endforeach; endif; ?>

</table>

<script src="/personalRecordSys/Public/js/h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/personalRecordSys/Public/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="/personalRecordSys/Public/js/base.js"></script>
</body>
</html>