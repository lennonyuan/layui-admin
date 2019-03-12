layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention: 'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool: 'tool',
    $api:'api'
}).use(['form', 'layer','$api', 'jquery', 'table', 'laypage','laytpl', 'ajaxExtention', '$tool'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        laypage = layui.laypage,
        $tool = layui.$tool,
        table = layui.table,
        $api = layui.$api;

    var tableIns;//表格实例

    function init() {

        //初始化下拉框
        $api.purchaseOrderall(null,function (res) {
            var data = res.data;
            var list = new Array();
            if(data.length > 0){
                var html = '<option value="">--请选择--</option>';
                for(var i=0;i<data.length;i++){
                    var flag = (list.indexOf(data[i].applyUser)==-1)
                    if(flag){
                        html += '<option value="'+data[i].applyUser+'">'+data[i].applyUser+'</option>';
                        list.push(data[i].applyUser)
                    }
                }
                $('#applyUser').append($(html));


                form.render();
            }
        });


        //初始化下拉框
        $api.purchaseOrderall(null,function (res) {
            var data2 = res.data;
            var list2 = new Array();
            if(data2.length > 0){
                var html = '<option value="">--请选择--</option>';
                for(var j=0;j<data2.length;j++){
                    if((list2.indexOf(data2[j].state)==-1)){
                        html += '<option value="'+data2[j].state+'">'+data2[j].state+'</option>>';
                        list2.push(data2[j].state);
                    }
                }
                $('#state').append($(html));


                form.render();
            }
        });
    }
    init();
    /**
     * 定义表格
     * */
    function defineTable() {
        tableIns = table.render({
            elem: '#role-data'
            /*, height: 415*/
            , url:$tool.getContext() + 'po/pagelist' //数据接口
            , method: 'post'
            , page:true //开启分页
            , cols: [[ //表头
                  {type:'numbers',title:'序号',fixed: 'left'}
                 /* , {field: 'id', title: 'ID', width: '4%'}*/
                , {field: 'orderNumber', title: '订单编号'/*,templet: '#tmp'*/, width: '10%'}
                , {field: 'goodsId', title: '原料ID', width: '6%'}
                , {field: 'goodsNumber', title: '原料数量', width: '10%'}
                , {field: 'applyUser', title: '申请人', width: '10%'}
                , {field: 'applyTime', title: '申请时间', width: '10%'}
                , {field: 'state', title: '订单状态', width: '10%'}
                , {field: 'orderAuditUser', title: '订单审核人', width: '10%'}
                , {field: 'orderAuditTime', title: '订单审核时间', width: '10%'}
                , {field: 'payAuditUser', title: '支付审核人', width: '10%'}
                , {field: 'payAuditTime', title: '支付审核时间', width: '10%'}
                , {field: 'applyDescribe', title: '申请描述', width: '10%'}
                , {field: 'auditDescribe', title: '审核描述', width: '10%'}
                , {fixed: 'right', title: '操作', width:260, align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
            , done: function (res, curr) {//请求完毕后的回调
                //如果是异步请求数据方式，res即为你接口返回的信息.curr：当前页码
            }
        });

        //为toolbar添加事件响应
        table.on('tool(roleFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var row = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            //区分事件
            if (layEvent === 'del') { //删除
                DeleteMar(row.id);
            } else if(layEvent === 'edit') { //编辑
                //do something
                editMatrial(row.id);
            }else if (layEvent=='audi'){
                audi(row.id);
            }
        });
    }
    defineTable();


    //查询
    form.on("submit(queryMaterial)", function (data) {
        var applyUser = data.field.applyUser;
        var state = data.field.state;


        //表格重新加载
        tableIns.reload({
            where:{
                applyUser:applyUser,
                state:state
            }
        });

        return false;
    });

    //添加角色
    $(".usersAdd_btn").click(function () {
        var index = layui.layer.open({
            title: "添加采购订单",
            type: 2,
            content: "addPurchaseOrder.html",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        });

        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    });

    //删除
    function DeleteMar(id){
        layer.confirm('确认删除吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
            id:id
            };

            $api.DeletePurchaseOrder(req,function (data) {
                layer.msg("删除成功",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    tableIns.reload();
                });
            });
        });
    }

    //编辑
    function editMatrial(id){

        var index = layui.layer.open({
            title: "修改采购订单",
            type: 2,
            content: "editPurchaseOrder.html?Id="+id,
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }

        });//表格重新加载
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);

    }
        /*审核*/
    //TODO
        function audi(id){
            var index = layui.layer.open({
                title: "编辑角色",
                type: 2,
                content: "editMaterial.html?Id="+id,
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });

        //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
        $(window).resize(function () {
            layui.layer.full(index);
        });
        layui.layer.full(index);
    }
});