<?php

/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/6/8
 * Time: 18:44
 */
namespace api\common\controller;



use cmf\controller\RestBaseController;
use think\Request;

class BaseController extends RestBaseController
{

    /*异常码*/

    /*系统异常*/
    const CODE_SYSTEM_ERROR = 999;
    /*传参异常*/
    const CODE_PARAMS_ERROR = 110;

    /*处理业务失败*/
    const CODE_BUSINESS_ERROR = 108;

    protected $request;

    /*用户数据*/
    protected $uc_id;
    protected $uc_token;
    protected $uc_tel;

    function __construct(Request $request)
    {
        $this->request = $request;
        parent::__construct($request);
        $this->_initialize();
        $this->check_token();
    }


    function _initialize()
    {
        if (!defined('MODULE_NAME'))define('MODULE_NAME', $this->request->module());
        if (!defined('CONTROLLER_NAME'))define('CONTROLLER_NAME', $this->request->controller());
        if (!defined('ACTION_NAME'))define('ACTION_NAME', $this->request->action());
        parent::_initialize();
    }


    final function check_token(){
        $this->uc_id = input('param.uc_id','');
        $this->uc_token = input('param.uc_token','');
        $check_arr = [
            'clothing'=>['save_clothing','submit_clothing']
        ];
        $controller_name = strtolower(CONTROLLER_NAME);
        $action_name = strtolower(ACTION_NAME);
        if (in_array($controller_name,array_keys($check_arr)) && in_array($action_name,$check_arr[$controller_name])){
            if (empty($this->uc_token) || empty($this->uc_id)) $this->error('token and id must be not null');
            $uc = Db::name('UserCustomer')
                ->where(['uc_id'=>$this->uc_id])
                ->field(['uc_id','uc_tel','uc_token'])
                ->find();
            throw_if_false($uc);
            if (!$uc || $uc['uc_token'] !== $this->uc_token) $this->error('account or token error');
            $this->uc_tel = $uc['uc_tel'];
        }
    }


}