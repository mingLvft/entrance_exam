<?php
namespace app\admin\controller;
use think\Controller;

class loginInfo extends Common{

    public function index(){
        //获取信息
        $data = db('login_info')->order('id')->paginate(10);
        $this->assign('data',$data);
        return $this->fetch();
    }

    //删除
    public function del(){
        $id = input('post.id/a');
        //转换成字符串方便使用mysql in语法
        $id = implode(',',$id);
        $res = db('login_info')->where("id in ($id)")->delete();
        if ($res){
            return json(array('status'=>1,'msg'=>'删除成功'));
        }else{
            return json(array('status'=>0,'msg'=>'删除失败'));
        }
    }
}