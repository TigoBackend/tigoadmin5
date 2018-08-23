<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/2/26
 * Time: 18:00
 */

namespace app\entry\controller;


use app\common\controller\BaseApiController;
use Firebase\JWT\JWT;

class EntryBaseController extends BaseApiController
{

    /*经纪人实例*/
    protected $user_agent;
    /*用户实例*/
    protected $user_customer;

    /**
     * 初始化经纪人验证
     */
    public function _initialize()
    {
        
        parent::_initialize();
        /*解析token*/
        $this->parse_token();
        /*验证登录权限*/
        $this->check_permission();
    }


    /**
     * 验证接口登录权限
     */
    private function check_permission(){
        $verify_list = config('entry_verify_list');
        $controller_name = strtolower(CONTROLLER_NAME);
        $action_name = strtolower(ACTION_NAME);
        /*用户登录权限验证*/
        $customer_check = null;
        $agent_check = null;
        if (in_array($controller_name,array_keys($verify_list)) && in_array($action_name,$verify_list[$controller_name])) {
            /*验证是否已登录*/
            if (true) $this->error(['msg'=>'请先登录','code'=>self::CODE_ACCOUNT_ERROR]);
        }

    }

    /**
     * 解析用户信息
     * @return bool
     */
    private function parse_token(){

        try{
            /*封装验证码*/
            $token = $this->request->header('Authorization');
            if ($token){
                $auth = explode(' ',$token);
                if (count($auth) !== 2 || empty($auth[0]) || empty($auth[1]) || $auth[0] !== 'Bearer') return false;
                $auth = $auth[1];
            }else{
                $token = input('token','');
                if (empty($token)) return false;
                $auth = $token;
            }

            /*校验token*/
            vendor('firebase.php-jwt.index');
            $token_info = explode('.',$auth);
            if (count($token_info) !== 3)return false;
            JWT::decode($auth,config('jwt.key'),['HS256']);
            /*解析用户信息*/
            $user_info = json_decode(JWT::urlsafeB64Decode($token_info[1]),true);
            /*根据解析出来的原始信息查找用户信息*/



            return true;

        }catch (\Exception $e){
            end_trans($e);
//            $this->error(['msg'=>$e->getMessage(),'code'=>self::CODE_PARAMS_ERROR]);
            return false;
        }

    }





}