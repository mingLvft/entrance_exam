<?php
namespace app\admin\controller;
use think\Controller;

class Index extends Common{

    public function index(){
        return $this->fetch();
    }

    public function welcome(){
        $time = date('Y-m-d H:i:s');
        $this->assign('time',$time);
        return $this->fetch();
    }
}