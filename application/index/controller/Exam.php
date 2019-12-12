<?php
namespace app\index\controller;
use think\Cookie;

class Exam extends Common
{
    //考试页面
    public function index(){
        $id = input('get.id');
        $data = db('topic')->field('a.*,b.major')->alias('a')->join('en_major b','a.major_id=b.id')->where('major_id',$id)->select();
        if(empty($data)){
            $this->error('暂时没有题',url('Index/index'));
        }
        $this->assign('data',$data);
        return $this->fetch();
    }

    //提交
    public function submit(){
        $data = input('post.');
        //查询出正确答案
        $answer_value = db('topic')->where('major_id',$data['major_id'])->select();
        foreach ($answer_value as $key => $value) {
            $answer[$value['id']] = $value['right_key'];
        }
        //判断分数
        $score = count(array_intersect_assoc($data,$answer));
        $score*=5;
        //取出cookie登陆信息
        $user = Cookie::get('user');
        //保存测试分数
        db('login_info')->where('name',$user['name'])->setField('score',$score);
        //查询专业信息
        $major = db('major')->where('id',$data['major_id'])->find();
        $grade = db('grade')->select();
        foreach ($grade as $key => $value){
            //判断分数获取评价
            if($grade[$key]['star']>$score && $score<=$grade[$key]['end']){
                $evaluate = $grade[$key]['content'];
                $this->assign('evaluate',$evaluate);
            }elseif($grade[$key]['star']==0 && $grade[$key]['end']==0 && $grade[$key]['major']==null ){  //默认评价
                $evaluate = $grade[$key]['content'];
                $this->assign('evaluate',$evaluate);
            }
        }
        $this->assign('name',$user['name']);
        $this->assign('major',$major['major']);
        $this->assign('score',$score);
        $this->assign('grade',$grade);
        return $this->fetch('result');
    }

    //正确答案
    public function answer(){
        $id = input('get.id');
        $data = db('topic')->field('a.*,b.major')->alias('a')->join('en_major b','a.major_id=b.id')->where('major_id',$id)->select();
        if(empty($data)){
            $this->error('暂时没有题',url('Index/index'));
        }
        $this->assign('data',$data);
        return $this->fetch();
    }
}