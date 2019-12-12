<?php
namespace app\index\controller;
use think\Controller;
use think\Cookie;

class Common extends Controller{

    public function _initialize(){
        //判断当前用户是否登录
        $admin = Cookie::get('user');
        if(!$admin){
//            $this->error('没有登录',url('Login/login'));
            $url = url('Login/login');
            echo "<script>top.location.href='$url'</script>";
        }
    }
}