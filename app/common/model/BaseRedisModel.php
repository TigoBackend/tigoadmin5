<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/5/22
 * Time: 9:31
 */

namespace app\common\model;


use think\Model;
use think\RedisCache;

class BaseRedisModel extends Model
{

    /*--------------------------------------缓存key start------------------------------------------*/


    /*--------------------------------------string start------------------------------------------*/


    /*--------------------------------------string end------------------------------------------*/


    /*--------------------------------------hash对象 start------------------------------------------*/




    /*--------------------------------------hash对象 end------------------------------------------*/


    /*--------------------------------------有序集合 start------------------------------------------*/

    /*--------------------------------------有序集合 end------------------------------------------*/




    /*--------------------------------------缓存key end------------------------------------------*/


    /**
     * redis是否可用
     * @var bool
     */
        protected $can_redis = false;


    public function __construct($data = [])
    {
        parent::__construct($data);
        try{
            if (RedisCache::connect()->ping()) $this->can_redis = true;
        }catch (\Exception $e){
            $this->can_redis = false;
        }
    }



    public function refresh_cache_record($record = []){}





}