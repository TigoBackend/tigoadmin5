<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\api\controller;

use think\Cache;
use think\Db;
use think\Request;
use think\Controller;
use think\Log;

class BaseController extends Controller
{
    public $member_id = 0;//用户id
    /**
     * BaseController constructor.
     */
    function __construct()
    {
        header("Content-Type: text/html; charset=utf-8");
        header('Access-Control-Allow-Origin:*');
        header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS");
        header('Access-Control-Max-Age:600');
        header('Access-Control-Allow-Headers: X-Requested-With, Content-Type, Accept');
        $this->checkToken();
    }
    //检查token
    public function checkToken()
    {
        $member_id = input("member_id"); // 获取用户id
        $token = input("token"); // 获取token

        // 判断哪些控制器的 哪些方法需要登录验证的
        $check_arr = array(
            'api'=>array(//验证模块名
                'machine'=>array('add_machine','update_machine','check_publish_num','check_view_num','collect','delete','change_sale_status','adjust_again'),
                'rent'=>array('add_rent','update_rent','check_publish_num','check_view_num','collect','delete','change_sale_status','adjust_again'),
                'my'=>array('detail','machine_list','rent_list','update_user','collect_machine_list','collect_rent_list','real_check','change_phone','invite_list','qrcode','invite_link','company_adjust','submit_company_adjust','check_num','company_check'),
                'article'=>array('comment','like'),
                'common'=>array('add_feedback'),
                'notice'=>array('notice_type','notice_list','notice_detail','notice_set_list','notice_set','has_unread'),
            ),
        );


        $request = Request::instance();
        $module_name = strtolower($request->module());//访问模块
        $controller_name = strtolower($request->controller());//访问控制器名
        $action_name = strtolower($request->action());     //访问方法名
       // echo $module_name;echo $controller_name;echo $action_name;die;
        /*检查token*/
        if(in_array($module_name, array_keys($check_arr)) && in_array($controller_name, array_keys($check_arr[$module_name])) && in_array($action_name, $check_arr[$module_name][$controller_name])){
            if(empty($token)){
                $this->showFalseJson('必须传token',-10);
            }
            if(empty($member_id)){
                $this->showFalseJson('必须传用户member_id',-1);
            }
            
            $where['member_id'] = $member_id;
            $where['token'] = $token;
            $user = Db::name('member')->where($where)->find();
            if(empty($user)){
                $this->showFalseJson('用户member_id或token有误,请重新授权',-10);
            }
            if($user['delete_time']){
                $this->showFalseJson('用户已注销',-11);
            }
            // if($user['is_ban'] == 1){
            //     $this->showFalseJson('用户已被拉黑',-11);
            // }
            $this->member_id = $user['member_id'];
        }
    }
    
    //成功返回
    public function showTrueJson($data=array(),$msg='请求成功',$code=1)
    {
        $result = array("data" => empty($data) ? (object)[] : $data, "msg" => $msg,"code" => $code);
        header('Content-Type:application/json; charset=utf-8');
        exit(json_encode($result));
    }
    //失败返回
    public function showFalseJson($msg,$code=-1,$data=array())
    {
        $result = array("data" => (object)$data,"msg" => $msg,"code" => $code,);
        header('Content-Type:application/json; charset=utf-8');
        exit(json_encode($result));
    }

    /*api访问出错时的跳转函数*/
    public function miss()
    {
        $this->showFalseJson("地址有误",-404);
    }


}