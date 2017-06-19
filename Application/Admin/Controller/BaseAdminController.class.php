<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/6/16
 * Time: 14:48
 */

namespace Admin\Controller;
use think\Controller;

class BaseAdminController extends Controller{
    //验证登陆和权限
    public function _initialize(){
        if(!session('user')){
            $this->display('Admin/index/login');
        }
        //验证权限
        $auth=new \Think\Auth();
        $rule_name=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        $result=$auth->check($rule_name,$_SESSION['user']['id']);
        if(!$result){
            echo json_encode(['resultCode'=>-1,'resultMsg'=>'你没有权限操作此模块']);exit();
        }
    }
}
