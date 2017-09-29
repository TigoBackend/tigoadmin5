<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/9/15
 * Time: 0:34
 */

//require_once "../vendor/autoload.php";
require_once "../vendor/autoload.php";


$api = new \Waters\WebChatApi\Api\WeiXinApi(['app_id'=>'1','app_secret'=>'2']);

$access_token = $api->get_access_token();
echo $access_token;