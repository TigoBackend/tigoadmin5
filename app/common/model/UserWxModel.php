<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/5
 * Time: 18:12
 */

namespace app\common\model;


use traits\model\SoftDelete;

class UserWxModel extends BaseRedisModel
{


    use SoftDelete;
    protected $deleteTime = 'delete_time';


    /**
     * 自定义缓存函数
     * @param array $record
     */
    protected function refresh_cache_record_callback($record = []){
    }



    protected function drop_cache_record_callback($id = 0)
    {
        // TODO: Implement drop_cache_record_callback() method.
    }


}