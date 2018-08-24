<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 19:50
 */

namespace Waters\hx\business;


interface HxListener
{

    /**
     * 获取缓存中的token
     * @return string
     */
    public function get_cache_token();


    /**
     * 缓存token
     * @param array $result 缓存信息，格式为['access_token'=>'sdfwerwer','expires_in'=>12312312,'application'=>'aa667ab0-2d70-11e8-aa99']
     * @return bool
     */
    public function cache_token($result);


    /**
     * 记录日志
     * @param $msg
     * @return mixed
     */
    public function error_log($msg);


}