layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention: 'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool: 'tool',
    $api:'api'
}).use(['form', 'layer', 'jquery', 'table', 'laypage', 'ajaxExtention', '$tool','$api'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        laypage = layui.laypage,
        $tool = layui.$tool,
        table = layui.table,
        $api = layui.$api;

    var tableIns;//表格实例

    /**
     * 页面初始化
     * */
    function init() {

        //初始化下拉框
        $api.GetIdMenu(null,function (res) {
            var data = res.data;
            var list = new Array();
            if(data.length > 0){
                var html = '<option value="">--请选择--</option>';
                for(var i=0;i<data.length;i++){
                    var flag = (list.indexOf(data[i].materialId)==-1)
                    if(flag){
                        html += '<option value="'+data[i].id+'">'+data[i].materialId+'</option>';
                        list.push(data[i].materialId)
                    }
                }
                $('#materialId').append($(html));


                form.render();
            }
        });


        //初始化下拉框
        $api.GetIdMenu(null,function (res) {
            var data2 = res.data;
            var list2 = new Array();
            if(data2.length > 0){
                var html = '<option value="">--请选择--</option>';
                for(var j=0;j<data2.length;j++){
                    if((list2.indexOf(data2[j].supplierId)==-1)){
                    html += '<option value="'+data2[j].supplierId+'">'+data2[j].supplierId+'</option>>';
                    list2.push(data2[j].supplierId);
                    }
                }
                $('#supplierId').append($(html));


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
            elem: '#menu-data'

            , url: $tool.getContext() + '/materialgoods/pagelist' //数据接口
            , method: 'post'
            , page:true //开启分页
            , cols: [[ //表头
                  {type:'numbers',title:'序号',fixed: 'left'},
                  {field: 'materialId', title: '原料商品ID'}
                , {field: 'goodsName', title: '原料名称'}
                , {field: 'goodsDescribe', title: '原料描述'}
                , {field: 'supplierId', title: '供应商ID'}
                , {field: 'supplierName', title: '供应名称'}
                , {field: 'supplierPhone', title: '供应商电话'}
                , {field: 'goodsPrice', title: '货品价格'}
                , {fixed: 'right', title: '操作', width: 200,align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
            , done: function (res, curr) {//请求完毕后的回调
                //如果是异步请求数据方式，res即为你接口返回的信息.curr：当前页码
            }
        });

        //为toolbar添加事件响应
        table.on('tool(menuFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var row = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            //区分事件
            if (layEvent === 'del') { //删除
                delMenu(row.id);
            } else if (layEvent === 'edit') { //编辑
                //do something
                editMenu(row.id);
            }
        });
    }
    defineTable();


    //查询
    form.on("submit(queryMenu)", function (data) {
        var materialId = data.field.materialId;
        var supplierId = data.field.supplierId;
        var goodsPrice = data.field.goodsPrice;

        //表格重新加载
        tableIns.reload({
            where:{
                materialId:materialId,
                supplierId:supplierId,
                goodsPrice:goodsPrice
            }
        });

        return false;
    });

    //添加角色
    $(".usersAdd_btn").click(function () {
        var index = layui.layer.open({
            title: "添加原料供应单",
            type: 2,
            content: "addMaterialGoods.html",
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
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
    function delMenu(id){
        layer.confirm('确认删除吗？', function (confirmIndex) {
            layer.close(confirmIndex);//关闭confirm
            //向服务端发送删除指令
            var req = {
                id: id
            };

            $api.DeletematerialGoodsBean(req,function (data) {
                layer.msg("删除成功",{time:1000},function(){
                    //obj.del(); //删除对应行（tr）的DOM结构
                    //重新加载表格
                    tableIns.reload();
                });
            });
        });
    }

    //编辑
    function editMenu(id){
        var index = layui.layer.open({
            title: "编辑菜单",
            type: 2,
            content: "editMaterialGoods.html?id="+id,
            success: function (layero, index) {
                setTimeout(function () {
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
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