<?php
namespace app\admin\controller;
use think\Controller;
use think\Cookie;
use think\captcha\Captcha;
class Login extends Controller{

    //验证登陆
    public function login(){
        if (request()->isPost()) {
            $data = input('post.data/a');
            //验证 验证码
            $captcha = new Captcha();
            $res = $captcha->check($data['captcha']);
            if(!$res){
                return json(array('status'=>0,'msg'=>'验证码错误'));
            }
            //验证用户和密码
            $info = db('admin')->where('username',$data['username'])->find();
            if(!$info){
                //用户不存在
                return json(array('status'=>0,'msg'=>'用户名不存在'));
            }
            if($data['password'] != $info['password']){
                //密码错误
                return json(array('status'=>0,'msg'=>'密码错误'));
            }
            //保存用户信息是正确的可以登录  保存用户信息
            Cookie::set('admin',$info);
            Cookie::set('name',$info['username']);
            //保存最后登录时间
            $time = date('Y-m-d H:i:s');
            db('admin')->where('id',$info['id'])->setField('login_time',$time);
            //保存最后登录ip
            $ip = request()->ip();
            db('admin')->where('id',$info['id'])->setField('login_ip',$ip);
            //保存ip真实地址
            $IpLocation = new \ipLocation\IpLocation();
            $site = $IpLocation->getlocation($ip);
            $site['country']=iconv('gb2312', 'utf-8', $site['country']);
            $site['area']=iconv('gb2312', 'utf-8', $site['area']);
            db('admin')->where('id',$info['id'])->setField('login_site',$site['country'].$site['area']);
            return json(array('status'=>1,'msg'=>'登陆成功'));
        } else {
            return $this->fetch();
        }
    }

    //退出登录
    public function logout(){
        //删除cookie
        Cookie::delete('admin');
        Cookie::delete('name');
        //跳转到登陆页面
        $this->redirect(url('Login/login'));
    }

    //生成验证码
    public function verify()
    {
        //如果gd库也开启了但是就是不能正常的生成验证码可以使用ob_clean()实现
        $config = array(
            'fontSize' => 20,              // 验证码字体大小(px)
            'useCurve' => false,            // 是否画混淆曲线
            'useNoise' => false,            // 是否添加杂点
            'imageH' => 50,               // 验证码图片高度
            'imageW' => 140,               // 验证码图片宽度
            'length' => 4,               // 验证码位数
            'fontttf' => '4.ttf',              // 验证码字体，不设置随机获取
            'reset ' => true
        );
        //实例化验证码类
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
}