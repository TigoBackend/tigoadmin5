<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/24
 * Time: 10:28
 */

namespace app\entry\controller;
use app\common\lib\exception\MyException;
use app\common\lib\wx\InterfaceMsg;
use app\common\lib\wx\InterfaceWxApi;
use app\common\lib\wx\MsgTemplate;
use Qiniu\Auth;
use Qiniu\Processing\ImageUrlBuilder;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;
use think\RedisCache;
use think\Request;
use Waters\WeiXin\Api\WeiXinApi;
use Waters\WeiXin\Exception\WeiXinException;
use Waters\WeiXin\Msg\WxMsgHandler;


/**
 * 实例代码控制器（参考代码用）
 * Class SampleController
 * @package app\entry\controller
 */
class SampleController extends EntryBaseController
{

    /*-----------------------------------七牛start-----------------------------------*/

    /**
     * 查询文件信息
     */
    public function file_status(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->stat($config['bucket'],'key');
            if ($err !== null){
                dump($err);
                exit;
            }
            $this->success($result);

        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 上传文件示例
     * @throws \Exception
     */
    public function upload(){
        try{
            vendor('qiniu.autoload');
            $file = UPLOAD_PATH."default.jpg";
            if (!is_file($file))throw_my_exception('文件不存在');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            /*校验图片是否已存在七牛以免重复上传浪费带宽*/
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->stat($config['bucket'],'key');
            if ($err === null) throw_my_exception('文件已存在,不需要重复上传');
            unset($err);
            unset($result);
            /*七牛上没有资源则上传资源*/
            $token = $auth->uploadToken($config['bucket'],null,3600);
            $upload_mgr = new UploadManager();
            list($result,$err) = $upload_mgr->putFile($token,'key',$file);
            if ($err !== null) throw_my_exception('upload_qn_img upload err:'.$err->message());
            $this->success($config['domain']."key?v=".time());
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }

    /**
     * 清除七牛云指定文件
     */
    public function drop(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->delete($config['bucket'],'key');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }

        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 将文件从文件$key2 移动到文件$key3。 可以在不同bucket移动
     */
    public function file_move(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->move('bucket_from','key_from','bucket_to','key_to');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }



    /**
     * 将文件从文件$key 复制到文件$key2。 可以在不同bucket复制
     */
    public function file_copy(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->copy('bucket_from','key_from','bucket_to','key_to');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }



    /**
     * 抓取网络资源到存储空间
     */
    public function file_fetch(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->fetch('url',$config['bucket'],'key');
            if ($err !== null){
                dump($err);
            }else{
                dump($result);
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }

    /**
     * 为存储空间中的图片生成缩略图链接
     */
    public function thumbnail(){
        try{
            $params = extract_data_by_keys(input('param.'),['url']);
            check_params($params,['url'],2);
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $thumb_url = $img_builder->thumbnail('url',1,100,100);
            $this->success($thumb_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 为存储空间中的图片生成带图片水印图片链接
     */
    public function water_img(){
        try{
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $water_url = $img_builder->waterImg('url','water_url');
            $this->success($water_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 为存储空间中的图片生成带文字水印图片链接
     */
    public function water_text(){
        try{
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $water_url = $img_builder->waterText('url','text','微软雅黑',500,'#FF0000');
            $this->success($water_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }

    /*-----------------------------------七牛end-----------------------------------*/
    /*-----------------------------------redis start-----------------------------------*/


    public function redis_check(){
        try{
            RedisCache::connect()->set('key','ok',60);

        }catch (MyException $e){
            handle_exception($e,'public/log/redis/');
            $this->error($e->getMessage());
        }catch (\RedisException $e){
            handle_exception($e,'public/log/redis/');
            $this->error($e->getMessage());
        }
    }


    /*-----------------------------------redis end-----------------------------------*/


    /*-----------------------------------aliyu start-----------------------------------*/
    /**
     * 阿里大于旧版本短信示例
     * @throws \Exception
     */
    public function old_version(){
        try{
            $tel = input('param.tel');
            vendor('ALiYu.TopSdk');
            $option = [
                'app_key'=>config('sms_config.app_key'),                /*大于app_key*/
                'app_secret'=>config('sms_config.app_secret'),          /*大于app_secret*/
                'free_sign_name'=>config('sms_config.free_sign_name'),  /*大于短信签名*/
                'sms_param'=>[],            /*模板变量*/
                'template'=>'',             /*模板id*/
                'phone'=>$tel,
            ];
            $sms_sender = new \SMSSender($option);
            $rs = $sms_sender->execute();
            $err_code = (string)$rs->result->err_code;
            if ($err_code !== "0") {
                add_log("短信发送异常sub_code:".$rs->sub_code." sub_msg:".$rs->sub_msg,'public/log/sms/');
                throw_my_exception('系统繁忙请稍后再试',null,self::CODE_BUSINESS_ERROR);
            }
            $this->success('success');
        }catch (MyException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }


    /**
     * 阿里大于新版本短信示例
     */
    public function new_version(){
        try{
            $tel = input('param.tel');
            vendor('ALiYunSMS20170525.index');
            $sms_sender = new \SMSSender(config('sms_config.access_key_id'),config('sms_config.access_key_secret'));
            $rs = $sms_sender->sendSms(config('sms_config.sign_name'),'填入模板id',$tel,['code'=>'模板变量']);
            if (isset($rs->Code) && $rs->Code === 'OK'){
                /*发送成功执行发送后的逻辑*/

                $this->success('success');
            }else{
                add_log("短信发送失败,tel:{$tel},Code:{$rs->Code},Message:{$rs->Message},RequestId:{$rs->RequestId},BizId:{$rs->BizId}");
                throw_my_exception('短信业务繁忙,请稍后再试',null,self::CODE_BUSINESS_ERROR);
            }
        }catch (MyException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }
    /*-----------------------------------aliyu end-----------------------------------*/


    /*-----------------------------------WorkerMan start-----------------------------------*/

    /**
     * 向worker man的web socket服务推送消息
     */
    public function push_to_front(){
        try{
            $client = stream_socket_client('tcp://127.0.0.1:5678',$errno,$errmsg,1);
            $data = ['uid'=>'1','percent'=>'99%'];
            fwrite($client,json_encode($data)."\n");

            $this->success(fread($client,8192));
        }catch (\Exception $e){
            $this->error($e->getMessage());
        }
    }


    /*-----------------------------------WorkerMan end-----------------------------------*/


    /*-----------------------------------微信 start-----------------------------------*/

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
                $interface = new InterfaceWxApi($wx_config['app_id']);

                $api = new WeiXinApi($wx_config,$interface);
                $redirect_url = url('index/Wx/login_callback','',false,true);
                $state = "{$params['callback']}__{$params['type']}";
                $api->get_code($redirect_url,urlencode($state),null,WeiXinApi::PROCESS_REDIRECT);
            }else{
                config('default_return_type','html');
                return '<h1>login.....</h1>';
            }

        }catch (MyException $e){
            handle_exception($e,'public/log/wx/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx/');
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
                $interface = new InterfaceWxApi($wx_config['app_id']);
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
            handle_exception($e,'public/log/wx/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx/');
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
                $wx_config = config('wx_config');
                $interface = new InterfaceWxApi($wx_config['app_id']);
                $api = new WeixinApi($wx_config,$interface);
                $api -> valid();
            }else{
                $business = new InterfaceMsg();
                $handler = new WxMsgHandler($business);
                $handler -> handle();
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/wx/');
            exit('');
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx/');
            exit('');
        }
    }


    /**
     * 微信分享
     * @throws \Exception
     */
    public function share(){
        try{
            $params = extract_data_by_keys(input('param.'),['callback']);
            check_params($params,['callback']);
            vendor('waters.webchatapi.index');
            $wx_config = config('wx_config');
            $interface = new InterfaceWxApi($wx_config['app_id']);
            $api = new WeixinApi($wx_config,$interface);
            $rs = $api->share_url(urldecode($params['callback']));
            if (!$rs) throw_my_exception('获取不到数据',null,self::CODE_BUSINESS_ERROR);
            $this->success($rs);
        }catch (MyException $e){
            handle_exception($e,'public/log/wx/');
            $this->error($e->getMessage());
        }catch (WeiXinException $e){
            handle_exception($e,'public/log/wx/');
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
            handle_exception($e,'public/log/wx/');
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
                $interface = new InterfaceWxApi($wx_config['app_id']);
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
            handle_exception($e,'public/log/wx/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }catch (\Exception $e){
            handle_exception($e,'public/log/wx/');
            echo "<script>";
            echo "window.location.href='".url('entry/Index','',false,true)."'" ;
            echo "</script>";
        }
    }


    /**
     * 单模板消息发送
     */
    public function template_send(){
        try{
            $wx_config = config('wx_config');
            $template_config = [
                'wx_config'=>$wx_config,
                'open_id'=>'用户openid',
                'url'=>'模板消息点击跳转链接',
                'data'=>[
                    'first'=>['value'=>''],
                    'keyword1'=>['value'=>''],
                    'keyword2'=>['value'=>''],
                    'remark'=>['value'=>''],
                ],
            ];
            $interface = new InterfaceWxApi($wx_config['app_id']);
            $template = new MsgTemplate($template_config,$interface);
            $template->set_template_id('模板id');
            $template->sendTemplateMsg();
            $this->success('success');
        }catch (WeiXinException $e){
            handle_exception($e,'public/log/wx/');
            $this->error($e->getMessage());
        }
    }

    /**
     * 同一模板消息批量发送给指定用户列表
     * 适用于固定内容的模板消息批量发送给多个用户
     */
//    public function template_multi_send(){
//        try{
//            $wx_config = config('wx_config');
//            $template_option = [
//                'wx_config'=>$wx_config,
//                'open_id'=>['openid1','openid2','openid3','openid4','openid5','openid6'],
//                'template_id'=>'模板id',
//                'url'=>'模板消息点击跳转链接',
//                'data'=>[
//                    'first'=>['value'=>''],
//                    'keyword1'=>['value'=>''],
//                    'keyword2'=>['value'=>''],
//                    'remark'=>['value'=>''],
//                ],
//            ];
//            $interface = new InterfaceWxApi($wx_config['app_id']);
//            $template = new MsgTemplate($template_option,$interface);
//            $template->multiSendTemplateMsg();
//            $this->success('success');
//        }catch (WeiXinException $e){
//            handle_exception($e,'public/log/wx/');
//            $this->error($e->getMessage());
//        }
//    }


    /**
     * 批量发送多个模板消息
     * 适用于多个（相同或不同）模板消息的批量发送
     */
//    public function multi_template_send(){
//        try{
//            $openid_list = ['openid1','openid2','openid3','openid4','openid5','openid6'];
//            $wx_config = config('wx_config');
//            $template_option_list = [];
//            foreach ($openid_list as $openid){
//                $template_option_list[] = [
//                    'wx_config'=>$wx_config,
//                    'open_id'=>$openid,
//                    'template_id'=>'模板id',
//                    'url'=>'模板消息点击跳转链接',
//                    'data'=>[
//                        'first'=>['value'=>''],
//                        'keyword1'=>['value'=>''],
//                        'keyword2'=>['value'=>''],
//                        'remark'=>['value'=>''],
//                    ],
//                ];
//            }
//            $template_list = [];
//            $interface = new InterfaceWxApi($wx_config['app_id']);
//            foreach ($template_option_list as $option){
//                $template_list[] = new MsgTemplate($option);
//            }
//            $api = new WeiXinMsgTemplateApi($wx_config,$interface);
//            $api->multiSendWeiXinTemplate($template_list);
//
//        }catch (WeiXinException $e){
//            handle_exception($e,'public/log/wx/');
//            $this->error($e->getMessage());
//        }
//    }




    /*-----------------------------------微信 end-----------------------------------*/













}