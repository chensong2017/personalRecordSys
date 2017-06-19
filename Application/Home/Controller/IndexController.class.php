<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
       if(empty($_SESSION['user'])){
           //$this->display('amdin/index/index');
           header("location: index.php/admin/index");
       }
    }
}