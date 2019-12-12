<?php
namespace app\admin\controller;

class Admin extends Common{


    public function index(){
        $data = db('admin')->order('id')->paginate(10);
        $this->assign('data',$data);
        return $this->fetch();
    }

    //添加页面
    public function add(){
        if(request()->isPost()){
            $model = db('admin');
            $data = input('post.data/a');
            if (!$data) {
                return json(array('status' => 0, 'msg' => '参数错误'));
            }
            $data['create_time'] = date("Y-m-d H:i:s");
            $res = $model->insert($data);
            if ($res) {
                return json(array('status' => 1, 'msg' => '添加成功'));
            } else {
                return json(array('status' => 0, 'msg' => '添加失败'));
            }
        }else{
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
            $res = db('admin')->where('id',$data['id'])->update($data);
            if ($res !== false){
                return json(array('status'=>1,'msg'=>'修改成功'));
            }else{
                return json(array('status'=>0,'msg'=>'修改失败'));
            }
        }else{
            //获取id
            $id = input('get.id');
            $data = db('admin')->where('id',$id)->find();
            $this->assign('data',$data);
            return $this->fetch();
        }
    }

    //删除
    public function del(){
        $id = input('post.id/a');
        //转换成字符串方便使用mysql in语法
        $id = implode(',',$id);
        $res = db('admin')->where("id in ($id)")->delete();
        if ($res){
            return json(array('status'=>1,'msg'=>'删除成功'));
        }else{
            return json(array('status'=>0,'msg'=>'删除失败'));
        }
    }
}