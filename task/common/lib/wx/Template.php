<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/21
 * Time: 11:39
 */
namespace task\common\lib\wx;

use Waters\WebChatApi\Api\WeiXinTemplate;
use Waters\WebChatApi\Business\InterfaceWeiXinApi;

class Template extends WeiXinTemplate
{

    public function __construct(array $option, InterfaceWeiXinApi $interface = null)
    {
        parent::__construct($option, $interface);
        $this->template_id = isset($option['template_id']) ? $option['template_id'] : '';
    }


    function setData($data)
    {

    }
}