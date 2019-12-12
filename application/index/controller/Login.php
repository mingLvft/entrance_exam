<?php
namespace app\index\controller;
use think\Controller;
use think\Cookie;

class Login extends Controller
{
    //登陆页面
    public function login(){
        if(request()->isPost()){
            $data = input('post.');
            //判断重复名字
            $status = db('login_info')->where('name',$data['name'])->find();
            if($status){
                $this->error('登陆名重复');
            }
            $data['login_time'] = date('Y-m-d H:i:s');
            Cookie::set('user',$data);
            //保存登陆信息
            $id = db('login_info')->insertGetId($data);
            //保存最后登录ip
            $ip = request()->ip();
            db('login_info')->where('id',$id)->setField('login_ip',$ip);
            //保存ip真实地址
            $IpLocation = new \ipLocation\IpLocation();
            $site = $IpLocation->getlocation($ip);
            $site['country']=iconv('gb2312', 'utf-8', $site['country']);
            $site['area']=iconv('gb2312', 'utf-8', $site['area']);
            db('login_info')->where('id',$id)->setField('login_site',$site['country'].$site['area']);
            //跳转首页
            $url = url('Index/index');
            echo "<script>top.location.href='$url'</script>";
        }else{
            return $this->fetch();
        }
    }
}
