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
<!--<div class="bjy-admin-nav">
    <i class="fa fa-home"></i> 首页 
    &gt;
    后台管理
    &gt;
    管理员列表
</div>-->
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
         <a href="<?php echo U('Admin/Rule/admin_user_list');?>">管理员列表</a>
   </li>
   <li>
        <a href="<?php echo U('Admin/Rule/add_admin');?>">添加管理员</a>
    </li>
</ul>
<table class="table table-striped table-bordered table-hover table-condensed">
    <tr>
        <th width="10%">用户名</th>
        <th>用户组</th>
        <th>操作</th>
    </tr>
    <?php if(is_array($data)): foreach($data as $key=>$v): ?><tr>
            <td><?php echo ($v['username']); ?></td>
            <td><?php echo ($v['title']); ?></td>
            <td>
                <a href="<?php echo U('Admin/Rule/edit_admin',array('id'=>$v['id']));?>">修改权限或密码</a>
            </td>
        </tr><?php endforeach; endif; ?>
</table>

<script src="/personalRecordSys/Public/js/h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/personalRecordSys/Public/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="/personalRecordSys/Public/js/base.js"></script>
</body>
</html>