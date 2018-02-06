springBoot 集成easyUI需要注意几点问题:
1,在页面加载tree菜单时,必须要写:method:'GET'
$(function () {
    $('#index_tree').tree({
    method:'GET', //***必须要写请求方法,默认是POST,要改为get,不然加载不了静态资源目录下的文件
    url:'/data/menu.json',
    onClick: function(node){
        if(!node.text ||!node.attributes || !node.attributes.url){
            alert("你的节点有问题");
            return;
        }
 }
2,SpringBoot集成下的页面在引用静态资源目录下的插件时,src路径不需要写static,写了反而找不到
<script type="text/javascript" src="/jquery-easyui/jquery.min.js"></script> 此写法对
<script type="text/javascript" src="static/jquery-easyui/jquery.min.js"></script> 错误的
