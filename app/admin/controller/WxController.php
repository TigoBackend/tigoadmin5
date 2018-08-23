<?php
/**
 * yhx 20170906
 * 微信相关控制器
 */
namespace app\admin\controller;

use app\admin\model\WxMenuModel;

use app\common\lib\wx\InterfaceWxApi;
use cmf\controller\AdminBaseController;
use think\Db;
use Waters\WebChatApi\Api\WeiXinApi;
use Waters\WebChatApi\Exception\WeiXinException;

class WxController extends AdminBaseController
{


    /**
     * 菜单列表页
     * @return mixed
     */
    public function index(){
        $model = new WxMenuModel();
        $menus = $model -> get_menus_trees();
        $this->assign('menus',$menus);
        return $this->fetch();
    }

    /**
     * 发布菜单
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function publish(){
        try{
            $model = new WxMenuModel();
            $menus = $model->order('parent_id')->select()->toArray();
            $menus = ['button'=>$this->createButtons($menus,0)];
            vendor('waters.webchatapi.index');
            $config = config('wx_config');
            $business = new InterfaceWxApi($config['app_id']);
            $api = new WeiXinApi($config,$business);
            $rs = $api->create_custom_menu($menus);
            if ($rs['errcode']) $this->error($rs['errmsg']);
            $this->success($rs['errmsg']);
        }catch (WeiXinException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 从微信服务器拉取公众号菜单数据到本地
     */
    public function sync(){
        try{
            vendor('waters.webchatapi.index');
            $config = config('wx_config');
            $business = new InterfaceWxApi($config['app_id']);
            $api = new WeixinApi($config,$business);
            $menu = $api->get_custom_menu();
            $buttons = $menu['selfmenu_info']['button'];
            $model = new WxMenuModel();
            $model->clear_menu();
            if ($buttons){
                $this->addButtons($buttons,0);
            }
            $this->success('拉取完毕');
        }catch (WeiXinException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 自动将微信公众号菜单转换为本地数据库数据
     * @param $buttons
     * @param $parent_id
     */
    private function addButtons($buttons,$parent_id){
        $sort = 1;
        foreach ($buttons as $button){
            $data = array();
            $data['parent_id'] = $parent_id;
            $data['list_order'] = $sort++;
            $data['name'] = $button['name'];
            if(!isset($button['sub_button'])){
                $type = $button['type'];
                if($type == 'view'){
                    $data['type'] = 'view';
                }else{
                    $data['type'] = 'click';
                }
                $data['content_type'] = $type;
                if(isset($button['value'])){
                    $data['content_value'] = $button['value'];
                }
                if(isset($button['url'])){
                    $data['content_value'] = $button['url'];
                }
                if(isset($button['key'])){
                    $data['content_value'] = $button['key'];
                }
                if(isset($button['news_info'])){
                    $data['content_value'] = json_encode($button['news_info']['list']);
                }
            }
            $data['id'] = Db::name('WxMenu')->insert($data);
            if(isset($button['sub_button'])){
                $sub_buttons = $button['sub_button']['list'];
                $this->addButtons($sub_buttons, $data['id']);
            }
        }
    }






    /**
     * 将本地微信公众号菜单数据封装成微信接口需要的button数据
     * @param $menus
     * @param $parent_id
     * @return array
     */
    private function createButtons($menus,$parent_id){
        $json = [];
        foreach ($menus as $menu){
            if($menu['parent_id'] != $parent_id){
                continue;
            }
            $data = [];
            $data['name'] = urlencode($menu['name']);
            if(empty($menu['type'])){
                $sub_buttons = $this->createButtons($menus , $menu['id']);
                $data['sub_button'] = $sub_buttons;
            }else{
                $type = $menu['type'];
                $data['type'] = $type;
                if($type == 'view'){
                    $data['url'] = $menu['content_value'];
                }else{
                    $data['key'] = $menu['id'];
                }
            }
            array_push($json, $data);
        }
        return $json;
    }


    /**
     * 新增菜单页面
     */
    public function add(){
        $parent_id = $this->request->param('parent_id',0,'intval');
        $this->assign('parent_id',$parent_id);
        return $this->fetch();
    }



    /**
     * 提交新增菜单数据
     */
    public function add_post(){
        $params = $this->request->post();
        $params['content_type'] = $params['type'];
        $rs = Db::name('WxMenu')->insert($params);
        if (empty($rs))$this->error('新增菜单失败');
        $this->success('添加完毕');
    }


    /**
     * 删除菜单
     */
    public function drop(){
        $id = $this->request->param('id',0,'intval');
        if (!$id) $this->error('未知菜单');
        $model = new WxMenuModel();
        $model->where(['id'=>$id])->whereOr(['parent_id'=>$id])->delete();
        $this->success('操作完毕');
    }


    /**
     * 编辑菜单
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit(){
        $id = $this->request->param('id',0,'intval');
        $wm = Db::name('WxMenu')->where(['id'=>$id])->find();
        $this->assign('wm',$wm);
        return $this->fetch();
    }


    /**
     * 提交编辑菜单
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function edit_post(){
        $params = $this->request->post();
        $params['content_type'] = $params['type']?$params['type']:'';
        $rs = Db::name('WxMenu')->where(['id'=>$params['id']])->update($params);
        if(!$rs) $this->error('更新失败');
        $this->success('更新完毕');
    }




}