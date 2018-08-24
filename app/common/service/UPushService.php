<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/4/11
 * Time: 16:21
 */

namespace app\common\service;

/**
 * 友盟推送服务类
 * Class UPushService
 * @package app\common\service
 */
class UPushService
{
    private $domain = 'https://msgapi.umeng.com/api/';
    private $app_key = '';
    private $app_master_secret = '';
    private $umeng_message_secret = '';
    private $production_mode = false;       /*正式/测试模式。只有在ios推送中有用*/

    const METHOD_GET = "GET";
    const METHOD_POST = "POST";
    const METHOD_PUT = "PUT";
    const METHOD_DELETE = "DELETE";


    const API_PUSH_SEND = "send";


    /*推送方式*/
    const CAST_TYPE_UNI_CAST = 'unicast';                   /*单播*/
    const CAST_TYPE_LIST_CAST = 'listcast';                 /*列播*/
    const CAST_TYPE_BROAD_CAST = 'broadcast';               /*广播*/
    const CAST_TYPE_GROUP_CAST = 'groupcast';               /*组播*/
    const CAST_TYPE_FILE_CAST = 'filecast';                 /*文件播*/
    const CAST_TYPE_CUSTOMIZED_CAST = 'customizedcast';     /*自定义播*/

    /*通知类型*/
    const DISPLAY_TYPE_NOTIFICATION = 'notification';       /*通知*/
    const DISPLAY_TYPE_MESSAGE = 'message';                 /*消息*/


    /*点击通知的后续行为*/
    const AFTER_OPEN_GO_APP = 'go_app';
    const AFTER_OPEN_GO_URL = 'go_url';
    const AFTER_OPEN_GO_ACTIVITY = 'go_activity';
    const AFTER_OPEN_GO_CUSTOM = 'go_custom';



    private $can_go = false;



    /**
     * 构造函数
     * UPushService constructor.
     * @param $config
     * @throws \Exception
     */
    public function __construct($config)
    {
        $this->app_key = isset($config['app_key']) ? $config['app_key'] : '';
        $this->app_master_secret = isset($config['app_master_secret']) ? $config['app_master_secret'] : '';
        /*设置ios生成模式*/
        $this->production_mode = isset($config['production_mode']) && $config['production_mode'] ? true : false;
        if ($this->app_key && $this->app_master_secret) $this->can_go = true;
    }


    /**
     * 生成友盟签名
     * @param array|string $post_body
     * @param $api
     * @param string $method
     * @return string
     * @throws \app\common\lib\exception\MyException
     */
    private function sign($post_body, $api, $method = '')
    {
        $post_body = is_array($post_body) ? json_encode($post_body) : $post_body;
        switch ($api){
            case self::API_PUSH_SEND:
                $url = $this->domain.self::API_PUSH_SEND;
                break;
            default:
                throw_my_exception('未知接口类型');
                return null;
        }
        $method = empty($method) ? self::METHOD_POST : $method;
        return md5("{$method}{$url}{$post_body}{$this->app_master_secret}");
    }


    /**
     * 执行请求
     * @param $url
     * @param $post_body
     * @param $header
     * @param $method
     * @return array
     */
    private function curl($url,$post_body,$header,$method){
        $ch = curl_init($url);
        $curl_options = [
            CURLOPT_HEADER => false,
            CURLOPT_TIMEOUT => 5,
            CURLOPT_CONNECTTIMEOUT => 5,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS => in_array($method,[self::METHOD_GET,self::METHOD_POST,self::METHOD_PUT,self::METHOD_DELETE]) && is_array($post_body) && $post_body ? json_encode($post_body) : $post_body,
            CURLOPT_HTTPHEADER => $header,
            CURLOPT_MAXREDIRS => 3,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => 0,
        ];
        /*根据当前php配置追加页面跟踪配置*/
        if (ini_get('open_basedir') == '' && ini_get('safe_mode') == 'off'){
            $curl_options[CURLOPT_FOLLOWLOCATION] = true;
        }

        switch (strtoupper($method)){
            case self::METHOD_POST:
                $curl_options[CURLOPT_POST] = true;
                break;
        }
        curl_setopt_array($ch,$curl_options);

        $result = curl_exec($ch);
        $errno = curl_errno($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);
        if ($errno) return ['status'=>false,'result'=>[],'error_info'=>$info];
        $result = json_decode($result,true);
        switch (strtoupper($result['ret'])){
            case 'SUCCESS':
                return ['status'=>true,'result'=>$result['data'],'error_info'=>[]];
                break;
            case 'FAIL':
                return ['status'=>false,'result'=>[],'error_info'=>$result['data']];
                break;
            default:
                return ['status'=>false,'result'=>[],'error_info'=>['err_msg'=>'未知结果']];
        }
    }


    /**
     * 安卓单播通知
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function android_uni_cast_notification($option){
        if (!$this->can_go || check_params($option,['dev_token','ticker','title','text'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'display_type'=>self::DISPLAY_TYPE_NOTIFICATION,
            'body'=>[
                'ticker'=>$option['ticker'],
                'title'=>$option['title'],
                'text'=>$option['text'],
                'custom'=>isset($option['custom']) && $option['custom'] ? $option['custom'] : ''
            ]
        ];
        if (isset($option['extra']) && $option['extra']) $payload['extra'] = ['catch_order'=>$this->parse_array_to_string($option['extra'])];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_UNI_CAST,
            'device_tokens'=>$option['dev_token'],
            'description'=>$option['title'],
            'payload'=>$payload
        ];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }


    /**
     * 安卓列播播通知
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function android_list_cast_notification($option){
        if (!$this->can_go || check_params($option,['dev_token','ticker','title','text'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'display_type'=>self::DISPLAY_TYPE_NOTIFICATION,
            'body'=>[
                'ticker'=>$option['ticker'],
                'title'=>$option['title'],
                'text'=>$option['text'],
                'custom'=>isset($option['custom']) && $option['custom'] ? $option['custom'] : ''
            ]
        ];
        if (isset($option['extra']) && $option['extra']) $payload['extra'] = ['catch_order'=>$this->parse_array_to_string($option['extra'])];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_LIST_CAST,
            'device_tokens'=>$option['dev_token'],
            'description'=>$option['title'],
            'payload'=>$payload
        ];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }


    /**
     * ios单播通知
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function ios_uni_cast_notification($option){
        if (!$this->can_go || check_params($option,['dev_token','ticker','title','text'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'aps'=>[
                'alert'=>[
                    'title'=>$option['ticker'],
                    'subtitle'=>$option['title'],
                    'body'=>$option['text']
                ],
                'sound'=>'default'
            ]
        ];
        if (isset($option['extra']) && $option['extra']) $payload['extra'] = ['catch_order'=>$this->parse_array_to_string($option['extra'])];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_UNI_CAST,
            'device_tokens'=>$option['dev_token'],
            'description'=>$option['title'],
            'payload'=>$payload,
            'production_mode'=>$this->production_mode
        ];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }


    /**
     * ios列播通知
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function ios_list_cast_notification($option){
        if (!$this->can_go || check_params($option,['dev_token','ticker','title','text'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'aps'=>[
                'alert'=>[
                    'title'=>$option['ticker'],
                    'subtitle'=>$option['title'],
                    'body'=>$option['text']
                ],
                'sound'=>'default'
            ]
        ];
        if (isset($option['extra']) && $option['extra']) $payload['extra'] = ['catch_order'=>$this->parse_array_to_string($option['extra'])];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_LIST_CAST,
            'device_tokens'=>$option['dev_token'],
            'description'=>$option['title'],
            'payload'=>$payload,
            'production_mode'=>$this->production_mode
        ];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }


    /**
     * 安卓单播消息
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function android_uni_cast_message($option){
        if (!$this->can_go || check_params($option,['dev_token','custom'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'display_type'=>self::DISPLAY_TYPE_MESSAGE,
            'body'=>[
                'custom'=>$option['custom']
            ]
        ];
        if (isset($option['ticker']) && $option['ticker']) $payload['body']['ticker'] = $option['ticker'];
        if (isset($option['title']) && $option['title']) $payload['body']['title'] = $option['title'];
        if (isset($option['text']) && $option['text']) $payload['body']['text'] = $option['text'];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_UNI_CAST,
            'device_tokens'=>$option['dev_token'],
            'payload'=>$payload
        ];
        if (isset($option['title']) && $option['title']) $post_body['description'] = $option['title'];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }


    /**
     * 安卓列播消息
     * @param $option
     * @return array|bool
     * @throws \app\common\lib\exception\MyException
     * @throws \Exception
     */
    public function android_list_cast_message($option){
        if (!$this->can_go  || check_params($option,['dev_token','custom'],2,CHECK_REQUEST_METHOD_RETURN) !== true) return false;
        $payload = [
            'display_type'=>self::DISPLAY_TYPE_MESSAGE,
            'body'=>[
                'custom'=>$option['custom']
            ]
        ];
        if (isset($option['ticker']) && $option['ticker']) $payload['body']['ticker'] = $option['ticker'];
        if (isset($option['title']) && $option['title']) $payload['body']['title'] = $option['title'];
        if (isset($option['text']) && $option['text']) $payload['body']['text'] = $option['text'];
        $post_body = [
            'appkey'=>$this->app_key,
            'timestamp'=>time(),
            'type'=>self::CAST_TYPE_LIST_CAST,
            'device_tokens'=>$option['dev_token'],
            'payload'=>$payload
        ];
        if (isset($option['title']) && $option['title']) $post_body['description'] = $option['title'];
        $sign = $this->sign($post_body,self::API_PUSH_SEND,self::METHOD_POST);
        $url = $this->domain.self::API_PUSH_SEND."?sign={$sign}";
        $header = [
            'Content-Type:application/json'
        ];
        return $this->curl($url,$post_body,$header,self::METHOD_POST);
    }



    private function parse_array_to_string($value){
        return is_array($value) ? json_encode($value,JSON_UNESCAPED_UNICODE) : (is_string($value) ? $value : '');
    }


}