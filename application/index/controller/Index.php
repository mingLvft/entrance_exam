<?php
namespace app\index\controller;
use think\Controller;
use think\Cookie;
class Index extends Common
{
    //首页
    public function index(){
        $data = db('major')->select();
        $this->assign('data',$data);
        return $this->fetch();
    }
}
