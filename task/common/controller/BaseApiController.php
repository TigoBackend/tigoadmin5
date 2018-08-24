<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/2/26
 * Time: 16:56
 */

namespace task\common\controller;


use cmf\controller\RestBaseController;
use think\Request;


/**
 * 基础接口控制器
 * Class BaseApiController
 * @package app\common\controller
 */
class BaseApiController extends RestBaseController
{

    /*异常码*/

    /*系统异常(不允许出现，正式环境下不返回该状态下的错误提示，要提示友好的提示给用户看)*/
    const CODE_SYSTEM_ERROR = -999;
    /*缺少参数（正式环境下不提示该状态下的错误给用户看，要提示友好的提示给用户看）*/
    const CODE_PARAMS_ERROR = -1;
    /*密码错误（正式环境下可以正常提示该状态下的错误给用户看）*/
    const CODE_PASSWORD_ERROR = -2;
    /*验证码错误（正式环境下可以正常提示该状态下的错误给用户看）*/
    const CODE_VERIFY_CODE_ERROR = -3;
    /*帐号重复/错误（正式环境下可以正常提示该状态下的错误给用户看）*/
    const CODE_ACCOUNT_ERROR = -4;
    /*没有权限（正式环境下可以正常提示该状态下的错误给用户看）*/
    const CODE_AUTH_ERROR = -5;
    /*系统内部业务错误（不允许出现，正式环境下不提示该状态下的错误给用户看，要提示友好的提示给用户看）*/
    const CODE_INTERNAL_ERROR = -6;
    /*正常业务错误如：购买东西余额不足，发送短信过于频繁等（正式环境下可以正常提示该状态下的错误给用户看）*/
    const CODE_BUSINESS_ERROR = -7;
    /*token错误（正式环境下不提示该状态下的错误给用户看，要提示友好的提示给用户看或者直接跳转登录页）*/
    const CODE_TOKEN_ERROR = -10;
    /*接口不存在（正式环境下不提示该状态下的错误给用户看，要提示友好的提示给用户看或者直接跳转登录页）*/
    const CODE_API_ERROR = -404;



    public function __construct(Request $request = null)
    {
        parent::__construct($request);
    }


    /**
     * 初始化
     */
    public function _initialize()
    {
        parent::_initialize();
        if ($this->request->method() === 'OPTIONS') $this->success('success');
        header('Access-Control-Allow-Origin: *');
        defined('MODULE_NAME') or define('MODULE_NAME',$this->request->module());
        defined('CONTROLLER_NAME') or define('CONTROLLER_NAME',$this->request->controller());
        defined('ACTION_NAME') or define('ACTION_NAME',$this->request->action());
        config('default_return_type','json');
    }




}