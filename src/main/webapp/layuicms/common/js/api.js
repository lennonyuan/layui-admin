/**
 * api接口列表
 * Created by gameloft9 on 2018/7/19.
 */
layui.define(['$tool','jquery'], function (exports) {

    var $tool = layui.$tool,
        $ = layui.jquery;// 拿到模块变量

    /**
     * 封装一个post
     * */
    function doPost(url,req,successCallback,errorCallback) {
        $.ajax({
            url:url,
            data:req,
            method:"post",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        });
    }

    /**
     * 封装一个get
     * */
    function doGet(url,req,successCallback,errorCallback) {
        $.ajax({
            url:url,
            data:req,
            method:"get",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        });
    }

    /**
     * 封装一个支持更多参数的post
     * */
    function doComplexPost(url,req,config,successCallback,errorCallback) {
        var defaultConfig = {
            url:url,
            data:req,
            method:"post",
            success:function (data) {
                successCallback(data);
            },
            error:function (error) {
                errorCallback(error);
            }
        };
        var ajaxConfig = $.extend({},config,defaultConfig); // 合并参数

        $.ajax(ajaxConfig);
    }

    // API列表,工程庞大臃肿后可以将API拆分到单独的模块中
    var API = {
        Login: function(req,successCallback,errorCallback){ // 登录
            doPost($tool.getContext() + "login",req,successCallback,errorCallback);
        },
        LogOut:function(req,successCallback,errorCallback){ // 登出
            doPost($tool.getContext() + 'logout.do',req,successCallback,errorCallback);
        },
        ChangePwd:function(req,successCallback,errorCallback){ // 更改密码
            doPost($tool.getContext() + 'personCenter/changePwd.do',req,successCallback,errorCallback);
        },
        GetRoleList:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'personCenter/roleList.do',req,successCallback,errorCallback);
        },
        DeleteLog:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'log/delete.do',req,successCallback,errorCallback);
        },
        BatchDeleteLog:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'log/batchDelete.do',req,config,successCallback,errorCallback);
        },
        GetFirstClassMenus:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/firstClassMenus.do',req,successCallback,errorCallback);
        },
        AddMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/add.do',req,successCallback,errorCallback);
        },
        DeleteMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'menu/delete.do',req,successCallback,errorCallback);
        },
        GetMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'menu/get.do',req,successCallback,errorCallback);
        },
        UpdateMenu:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext()+'menu/update.do',req,config,successCallback,errorCallback);
        },
        GetAllOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/getAll.do',req,successCallback,errorCallback);
        },
        GetOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/get.do',req,successCallback,errorCallback);
        },
        AddOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/add.do',req,successCallback,errorCallback);
        },
        UpdateOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/update.do',req,successCallback,errorCallback);
        },
        DeleteOrg:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'org/delete.do',req,successCallback,errorCallback);
        },
        AddRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/add.do',req,successCallback,errorCallback);
        },
        DeleteRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'role/delete.do',req,successCallback,errorCallback);
        },
        GetRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/get.do',req,successCallback,errorCallback);
        },
        UpdateRole:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'role/update.do',req,successCallback,errorCallback);
        },
        AddUser:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'sysUser/add.do',req,config,successCallback,errorCallback);
        },
        DeleteUser:function(req,config,successCallback,errorCallback){
            doPost($tool.getContext() + 'sysUser/delete.do',req,config,successCallback,errorCallback);
        },
        InitPwd:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + 'sysUser/initPwd.do',req,successCallback,errorCallback);
        },
        GetUser:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'sysUser/get.do',req,successCallback,errorCallback);
        },
        UpdateUser:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'sysUser/update.do',req,config,successCallback,errorCallback);
        },
        GetUserInfo:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'personCenter/get.do',req,successCallback,errorCallback);
        },
        UpdateUserInfo:function(req,config,successCallback,errorCallback){
            doComplexPost($tool.getContext() + 'personCenter/update.do',req,config,successCallback,errorCallback);
        },
        DeleteMarterial: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/material/delete', req, config, successCallback, errorCallback);
        },
        AddMaterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/material/add',req,successCallback,errorCallback);
        },
        //
        GetMaterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/material/get',req,successCallback,errorCallback);
        },
        //
        UpdateMaterial:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/material/update',req,successCallback,errorCallback);
        },
        DeleteSupplier: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/supplier/delete', req, config, successCallback, errorCallback);
        },
        AddSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/supplier/add',req,successCallback,errorCallback);
        },
        UpdateSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/supplier/update',req,successCallback,errorCallback);
        },
        GetSupplier:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/supplier/list',req,successCallback,errorCallback);
        },
        GetIdMenu:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/getMenuId',req,successCallback,errorCallback);
        },
        GetMaterialall:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/material/list',req,successCallback,errorCallback);
        },
        /*materialGoodsBean的删除*/
        DeletematerialGoodsBean:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/delete',req,successCallback,errorCallback);
        },
        GetSupplierall:function(req,successCallback,errorCallback){
            doPost($tool.getContext()+'/supplier/getAll',req,successCallback,errorCallback);
        },
        addMaterialGoods:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/add',req,successCallback,errorCallback);
        },
        GetmaterialGoodsId:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/get',req,successCallback,errorCallback);
        },
        updateMaterialGoods:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/update',req,successCallback,errorCallback);
        },
        GetmaterialGoods:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/materialgoods/pagelist',req,successCallback,errorCallback);
        },
        purchaseOrderall:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/po/selectall',req,successCallback,errorCallback);
        },
        DeletePurchaseOrder: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/po/delete', req, config, successCallback, errorCallback);
        },
        editPurchaseOrder: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/po/update', req, config, successCallback, errorCallback);
        },
        stepbackFunction: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/po/updatestate', req, config, successCallback, errorCallback);
        },
        stepforward: function (req, config, successCallback, errorCallback) {
            doPost($tool.getContext() + '/po/updatestateforward', req, config, successCallback, errorCallback);
        },
        Addpo:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/po/add',req,successCallback,errorCallback);
        },
        getPoById:function(req,successCallback,errorCallback){
            doPost($tool.getContext() + '/po/list',req,successCallback,errorCallback);
        },



        /**/


    };




    //输出扩展模块
    exports('$api', API);
});


