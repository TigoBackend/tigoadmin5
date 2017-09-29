<?php

/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/5/9
 * Time: 10:58
 */
class SMSSender
{
    private $client;
    private $smsNumSendRequest;
    private $params;
    private $phoneNums;
    private $templateCode;


    public function __construct($option)
    {
        $this->check_params($option,['app_key','app_secret','free_sign_name']);
        $this->client = new \TopClient();
        $this->client->appkey = $option['app_key'];
        $this->client->secretKey = $option['app_secret'];
        $this->smsNumSendRequest = new \AlibabaAliqinFcSmsNumSendRequest();
        $this->smsNumSendRequest->setSmsType("normal");
        $this->smsNumSendRequest->setSmsFreeSignName($option['free_sign_name']);
        /*初始化模板变量*/
        if (isset($option['sms_param'])){
            /*$this->check_params($option['sms_param'],['code','product']);
            $this->params = "{\"code\":\"".$option['sms_param']['code']."\",\"product\":\"".$option['sms_param']['product']."\"}";*/
            $this->params = $option['sms_param'];
            $this -> smsNumSendRequest ->setSmsParam($this->params);
        }
        /*初始化手机号*/
        if (isset($option['phone'])){
            $this->check_params($option['phone']);
            $this->phoneNums = $option['phone'];
            $this -> smsNumSendRequest -> setRecNum($this->phoneNums);
        }
        /*初始化模板id*/
        if (isset($option['template'])){
            $this->check_params($option['template']);
            $this->templateCode = $option['template'];
            $this -> smsNumSendRequest -> setSmsTemplateCode($this->templateCode);
        }
    }


    /**
     * 设置短信内容变量支持array("code"=>"内容","product"=>"内容")变量
     * @param $params
     */
    public function setSmsParam($params){
        $this->check_params($params,['code','product']);
        $this->params = "{\"code\":\"".$params['code']."\",\"product\":\"".$params['product']."\"}";
        $this -> smsNumSendRequest ->setSmsParam($this->params);
    }


    /**
     * 设置需要发送的手机号码,多电话使用','分隔开
     * @param $phoneNums
     */
    public function setRecNum($phoneNums){
        $this->check_params($phoneNums);
        $this->phoneNums = $phoneNums;
        $this -> smsNumSendRequest -> setRecNum($this->phoneNums);
    }


    /**
     * 设置短信模板
     * @param $code
     */
    public function setSmsTemplateCode($code){
        $this->check_params($code);
        $this->templateCode = $code;
        $this -> smsNumSendRequest -> setSmsTemplateCode($this->templateCode);
    }



    /**
     *根据请求类型
     */
    public function execute(){
        if(empty($this->templateCode) || empty($this->params) || empty($this->phoneNums)) throw new Exception('missing argument');
        return $this->client->execute($this->smsNumSendRequest);
    }




    private function check_params($params,$keys = null,$handle_type="THROW"){
        $result = true;
        if(empty($params)){
            $result = false;
        } else if(!empty($keys) && is_array($keys)){
            foreach ($keys as $key){
                if(empty($params[$key])){
                    $result = false;
                    break;
                }
            }
        }else if(!empty($keys)){
            if(empty($params[$keys])) $result = false;
        }
        /*根据处理方法执行操作*/
        if(empty($result)){
            switch ($handle_type){
                case "RETURN":
                    return $result;
                case "THROW":
                default:
                    throw new Exception('missing argument');
            }
        }else{
            return true;
        }
    }

}