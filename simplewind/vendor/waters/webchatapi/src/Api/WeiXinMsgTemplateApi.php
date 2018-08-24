<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/2/6
 * Time: 17:27
 */
namespace Waters\WebChatApi\Api;


use Waters\WebChatApi\Business\InterfaceWeiXinApi;

class WeiXinMsgTemplateApi extends WeiXinApi
{

    /*微信模板消息发送API接口*/
    const API_TEMPLATE_SEND_URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=";

    /**
     * 消息模板api构造函数
     * WeixinMsgTemplateApi constructor.
     * @param array $wx_config
     * @param InterfaceWeiXinApi $interface
     */
    public function __construct(array $wx_config,InterfaceWeiXinApi $interface = null)
    {
        parent::__construct($wx_config, $interface);
    }


    /**
     * 推送模板信息
     * @param WeixinTemplate $template  要推送的模板
     * @return bool|array  推送失败返回false，否则返回推送结果
     */
    public function sendTemplateMsg(WeiXinTemplate $template){
        if ($template instanceof WeiXinTemplate){
            $access_token = $this->get_access_token();
            if (!$access_token) {
                /*执行业务接口的推送日志记录*/
                if ($this->business_interface) $this->business_interface->log('access_token empty');
                return false;
            }
            $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=$access_token";
            $params = $template -> get_params();
            $result = $this->curl($url,json_encode($params));
            if ($result['errcode']){
                /*执行业务接口的推送日志记录*/
                if ($this->business_interface) $this->business_interface->log('sendTemplateMsg: result:'.json_encode($result));
                /*如果access_token已经过期强制刷新缓存access_token并从新发送一次(此处恐怕会有死循环如果has_retry不起作用的话)*/
                static $has_retry = false;
                if ($result['errcode'] == 40001 && $has_retry === false){
                    $this->refreshAccessToken();
                    $this->sendTemplateMsg($template);
                    $has_retry = true;
                }
                return false;
            }
            return $result;
        }else{
            return false;
        }
    }



    /**
     * 同一消息模板批量发送给多个微信用户
     * @param WeiXinTemplate $template
     * @return bool
     */
    public function multiSendTemplateMsg(WeiXinTemplate $template){
        if (!$template instanceof WeiXinTemplate) return false;
        $access_token = $this->get_access_token();
//        dump($access_token);
        if (!$access_token){
            /*执行业务接口的推送日志记录*/
            if ($this->business_interface) $this->business_interface->log('mutiSendTemplateMsg access_token empty');
            return false;
        }
        $sock_type = 'ssl://';
        $host = "api.weixin.qq.com";
        $port = 443;
        $openid_list = $template->get_touser_list();
        foreach ($openid_list as $openid){
            $params = $template->get_params();
            $data = [
                'touser'=>$openid,
                'template_id'=>$params['template_id'],
                'url'=>$params['url'],
                'data'=>$params['data'],
            ];
            $params = json_encode($data,JSON_UNESCAPED_UNICODE);
            $fp = fsockopen($sock_type.$host,$port,$err_no,$err_string);
            if (!$fp) {
                if ($this->business_interface) $this->business_interface->log("mutiSendTemplateMsg connect error_no:{$err_no} error_msg:{$err_string}");
                return false;
            }
            $out = "POST /cgi-bin/message/template/send?access_token={$access_token} HTTP/1.1\r\n";
            $out .= "Host: {$host}\r\n";
            $out .= "Content-type: application/x-www-form-urlencoded\r\n";
            $out .= "Content-Length: " . strlen($params) . "\r\n";
            $out .= "Connection:close\r\n\r\n$params\r\n\r\n";
            fputs($fp,$out);
//            if (!feof($fp)){
//                dump(fread($fp,1024));
//            }
//            fclose($fp);
            unset($fp);
            unset($out);
        }
        return true;
    }



    /**
     * 批量发送模板消息列表中的模板消息
     * @param array $weiXinTemplate
     * @return bool
     */
    public function multiSendWeiXinTemplate($template_list = []){
        $access_token = $this->get_access_token();
        if (!$access_token){
            /*执行业务接口的推送日志记录*/
            if ($this->business_interface) $this->business_interface->log('mutiSendWeiXinTemplate access_token empty');
            return false;
        }
        $sock_type = 'ssl://';
        $host = "api.weixin.qq.com";
        $port = 443;
        foreach ($template_list as $template){
            if (!$template instanceof WeiXinTemplate) continue;
            $params = json_encode($template->get_params(),JSON_UNESCAPED_UNICODE);
            $fp = fsockopen($sock_type.$host,$port,$err_no,$err_str);
//            dump($fp);
            if (!$fp){
                if ($this->business_interface) $this->business_interface->log("mutiSendWeiXinTemplate connect error_no:{$err_no} error_msg:{$err_str}");
                return false;
            }
            $out = "POST /cgi-bin/message/template/send?access_token={$access_token} HTTP/1.1\r\n";
            $out .= "Host: {$host}\r\n";
            $out .= "Content-type: application/x-www-form-urlencoded\r\n";
            $out .= "Content-Length: " . strlen($params) . "\r\n";
            $out .= "Connection:close\r\n\r\n$params\r\n\r\n";
            fputs($fp,$out);
//            if (!feof($fp)){
//                dump(fread($fp,1024));
//            }
            fclose($fp);
            unset($fp);
            unset($out);
        }
        return true;
    }



}