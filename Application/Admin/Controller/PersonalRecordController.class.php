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
        $page=(int)($start/$length)+1;
        $list=M('personal_record')->where($where)->field('name,sex,age,native_place,nation,cellphone,political_status,degree,ID_number,email')->page($page,$length)->select();
        $data['draw']=I("draw");
        $data['recordsFiltered']=(int)$total;
        $data["recordsTotal"]=(int)$total;

        foreach ($list as $key=>$val){
            $list[$key]['operate']='<a href="http://www.w3school.com.cn">delete</a>';
        }
        $data["data"]=$list;
        echo json_encode($data);exit;
    }
    public function addBasic(){
        $recordId=I('get.recordId');
        if($this->_method=='get'){
            if(!empty($recordId)){
                $record=M('personal_record')->where(['id'=>$recordId])->select();
                $this->assign('recordId',$recordId);
                $this->assign('record',$record[0]);
            }

            $this->display();
        }
        elseif ($this->_method=='post'){
            $record=I("post.");
            $ret=M('personal_record')->add($record);
            if($ret){
                $this->response(['resultCode'=>1,'resultMsg'=>'操作成功！','recordId'=>$ret],'json');
            }
            $this->response(['resultCode'=>-1,'resultMsg'=>'操作失败！'],'json');
        }
    }

    public function editView(){}

    public function delete(){}

    public function addImg(){
        $recordId=I('get.recordId');
        if($this->_method=='get'){
            //获取已上传图片
            $imgs=M('personal_record')->where(['id'=>$recordId])->field('photo')->select();
            //如果第一个字符是","则去掉
            if(substr($imgs[0]['photo'],0,1)==','){
                $imgs=substr($imgs[0]['photo'],1);
            }
            if(!empty($imgs)){
                $imgs=explode(',',$imgs);
            }else{
                $imgs=array();
            }
            $this->assign('imgs',$imgs);
            $this->assign('recordId',$recordId);
            $this->display();exit();
        }

        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath  =     __DIR__."/../../../upload/"; // 设置附件上传根目录
        $upload->savePath  =     ''; // 设置附件上传（子）目录
        // 上传文件
        //echo $upload->rootPath;exit();
        $info   =   $upload->upload();
        if(!$info) {// 上传错误提示错误信息
            $this->error();
        }else{// 上传成功
            $savePath=$info['file']['savepath'].$info['file']['savename'];
            M()->execute("update  personal_record set photo=concat(photo,',','$savePath') where id=$recordId");
            $this->response(['resultCode'=>1,'resultMsg'=>'上传成功！','savePath'=>$savePath],'json');
            //print_r($info);
        }
    }

    public function deleteImg($recordId){
        $filePath=I('get.filePath');
        //删除文件
        $path=realpath(str_replace('/','\\',APP_PATH.'../upload/'.$filePath));
        unlink($path);
        $filePath=",$filePath";
        M('personal_record')->execute("update  personal_record set photo=replace(photo,'$filePath','') where id=%d",$recordId);
        $this->response(['resultCode'=>1,'resultMsg'=>'删除成功！'],'json');
    }

    public function workExperience($method='get'){
        $recordId=I('get.recordId');
        $id=I('get.id');
        //get查询视图或者详情
        if($this->_method=='get'){
            //无id查询视图
            if(empty($id)){
                if(!empty($recordId)){
                    $list=M('work_experience')->where(['record_id'=>$recordId])->select();
                    $this->assign('recordId',$recordId);
                    $this->assign('list',$list);
                }
                $this->display();
            }
            //有id查询详情
            else{
                if($method=='get'){
                    $work=M('work_experience')->where(['id'=>$id])->select();
                    $this->response(['resultCode'=>1,'resultMsg'=>'操作成功！','data'=>$work[0]],'json');
                }
                elseif ($method=='delete'){
                    $ret=M('work_experience')->where(['id'=>$id])->delete();
                    if($ret){
                        $this->response(['resultCode'=>1,'resultMsg'=>'操作成功！','recordId'=>$ret],'json');
                    }
                    $this->response(['resultCode'=>-1,'resultMsg'=>'操作失败！'],'json');
                }
            }
        }
        //post添加或者修改
        elseif ($this->_method=='post'){
            $work=I("post.");
            $ret=M('work_experience')->add($work);
            if($ret){
                $this->response(['resultCode'=>1,'resultMsg'=>'操作成功！','id'=>$ret],'json');
            }
            $this->response(['resultCode'=>-1,'resultMsg'=>'操作失败！'],'json');
        }
    }

    public function delWork($id){
        $ret=M('work_experience')->where(['id'=>$id])->delete();
        if($ret){
            $this->response(['resultCode'=>1,'resultMsg'=>'操作成功！','recordId'=>$ret],'json');
        }
        $this->response(['resultCode'=>-1,'resultMsg'=>'操作失败！'],'json');
    }
}
