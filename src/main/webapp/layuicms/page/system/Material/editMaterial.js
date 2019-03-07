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


    var roleIdList = new Array();//所有的角色id列表
    var menu_roleIds =[];//菜单所属角色列表

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
        var wid = queryArgs['Id'];

        var url = $tool.getContext()+'/material/get';
        var req = {
            id:wid
        };

        $api.GetMaterial(req,function (res) {
            var data = res.data;

            $("[name='GoodsName']").val(data.goodsName);
            $("[name='GoodsType']").val(data.goodsType);
            $("[name='GoodsDescribe']").val(data.goodsDescribe);
           // menu_roleIds = data.roleIdList;//保存菜单所属角色id列表，初始化选中时用
            //加载角色列表
            // loadRoleList();
            form.render();//重新绘制表单，让修改生效
        });
    }

    /**
     * 加载角色列表
     * */
   /* function loadRoleList() {
        var url = $tool.getContext()+'role/roleList.do';
        var req =  {
            page:1,
            limit:999
        };

        $api.GetRoleList(req,function (res) {
            var data = res.data;
            if(data.length > 0){
                var roleHtml = "";
                for(var i = 0;i<data.length;i++){
                    //是否初始化选中
                    if($.inArray(data[i].id, menu_roleIds) != -1){
                        roleHtml += '<input type="checkbox" checked name="'+data[i].id+'" title="'+data[i].roleName+'">';
                    }else{
                        roleHtml += '<input type="checkbox" name="'+data[i].id+'" title="'+data[i].roleName+'">';
                    }

                    roleIdList.push(data[i].id);//保存id列表
                }

                $('.role-check-list').append($(roleHtml));
                form.render();//重新绘制表单，让修改生效
            }
        });
    }
*/
    /**
     * 表单提交
     * */
    form.on("submit(editMenu)", function (data) {
        var queryArgs = $tool.getQueryParam();//获取查询参数
        console.log(queryArgs)
        var GoodsName = data.field.GoodsName;
        var GoodsType = data.field.GoodsType;
        var GoodsDescribe = data.field.GoodsDescribe;

        /*var sort = data.field.sort;
        var idList = new Array();*/

        //获取选中的角色列表
        /*for(var i=0;i<roleIdList.length;i++){
            if(data.field[roleIdList[i]] === 'on'){
               idList.push(roleIdList[i]);
            }
        }
*/
        //请求
        var url = $tool.getContext()+'/material/update';
        var req = {
            Id:queryArgs['Id'],
            GoodsName:GoodsName,
            GoodsType:GoodsType,
            GoodsDescribe:GoodsDescribe
         //   roleIdList:idList
        };

        $api.UpdateMaterial(req,function (data) {
            layer.msg("修改成功！",{time:1000},function () {
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            });
        });

        return false;
    })

});


