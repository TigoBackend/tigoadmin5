<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2015/12/29
 * Time: 9:11
 */

namespace app\common\lib\exception;





use think\Request;

class MyException extends \Exception
{
    const EXCEPTION_LEVEL_LOG = 1;
    const EXCEPTION_LEVEL_ROLLBACK = 2;
    const EXCEPTION_LEVEL_NORMAL = 0;

    public $msg;
    public $level;

    public function __construct($message = "", $level = 0 , $code = 0, \Exception $previous = null)
    {
        parent::__construct($message, $code, $previous);
        $this -> level = $level;
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
        $msg .= "ExceptionSource: 模块 >>" . Request::instance()->module() . "\n";
        $msg .= "MSG:" . $this->getMessage() . "\n";
        $msg .= "FILE:" . $this->getFile() . "\n";
        $msg .= "LINE:" . $this->getLine() . "\n";
        $msg .= "Trace:\n" . $this->getTraceAsString() . "\n";
        $this->msg = $msg;
        return $this->msg;
    }


    final public function getLevel(){
        return $this -> level;
    }

}