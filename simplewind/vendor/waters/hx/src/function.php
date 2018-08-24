<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 11:55
 */


/**
 * 检查数组中指定key是否为空
 * @param $params
 * @param null $keys
 * @return bool
 * @throws \Waters\hx\Exception\HxException
 */
function hx_check_params($params,$keys = null){
    $result = true;
    $msg = "";
    if(empty($params)){
        $result = false;
        if (is_array($keys)){
            foreach ($keys as $key){
                $msg .= "{$key} ";
            }
            $msg .= "不能为空";
        }else{
            $msg = "{$keys}不能为空";
        }
    } else if(!empty($keys) && is_array($keys)){
        foreach ($keys as $key){
            if(!isset($params[$key]) || empty($params[$key])){
                $result = false;
                $msg = "{$key}必须传入";
                break;
            }
        }
    }else if(!empty($keys)){
        if(!isset($params[$keys]) || empty($params[$keys])) {
            $result = false;
            $msg = "{$keys}必须传入";
        }
    }
    /*根据处理方法执行操作*/
    if(empty($result)) throw new \Waters\hx\Exception\HxException($msg);
    return true;
}

