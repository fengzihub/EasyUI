<html>
<head>
    <title>员工管理</title>
    <link rel="stylesheet" type="text/css" href="/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/jquery-easyui/base.js"></script>

</head>
<body>
<div id="employee_toolbar">

    <a data-cmd="toAdd" href="#" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">新增</a>

    <a data-cmd="toEdit" id="edit" href="#" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">编辑</a>
    <a data-cmd="toDelete" id="delete" href="#" class="easyui-linkbutton"
       data-options="iconCls:'icon-remote',plain:true">删除</a>

    <div>
        关键字:<input name="keyword">
        <a data-cmd="search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
    </div>
</div>
<div id="buttons">
    <a data-cmd="save" href="#" class="easyui-linkbutton">保存</a>
    <a data-cmd="close" href="#" class="easyui-linkbutton">关闭</a>
</div>

<table id="employee_datagrid"></table>

<div id="employee-dialog" class="easyui-dialog" title="新增" style="width:400px;height:300px;"
     data-options="modal:true,closed:true,buttons:'#buttons'">
    <form id="employee_form" method="post">
        <input type="hidden" name="id"/>
        <table>

            <tr>
                <td>姓名:</td>
                <td>
                    <input type="text" name="name"/>
                </td>
            </tr>
            <tr>
                <td>手机:</td>
                <td>
                    <input type="text" name="tel"/>
                </td>
            </tr>
            <tr>
                <td>邮箱:</td>
                <td>
                    <input type="text" name="email"/>
                </td>
            </tr>



        </table>
    </form>
</div>


<script>
    var emp_dg = $('#employee_datagrid');
    var emp_from = $("#employee_form");
    var emp_dia = $("#employee-dialog");
    var toolsa = $("#employee_toolbar a").data("cmd");
    emp_dg.datagrid({
        url: '/employee/list', //拉取分页数据
        fit: true,
        fitColumns: true,
        singleSelect: true,
        pagination: true,
        toolbar: "#employee_toolbar",
        columns: [[
            {field: 'name', title: '姓名', width: 100, align: 'center'},
            {field: 'tel', title: '电话', width: 100, align: 'center'},
            {field: 'email', title: '邮箱', width: 100, align: 'center'}

        ]]

    });
    //对<a>标签做统一的事件处理,抽出cmdObj对象
    $('a').click(function () {
        var cmd = $(this).data('cmd');
        if (cmd) {
            cmdObj[cmd]();
        }
    });

    var cmdObj = {
        toAdd: function () {
            emp_from.form("clear");
            emp_dia.dialog("setTitle", '新增');
            emp_dia.dialog("open");
        },
        toDelete: function () {
            var rowData = emp_dg.datagrid("getSelected");
            if (!rowData) {
                $.messager.alert("温馨提示", "未选中一行数据", "error");
                return;
            }else {
                $.messager.confirm("温馨提示","你确定删除该员工", function (yes) {
                    if (yes) {
                        $.post("/employee/delete?id="+rowData.id, function (data) {
                            if (!data.success) {
                                $.messager.alert("温馨提示", data.msg, "error");
                                return;
                            }else {
                                $.messager.alert("温馨提示", data.msg, "info", function () {
                                    emp_dia.dialog("close");
                                    emp_dg.datagrid("reload");
                                });
                            }
                        })
                    }
                })
            }
        },

        toEdit: function () {
            var rowData = emp_dg.datagrid("getSelected");
            if (!rowData) {
                $.messager.alert("温馨提示", "未选中一行数据", "error");
                return;
            }
            emp_from.form("clear");
            //回显
            emp_from.form("load", rowData);
            emp_dia.dialog("setTitle", '编辑');
            emp_dia.dialog("open");
            $.post("/employee/listRolesByEmployeeId?employeeId=" + rowData.id, function (data) {
                //data--响应回来的员工的角色数据(集合)
                var roleIds = $.map(data, function (role, index) {
                    //role--遍历出data中每一条数据
                    return role.id; //返回role中id,用一个变量接受(数组)
                });
                //设置下拉列表框值 数组。
                $("#roleIds").combobox('setValues', roleIds);
                console.log(roleIds);
            }, 'json');


        },
        save: function () {
            var url = $("input[name='id']").val() ? '/employee/update' : '/employee/save';
            emp_from.form("submit", {
                url: url,
                success: function (data) {
                    data = JSON.parse(data);
                    if (!data.success) {
                        $.messager.alert("温馨提示", data.msg, "error");
                        return;
                    }
                    $.messager.alert("温馨提示", data.msg, "info", function () {
                        emp_dia.dialog("close");
                        emp_dg.datagrid("reload");
                    });
                }
            })
        },
        close: function () {
            emp_dia.dialog("close");
        },
        search: function () {
            emp_dg.datagrid('load', {
                keyword: $('input[name="keyword"]').val()
            });
        }

    };


</script>

</body>
</html>
