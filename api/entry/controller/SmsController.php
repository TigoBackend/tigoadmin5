<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/9/28
 * Time: 23:02
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use api\common\lib\exception\MyException;

class SmsController extends BaseController
{


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




}