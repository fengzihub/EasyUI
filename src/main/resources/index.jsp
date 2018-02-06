<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="/static/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="/static/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/static/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/static/jquery-easyui/base.js"></script>
    <style>
        .tabs-header{
            background-color: lightgrey;
        }
    </style>
    <script>
        $(function () {
            $('#index_tree').tree({
                url:'/static/data/menu.json',
                onClick: function(node){
                    if(!node.text ||!node.attributes || !node.attributes.url){
                        alert("你的节点有问题");
                        return;
                    }
                    //如果存在就选中
                    var exists = $("#index_tabs").tabs("exists",node.text);
                    if (exists){
                        $("#index_tabs").tabs("select", node.text);
                        return;
                    }
                    $('#index_tabs').tabs('add',{
                        title: node.text,
                        selected: false,
                        closable:true,
                        href:node.attributes.url
                    });

                }
            });
        });
    </script>
</head>
<body>
<div id="index_layout" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north'" style="height:70px;background:#E5EFFF;">
        <h1 style="padding-left: 10px;">狼码CRM管理系统</h1>
        <div style="float: right;margin-top: -25px;margin-right: 15px;">
            当前用户： <a href="/logout"> 登出</a>
        </div>
    </div>
    <div data-options="region:'south'" style="height:30px;background:#E5EFFF;">
        <p style="text-align: center;overflow: hidden;margin-top: 0px;">Copyright © 2004 - 2018 狼码wolfcode.cn 版权所有</p>
    </div>
    <div data-options="region:'west'" style="width:200px;">
        <ul id="index_tree" style="padding: 5px;"></ul>
    </div>
    <div data-options="region:'center'">
        <div id="index_tabs" class="easyui-tabs" data-options="fit:true,border:false">
            <div title="欢迎页">
                欢饮您使用！
            </div>
        </div>
    </div>
</div>

</body>
</html>
