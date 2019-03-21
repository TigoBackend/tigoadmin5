<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/29
 * Time: 9:11
 */
namespace Waters\WeiXin\Exception;

class WeiXinException extends \Exception
{

    public $msg;
    public $context = [];

    public function __construct($message = "", $context = [], $code = 0, \Exception $previous = null)
    {

        parent::__construct($message, $code, $previous);
        $this -> context = $context;
        $this -> msg = $message;

        //写入到Expcetion父类的字段中
        if(!empty($message)){
            $this->message = $message;
        }

    }


    /**
     * 获取异常信息
     * @return string
     */
    final public function getMyMessage()
    {
        $msg = "\n" . "check in:" . date('Y-m-d H:i:s', time()) . "\n";
        $msg .= "MSG:" . $this->getMessage() . "\n";
        $msg .= "FILE:" . $this->getFile() . "\n";
        $msg .= "LINE:" . $this->getLine() . "\n";
        $msg .= "Trace:\n" . $this->getTraceAsString() . "\n";
        $this->msg = $msg;
        return $this->msg;
    }


    final public function getContext(){
        return $this->context;
    }
}