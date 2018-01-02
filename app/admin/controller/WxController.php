<?php
/**
 * yhx 20170906
 * 微信相关控制器
 */
namespace app\admin\controller;

use \think\Cache;

use app\admin\model\SettingModel;
use app\admin\model\WxMenuModel;
use \app\wx\extend\InterfaceWXCommon;

use cmf\controller\AdminBaseController;

class WxController extends AdminBaseController
{


	/**
     * 微信菜单列表   1级菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:43:49+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_index()
    {
        $WxMenuModel = new WxMenuModel();
        $map['delete_time'] = 0;
        $map['parent_id'] = 0;
        $WxMenu         = $WxMenuModel->where($map)->order('menu_id DESC')->paginate();//分页查询
        foreach ($WxMenu as $k => $v) {
            $WxMenu[$k]['is_show_zh'] = $WxMenu[$k]['is_show'];
            $WxMenu[$k]['type_zh'] = $WxMenu[$k]['type'];
        }
        $this->assign('WxMenu', $WxMenu);
        $this->assign('page', $WxMenu->render());
        return $this->fetch();
    }

    /**
     * 微信菜单添加页面 1级菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:44:57+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_add()
    {
    	$WxMenuModel = new WxMenuModel();
        $map['delete_time'] = 0;
        $map['parent_id'] = 0;
        $parent = $WxMenuModel->where($map)->order('menu_id DESC')->select();//1级菜单
        $this->assign('parent', $parent);
        return $this->fetch();
    }

    /**
     * 添加微信菜单 1级菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:46:33+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_addPost()
    {
        $WxMenuModel = new WxMenuModel();
        $data           = $this->request->param();
        // dump($data);die();
        $type = $data['type'];
        $url = $data['url'];
        $key = $data['key'];
        if($type == 1){
        	if(empty($key)){
        		$this->error("关键词不能为空");
        	}
        }elseif($type == 2){
        	if(empty($url)){
        		$this->error("外链地址不能为空");
        	}
        }
        $result         = $WxMenuModel->validate(true)->save($data);
        if ($result === false) {
            $this->error($WxMenuModel->getError());
        }
        $this->success("添加成功！");
    }

    /**
     * 编辑微信菜单页面 1级菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:50:22+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_edit()
    {
        $id             = $this->request->param('id');
        $WxMenuModel = new WxMenuModel();
        $result         = $WxMenuModel->where('menu_id', $id)->find();

        $map['delete_time'] = 0;
        $map['parent_id'] = 0;
        $parent = $WxMenuModel->where($map)->order('menu_id DESC')->select();//1级菜单

        $this->assign('parent', $parent);
        $this->assign('result', $result);
        return $this->fetch();
    }

    /**
     * 编辑微信菜单 1级菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:50:22+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_editPost()
    {
    	$WxMenuModel = new WxMenuModel();
        $data           = $this->request->param();
        $type = $data['type'];
        $url = $data['url'];
        $key = $data['key'];
        if($type == 1){
        	if(empty($key)){
        		$this->error("关键词不能为空");
        	}
        }elseif($type == 2){
        	if(empty($url)){
        		$this->error("外链地址不能为空");
        	}
        }
        $result         = $WxMenuModel->validate(true)->save($data, ['menu_id' => $data['menu_id']]);
        if ($result === false) {
            $this->error($WxMenuModel->getError());
        }
        $this->success("保存成功！");
    }

    /**
     * 删除微信菜单
     * @Author   YHX
     * @DateTime 2017-07-05T14:50:22+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_delete()
    {
        $id             = $this->request->param('id', 0, 'intval');
        $WxMenuModel = new WxMenuModel();
        $result         = $WxMenuModel->save(['delete_time' => time()], ['menu_id' => $id]);
        if ($result === false) {
            $this->error($WxMenuModel->getError());
        }
        $this->success("删除成功！");
    }

    /**
     * 子菜单列表
     * @Author   YHX
     * @DateTime 2017-09-07T14:49:55+0800
     * @return   [type]                   [description]
     */
    public function wx_sub_menu(){
    	$WxMenuModel = new WxMenuModel();
    	$id = $this->request->param('id', 0, 'intval');
        $map['delete_time'] = 0;
        $map['parent_id'] = $id;
        $WxMenu         = $WxMenuModel->where($map)->order('menu_id DESC')->paginate();//分页查询
        foreach ($WxMenu as $k => $v) {
            $WxMenu[$k]['is_show_zh'] = $WxMenu[$k]['is_show'];
            $WxMenu[$k]['type_zh'] = $WxMenu[$k]['type'];
        }
        $this->assign('WxMenu', $WxMenu);
        $this->assign('page', $WxMenu->render());
        return $this->fetch();
    }

    /**
     * 生成微信菜单
     * @Author   YHX
     * @DateTime 2017-09-07T17:21:51+0800
     * @return   [type]                   [description]
     */
    public function wx_menu_create(){
        vendor('wxapi.index');
        $interface = new \InterfaceWxApiCommon();
        $api = new \WeixinApi(config('wx_config'),$interface);

        //获取菜单数据
        $top_menu = get_top_menu();
        foreach ($top_menu as $k => $v) {//组装菜单格式
            $top_menu[$k]['sub_button'] = get_sub_menu($v['menu_id']);
            unset($top_menu[$k]['menu_id']);
            if(empty($top_menu[$k]['sub_button'])){
                unset($top_menu[$k]['sub_button']);
            }else{
                unset($top_menu[$k]['type']);
                unset($top_menu[$k]['key']);
                unset($top_menu[$k]['url']);
            }
        }
        $menus = ['button'=>$top_menu];
        
        $rs = $api->create_custom_menu($menus);
        if($rs['errcode'] == 0){
            $this->success("生成成功");
        }else{
            $this->error("生成失败,稍后请重试".$rs['errmsg']);
        }
    }




}