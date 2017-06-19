<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>添加管理员 - bjyadmin</title>
    <link rel="stylesheet" href="/personalRecordSys/Public/bootstrap-3.3.5/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/personalRecordSys/Public/bootstrap-3.3.5/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="/personalRecordSys/Public/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/personalRecordSys/Public/css/base.scss" />
    <link rel="stylesheet" href="/personalRecordSys/Public/iCheck-1.0.2/skins/all.css">

</head>
<body>

<!-- 导航栏开始 -->
<!--<div class="bjy-admin-nav">
    <i class="fa fa-home"></i> 首页
    &gt;
    后台管理
    &gt;
    添加管理员
</div>-->
<!-- 导航栏结束 -->
<ul id="myTab" class="nav nav-tabs">
   <li>
         <a href="<?php echo U('Admin/Rule/admin_user_list');?>">管理员列表</a>
   </li>
   <li class="active">
        <a href="<?php echo U('Admin/Rule/add_admin');?>">添加管理员</a>
    </li>
</ul>
<form class="form-inline" method="post">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
            <th>管理组</th>
            <td>
                <?php if(is_array($data)): foreach($data as $key=>$v): echo ($v['title']); ?>
                    <input class="xb-icheck" type="checkbox" name="group_ids[]" value="<?php echo ($v['id']); ?>">
                    &emsp;<?php endforeach; endif; ?>
            </td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>
                <input class="form-control" type="text" name="username">
            </td>
        </tr>
        <tr>
            <th>手机号</th>
            <td>
                <input class="form-control" type="text" name="phone">
            </td>
        </tr>
        <tr>
            <th>邮箱</th>
            <td>
                <input class="form-control" type="text" name="email">
            </td>
        </tr>
        <tr>
            <th>初始密码</th>
            <td>
                <input class="form-control" type="text" name="password">
            </td>
        </tr>
        <tr>
            <th>状态</th>
            <td>
                <span class="inputword">允许登录</span>
                <input class="xb-icheck" type="radio" name="status" value="1" checked="checked">
                &emsp;
                <span class="inputword">禁止登录</span>
                <input class="xb-icheck" type="radio" name="status" value="0">
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <input class="btn btn-success" type="submit" value="添加">
            </td>
        </tr>
    </table>
</form>
<script src="/personalRecordSys/Public/js/h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/personalRecordSys/Public/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="/personalRecordSys/Public/js/base.js"></script>
<script src="/personalRecordSys/Public/iCheck-1.0.2/icheck.min.js"></script>
</body>
</html>