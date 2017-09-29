<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/9/28
 * Time: 17:56
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use api\common\lib\exception\MyException;
use api\common\lib\wx\InterfaceMsg;
use think\Request;
use Waters\WebChatApi\Api\WeiXinApi;
use Waters\WebChatApi\Business\InterfaceWxApiForTP5;
use Waters\WebChatApi\Msg\WxMsgHandler;

class WxController extends BaseController
{

    /**
     * 微信授权登录
     */
    public function login(){
        try{
            /*校验数据*/
            $params = input('param.');
            if (isset($params['callback']) && isset($params['type']) && $params['callback'] && $params['type']){        /*请求code*/
                $wx_config = config('wx_config');
                check_params($wx_config,['app_id','app_secret']);
                vendor('waters.webchatapi.index');
                $interface = new InterfaceWxApiForTP5();

                $api = new WeiXinApi($wx_config,$interface);
                $redirect_url = url('index/Wx/login_callback','',false,true);
                $state = "{$params['callback']}__{$params['type']}";
                $api->get_code($redirect_url,urlencode($state),null,WeiXinApi::PROCESS_REDIRECT);
            }else{
                config('default_return_type','html');
                return '<h1>login.....</h1>';
            }

        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }
    }


    /**
     * 微信code回调
     */
    public function login_callback(){
        try{
            /*校验数据*/
            $params = input('param.');
            if (isset($params['code']) && isset($params['state']) && $params['code'] && $params['state']){
                $wx_config = config('wx_config');
                check_params($wx_config,['app_id','app_secret']);
                vendor('waters.webchatapi.index');
                $interface = new InterfaceWxApiForTP5();
                $api = new WeixinApi($wx_config,$interface);
                /*校验数据*/
                $state = explode("__",urldecode($params['state']));
                /*获取用户信息*/
                $user_info = $api -> get_user_info($params['code']);
                if ($user_info){
                    $user_wx = [
                        'uw_nick_name'=>filter_emoji($user_info['nickname']),
                        'uw_image_url'=>$user_info['headimgurl'],
                        'uw_sex'=>$user_info['sex'],
                        'uw_app_id'=>$wx_config['app_id'],
                        'uw_open_id'=>$user_info['openid'],
                    ];
                    $main_domain = config('common.main_domain');
                    /*执行用户注册等业务start*/

                    /*执行用户注册等业务end*/
                    cookie('nickname',trim($user_wx['uw_nick_name']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('open_id',trim($user_wx['uw_open_id']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('sex',trim($user_wx['uw_sex']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('headimgurl',trim($user_wx['uw_image_url']),['expire'=>'3600','domain'=>$main_domain]);
                    echo "<script>";
                    echo "window.location.href='{$state[0]}'" ;
                    echo "</script>";
                }

            }else{
                config('default_return_type','html');
                return '<h1>login_callback.....</h1>';
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }
    }



    /**
     * 公众号接口推送消息接口
     */
    public function handle_msg(){
        try{
            vendor('waters.webchatapi.index');
            if (Request::instance()->isGet()){
                $api = new WeixinApi(config('wx_config'),new InterfaceWxApiForTP5());
                $api -> valid();
            }else{
                $handler = new WxMsgHandler(new InterfaceMsg());
                $handler -> handle();
            }

        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            exit('');
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx_login/');
            exit('');
        }
    }


    /**
     * 微信分享
     */
    public function share(){
        try{
            $params = extract_data_by_keys(input('param.'),['callback']);
            check_params($params,['callback'],2);
            vendor('waters.webchatapi.index');
            $api = new WeixinApi(config('wx_config'),new InterfaceWxApiForTP5());
            $rs = $api->share_url(urldecode($params['callback']));
            if (!$rs) throw_my_exception('获取不到数据',null,self::CODE_BUSINESS_ERROR);
            $this->success($rs);
        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 通过天高代理进行微信授权
     * @return string
     */
    public function login_proxy(){
        try{
            $params = input('param.');
            $wx_config = config('wx_config');
            if (isset($params['callback']) && isset($params['type']) && $params['callback'] && $params['type'] && isset($wx_config['app_id']) && $wx_config['app_id']){
                $state = urlencode("{$params['callback']}__{$params['type']}");
                $handle_code_url = url('entry/Wx/login_callback_proxy','',false,true);
                $redirect_url = "http://qr.tigowx.com/get-weixin-code.html?appid={$wx_config['app_id']}&scope=snsapi_userinfo&state={$state}&redirect_uri={$handle_code_url}";
                header("Location: $redirect_url");
            }else{
                config('default_return_type','html');
                return '<h1>login_proxy.....</h1>';
            }

        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }
    }


    /**
     * 天高代理微信授权code回调
     */
    public function login_callback_proxy(){
        try{
            /*校验数据*/
            $params = input('param.');
            if (isset($params['code']) && isset($params['state']) && $params['code'] && $params['state']){
                $wx_config = config('wx_config');
                check_params($wx_config,['app_id','app_secret']);
                vendor('waters.webchatapi.index');
                $interface = new InterfaceWxApiForTP5();
                $api = new WeixinApi($wx_config,$interface);
                /*校验数据*/
                $state = explode("__",urldecode($params['state']));
                /*获取用户信息*/
                $user_info = $api -> get_user_info($params['code']);
                if ($user_info){
                    $user_wx = [
                        'uw_nick_name'=>filter_emoji($user_info['nickname']),
                        'uw_image_url'=>$user_info['headimgurl'],
                        'uw_sex'=>$user_info['sex'],
                        'uw_app_id'=>$wx_config['app_id'],
                        'uw_open_id'=>$user_info['openid'],
                    ];
                    if (isset($user_info['unionid']))$user_wx['uw_union_id'] = $user_info['unionid'];
                    $main_domain = config('common.main_domain');
                    /*执行用户注册等业务start*/

                    /*执行用户注册等业务end*/
                    cookie('nickname',trim($user_wx['uw_nick_name']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('open_id',trim($user_wx['uw_open_id']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('sex',trim($user_wx['uw_sex']),['expire'=>'3600','domain'=>$main_domain]);
                    cookie('headimgurl',trim($user_wx['uw_image_url']),['expire'=>'3600','domain'=>$main_domain]);
                    echo "<script>";
                    echo "window.location.href='{$state[0]}'" ;
                    echo "</script>";
                }

            }else{
                config('default_return_type','html');
                return '<h1>login_callback_proxy.....</h1>';
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx_login/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }
    }


}