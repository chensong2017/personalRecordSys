<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/6/19
 * Time: 15:53
 */

namespace Admin\Controller;


use think\Controller;

class PersonalRecordController extends BaseAdminController{

    public function getList($start=1,$length=20){
        $search=I('search');
        $search=$search['value'];
        $total=M('personal_record')->where($where)->count();
        $list=M('personal_record')->where($where)->field('name,cellphone')->page($start,$length)->select();
        $data['draw']=I("draw");
        $data['recordsFiltered']=(int)$total;
        $data["recordsTotal"]=(int)$total;

        foreach ($list as $key=>$val){
            $list[$key]['operate']='<a href="http://www.w3school.com.cn">delete</a>';
        }
        $data["data"]=$list;
        echo json_encode($data);exit;
    }
    public function add(){}

    public function editView(){}

    public function delete(){}
}
