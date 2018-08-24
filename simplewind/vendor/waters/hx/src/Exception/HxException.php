<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 16:42
 */

namespace Waters\hx\Exception;


class HxException extends \Exception
{


    public $msg;

    public function __construct($message = "", $code = 0, \Exception $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }


    /**
     * 获取异常信息
     * @return string
     */
    final public function getMyMessage()
    {
        if ($this->msg) return $this->msg;
        $msg = "\n" . "check in:" . date('Y-m-d H:i:s', time()) . "\n";
        $msg .= "MSG:" . $this->getMessage() . "\n";
        $msg .= "FILE:" . $this->getFile() . "\n";
        $msg .= "LINE:" . $this->getLine() . "\n";
        $msg .= "Trace:\n" . $this->getTraceAsString() . "\n";
        $this->msg = $msg;
        return $this->msg;
    }

}