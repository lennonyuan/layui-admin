layui.config({
    base: $config.resUrl+'layuicms/common/js/'//定义基目录
}).extend({
    ajaxExtention:'ajaxExtention',//加载自定义扩展，每个业务js都需要加载这个ajax扩展
    $tool:'tool',
    $api:'api'
}).use(['form', 'layer', 'jquery','ajaxExtention','$tool','$api'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage,
        $ = layui.jquery,
        $tool = layui.$tool,
        $api = layui.$api;


   // var roleIdList = new Array();//所有的角色id列表
   // var menu_roleIds =[];//菜单所属角色列表

    /**
     * 初始化页面
     * */
    function init() {
        //初始化菜单信息
        initMenuInfo();
    }
    init();

    /**
     * 初始化菜单信息
     * */
    function initMenuInfo() {
        var queryArgs = $tool.getQueryParam();//获取查询参数
        var id = queryArgs['id'];

        var url = $tool.getContext()+'/meterialgoods/get';
        var req = {
            id:id
        };

        $api.GetMaterialall(null,function (res) {
            var data = res.data;
            if (data.length > 0) {
                var html = '<option value="">--请选择--</option>';
                for (var i = 0; i < data.length; i++) {
                    html += '<option value="' + data[i].id + '">' + data[i].id +'] ---------- ' +data[i].goodsName + '</option>>';
                }
                $('#materialId').append($(html));
                form.render();
            }
        });
        $api.GetSupplierall(null,function (res) {
            var data2 = res.data;
            if (data2.length > 0) {
                var html = '<option value="">--请选择--</option>';
                for (var j = 0; j < data2.length; j++) {
                    html += '<option value="' + data2[j].id + '">' + data2[j].id +'] ---------- ' +data2[j].supplierName + '</option>>';
                }
                $('#supplierId').append($(html));
                form.render();
            }
        });

        $api.GetmaterialGoodsId(req,function (res) {
            var data = res.data;
            $("[name='materialId']").val(data.materialId);
            $("[name='supplierId']").val(data.supplierId);
            $("[name='goodsPrice']").val(data.goodsPrice);

            //menu_roleIds = data.roleIdList;//保存菜单所属角色id列表，初始化选中时用
            //加载角色列表
           // loadRoleList();
            form.render();//重新绘制表单，让修改生效
        });
    }

    /**
     * 加载角色列表
     * */
    function loadRoleList() {
        //var url = $tool.getContext()+'role/roleList.do';
       /* var req =  {
            page:1,
            limit:999
        };*/


    }

    /**
     * 表单提交
     * */
    form.on("submit(editMenu)", function (data) {
        var queryArgs = $tool.getQueryParam();//获取查询参数
        var materialId = data.field.materialId;
        var supplierId = data.field.supplierId;
        var goodsPrice = data.field.goodsPrice;



        //请求
        var url = $tool.getContext()+'/materialgoods/update';
        var req = {
            id:queryArgs['id'],
            materialId:materialId,
            supplierId:supplierId,
            goodsPrice:goodsPrice,

        };

        $api.updateMaterialGoods(req,function (data) {
            layer.msg("修改成功！",{time:1000},function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


