<?php
namespace app\admin\controller;
use think\Controller;
use think\Cookie;
use think\db\Query;
class Topic extends Common{

    //题目首页
    public function index(){
        //获取信息
        $data = db('topic')->alias('a')->join('en_major b','a.major_id=b.id')
            ->field('a.*,b.major')->order('a.id')->paginate(10);
        $this->assign('data',$data);
        return $this->fetch();
    }

    //添加页面
    public function add(){
        //insert回调
//        Query::event('after_insert',function($data){
//            // 事件处理
//
//        });
        if(request()->isPost()){
            $model = db('topic');
            $data = input('post.data/a');
            unset($data['file']);
            if (!$data) {
                return json(array('status' => 0, 'msg' => '参数错误'));
            }
            $data['create_time'] = date("Y-m-d H:i:s");
            $upload_savename = Cookie::get('upload_savename');
            if(!empty($upload_savename)){
                //存入cookie中的文件路径
                $data['topic_img'] = $upload_savename;
            }
            $res = $model->insert($data);
            if ($res) {
                Cookie::delete('upload_savename');
                return json(array('status' => 1, 'msg' => '添加成功'));
            } else {
                return json(array('status' => 0, 'msg' => '添加失败'));
            }
        }else{
            $major = db('major')->select();
            $this->assign('major',$major);
            return $this->fetch();
        }
    }

    //修改页面
    public function edit(){
        if(request()->isPost()){
            $data = input('post.data/a');
            if (!$data) {
                return json(array('status' => 0, 'msg' => '参数错误'));
            }
            unset($data['file']);
            $upload_savename = Cookie::get('upload_savename');
            if(!empty($upload_savename)){
                //存入cookie中的文件路径
                $data['topic_img'] = $upload_savename;
            }
            $res = db('topic')->where('id',$data['id'])->update($data);
            if ($res !== false){
                Cookie::delete('upload_savename');
                return json(array('status'=>1,'msg'=>'修改成功'));
            }else{
                return json(array('status'=>0,'msg'=>'修改失败'));
            }
        }else{
            //获取id
            $id = input('get.id');
            $data = db('topic')->where('id',$id)->find();
            $this->assign('data',$data);
            $major = db('major')->select();
            $this->assign('major',$major);
            return $this->fetch();
        }
    }

    //删除
    public function del(){
        $id = input('post.id/a');
        //转换成字符串方便使用mysql in语法
        $id = implode(',',$id);
        $res = db('topic')->where("id in ($id)")->delete();
        if ($res){
            return json(array('status'=>1,'msg'=>'删除成功'));
        }else{
            return json(array('status'=>0,'msg'=>'删除失败'));
        }
    }

    //上传题目封面图
    public function upload_topic_img(){
        $id = input('post.id');
        if(!empty($id)){
            $topic_img = db('topic')->field('topic_img')->where('id',$id)->find();
            if(!empty($topic_img['topic_img'])){
                //删除以前提交文件
                unlink(ROOT_PATH . $topic_img['topic_img']);
            }
        }
        // 获取表单上传文件
        $file = request()->file('file');
        // 成功上传后 获取上传信息
        if($file){
            //获取上传文件状态 判断重复提交
            $upload_savename = Cookie::get('upload_savename');
            if(!empty($upload_savename)){
                //删除上次提交文件
                unlink(ROOT_PATH . $upload_savename);
            }
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH .'public'.DS.'upload_topic_img');
            //保存文件上传路径
            Cookie::set('upload_savename','public'.DS.'upload_topic_img'.DS.$info->getSaveName());
            return json(array('status'=>1,'msg'=>'上传成功','upload'=>'/entrance_exam/public'.DS.'upload_topic_img'.DS.$info->getSaveName()));
        }else{
            return json(array('status'=>0,'msg'=>'上传失败'));
        }
    }

}