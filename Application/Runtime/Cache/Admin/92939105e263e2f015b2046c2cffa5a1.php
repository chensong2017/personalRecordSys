<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/DataTables/media/css/jquery.dataTables.css">
    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="/personalRecordSys/Public/DataTables/media/js/jquery.js"></script>
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="/personalRecordSys/Public/DataTables/media/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/css/h-ui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/css/h-ui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/js/h-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/css/h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/personalRecordSys/Public/css/h-ui/static/h-ui.admin/css/style.css" />
</head>
<body>
<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span></div>
<!--第二步：添加如下 HTML 代码-->
<table id="table_id_example" class="display">
    <thead>
    <tr>
        <th>Column 1</th>
        <th>Column 2</th>
        <th>Column 2</th>

    </tr>
    </thead>

</table>
</body>
<script>
    $('#table_id_example').DataTable({
        //开启服务器模式
        serverSide: true,
        //数据来源（包括处理分页，排序，过滤） ，即url，action，接口，等等
        ajax: 'getList',
        columns: [
            { data: 'name' },
            { data: 'cellphone' },
            { data: 'operate' }
        ],
        language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },

    });
</script>
</html>