<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        if(empty($_SESSION['user'])){
            $this->display('login');
        }
        //根据权限显示菜单
        else{
            $data=$this->getTreeNav();
            // 显示有权限的菜单
            $auth=new \Think\Auth();
            foreach ($data as $k => $v) {
                if ($auth->check($v['name'],$_SESSION['user']['id'])) {
                    foreach ($v['child'] as $m => $n) {
                        if(!$auth->check($n['name'],$_SESSION['user']['id'])){
                            unset($data[$k]['child'][$m]);
                        }
                    }
                }else{
                    // 删除无权限的菜单
                    unset($data[$k]);
                }
            }
            $this->assign(['data'=>$data]);
            $this->display('index');
        }
    }

    /**
     * 获取树形导航菜单
     * @param $data 全部权限菜单
     * @param $pid 上级菜单id
     * @return array
     */
    public function getTreeNav($data,$pid=0){
        if(empty($data)){
            $data=M('auth_rule')->select();
        }
        $temp=array();
        foreach ($data as $key=>$row){
            if($row['pid']==$pid){
               $row['child']=$this->getTreeNav($data,$row['id']);
               $temp[]=$row;
            }
        }
        return $temp;
    }

    public function loginView(){
        $this->display('login');
    }

    public function checkLogin(){
        $map['username']=I('userName');
        $map['password']=md5(I('password'));
        $data=M('admin_user')->where($map)->select();
        if(!empty($data)){
            $_SESSION['user']=$data[0];
            echo json_encode(["resultCode"=>1,"resultMsg"=>"登陆成功！"]);
        }
        else{
            echo json_encode(["resultCode"=>-2,"resultMsg"=>"账号或密码错误！"]);
        }
    }
    /**
     * 退出
     */
    public function logout(){
        session('user',null);
        //$this->success('退出成功、前往登录页面',U('admin/Index/index'));
        //$this->display('login');
        header("location: ".__CONTROLLER__."/index");
    }

}