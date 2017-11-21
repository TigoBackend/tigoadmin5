<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/11/20
 * Time: 14:46
 */

namespace think\cache;


use think\Cache;
use think\exception\ErrorException;

final class WatersCache
{

    protected static $redis_config = [];
    protected static $file_config = ['type'=>'File','prefix'=>'','path'=>CACHE_PATH];

    public static $redis_handler;
    public static $file_handler;


    /*-------------------------------------综合缓存(自动切换redis/file两种缓存模式)工具函数start-----------------------------------------*/


    /**
     * 自动初始化redis缓存
     * @param array $options
     * @param bool $force_refresh
     * @return \think\cache\Driver
     */
    public static function init_redis($options = [],$force_refresh=false){
        if (is_null(self::$redis_handler) || $force_refresh === true){
            $config = array_merge(config('redis_config'),$options);
            self::$redis_config['host'] = isset($config['host']) && $config['host']?$config['host']:'127.0.0.1';
            self::$redis_config['port'] = isset($config['port']) && $config['port']?$config['port']:'6379';
            self::$redis_config['password'] = isset($config['password']) && $config['password']?$config['password']:'';
            self::$redis_config['select'] = isset($config['select']) && $config['select']?$config['select']:0;
            self::$redis_config['expire'] = isset($config['expire']) && $config['expire']?$config['expire']:0;
            self::$redis_config['persistent'] = isset($config['persistent']) && $config['persistent']?$config['persistent']:false;
            self::$redis_config['prefix'] = isset($config['prefix']) && $config['prefix']?$config['prefix']:'';
            self::$redis_config['timeout'] = isset($config['timeout']) && $config['timeout']?$config['timeout']:2;
            self::$redis_config['type'] = isset($config['type']) && $config['type']?$config['type']:'Redis';
            self::$redis_handler = Cache::connect(self::$redis_config);
        }
        return self::$redis_handler;
    }


    /**
     * 设置/移除缓存(自动切换redis/file两种缓存模式)
     * @param $key
     * @param null $value
     * @param int $expire
     * @param $prefix
     * @return bool
     */
    public static function set($key,$value=null,$expire=0,$prefix = ''){
        try{
            $option = ['expire'=>$expire];
            if ($prefix)$option['prefix'] = $prefix;
            if (is_null($value)){
                return self::rm($key,$prefix);
            }else{
                return self::init_redis($option,true)->set($key,$value);
            }
        }catch (\RedisException $e){
            return self::file_cache($key,$value,$expire,$prefix);
        }catch (ErrorException $e){
            return self::file_cache($key,$value,$expire,$prefix);
        }
    }


    /**
     * 移除单个指定缓存(自动切换redis/file两种缓存模式)
     * @param $key
     * @param $prefix
     * @return bool
     */
    public static function rm($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->rm($key);
        }catch (\RedisException $e){
            return self::file_cache_rm($key,$prefix);
        }catch (ErrorException $e){
            return self::file_cache_rm($key,$prefix);
        }
    }


    /**
     * 读取缓存(自动切换redis/file两种缓存模式)
     * @param $key
     * @param bool $default
     * @param $prefix
     * @return mixed
     */
    public static function get($key,$default=false,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->get($key,$default);
        }catch (\RedisException $e){
            return self::get_file_cache($key,$prefix);
        }catch (ErrorException $e){
            return self::get_file_cache($key,$prefix);
        }
    }

    /**
     * 判断字符串缓存是否存在(自动切换redis/file两种缓存模式)
     * @param $key
     * @param $prefix
     * @return bool
     */
    public static function has($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->has($key);
        }catch (\RedisException $e){
            $cache = self::get_file_cache($key,$prefix);
            return $cache?true:false;
        }catch (ErrorException $e){
            $cache = self::get_file_cache($key,$prefix);
            return $cache?true:false;
        }
    }

    /**
     * 判断指定key是否存在(自动切换redis/file两种缓存模式)
     * @param $key
     * @param string $prefix
     * @return bool
     */
    public static function exists($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->exists($key);
        }catch (\RedisException $e){
            $cache = self::get_file_cache($key,$prefix);
            return $cache?true:false;
        }catch (ErrorException $e){
            $cache = self::get_file_cache($key,$prefix);
            return $cache?true:false;
        }
    }


    /**
     * 自增缓存(自动切换redis/file两种缓存模式)
     * @param $key
     * @param $step
     * @param string $prefix
     * @return false|int
     */
    public static function inc($key,$step=1,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->inc($key,$step);
        }catch (\RedisException $e){
            return self::file_cache_inc($key,$step,$prefix);
        }catch (ErrorException $e){
            return self::file_cache_inc($key,$step,$prefix);
        }
    }


    /**
     * 自减缓存(自动切换redis/file两种缓存模式)
     * @param $key
     * @param $step
     * @param string $prefix
     * @return false|int
     */
    public static function dec($key,$step=1,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->dec($key,$step);
        }catch (\RedisException $e){
            return self::file_cache_dec($key,$step,$prefix);
        }catch (ErrorException $e){
            return self::file_cache_dec($key,$step,$prefix);
        }
    }


    /**
     * 清除缓存(自动切换redis/file两种缓存模式)
     * @param null $tag
     * @param string $prefix
     * @return bool|false|int
     */
    public static function clear($tag = null,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->clear($tag);
        }catch (\RedisException $e){
            return self::file_cache_clear($tag,$prefix);
        }catch (ErrorException $e){
            return self::file_cache_dec($tag,$prefix);
        }
    }


    /**
     * 查找符合pattern模式给定的key列表(只适合redis缓存)
     * @param string $pattern
     * @param string $prefix
     * @return null
     */
    public static function keys($pattern = '*',$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->keys($pattern);
        }catch (\RedisException $e){
            return null;
        }catch (ErrorException $e){
            return null;
        }
    }


    /**
     * 批量或单个删除指定key的缓存(自动切换redis/file两种缓存模式)
     * @param string|array $keys
     * @param string $prefix
     * @return null
     */
    public static function del($keys,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->del($keys);
        }catch (\RedisException $e){
            return self::file_cache_del($keys,$prefix);
        }catch (ErrorException $e){
            return self::file_cache_del($keys,$prefix);
        }
    }


    /**
     * 删除符合pattern模式的key的缓存,注意pattern不传或传入*表示移除所有缓存(只适合redis缓存)
     * @param string $pattern
     * @param string $prefix
     * @return bool
     */
    public static function del_pattern($pattern = '*',$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->del_pattern($pattern);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }

    /**
     * 根据索引切换当前redis数据库(只适合redis缓存)
     * @param null $index
     * @return bool
     */
    public static function select($index=null){
        try{
            $index = empty(intval($index))?0:intval($index);
            return self::init_redis()->select($index);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 将指定key的数据移到指定索引的数据库中(只适合redis缓存)
     * @param $key
     * @param $db_index
     * @param string $prefix
     * @return bool
     */
    public static function move($key,$db_index,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            $db_index = empty(intval($db_index))?0:intval($db_index);
            return self::init_redis($option,true)->move($key,$db_index);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 获取指定数组中的key对应的缓存(批量获取缓存)(只适合redis缓存)
     * @param array $keys
     * @param string $prefix
     * @return bool
     */
    public static function mget(array $keys,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->mget($keys);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 批量添加缓存(只适合redis缓存)
     * @param array $datas
     * @param string $prefix
     * @return bool
     */
    public static function mset(array $datas,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->mset($datas);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }










    /*-------------------------------------综合缓存(自动切换redis/file两种缓存模式)工具函数end-----------------------------------------*/


    /*-----------------------------------------hash对象缓存只支持redis缓存模式 start-----------------------------------------*/


    /**
     * 批量保存哈希对象属性
     * @param string $key
     * @param array $obj
     * @param string $prefix
     * @return mixed
     */
    public static function hash_multi_set($key,array $obj,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_multi_set($key,$obj);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 保存单个属性到哈希对象
     * @param string $key
     * @param string $hash_key
     * @param $value
     * @param string $prefix
     * @return mixed
     */
    public static function hash_set($key,$hash_key,$value,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_set($key,$hash_key,$value);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 获取整个哈希对象
     * @param string $key
     * @param string $prefix
     * @return mixed
     */
    public static function hash_get_all($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_get_all($key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 获取单个哈希对象属性
     * @param string $key
     * @param string $hash_key
     * @param string $prefix
     * @return mixed
     */
    public static function hash_get($key,$hash_key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_get($key,$hash_key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 获取多个指定哈希对象属性
     * @param string $key
     * @param array $hash_keys
     * @param string $prefix
     * @return bool
     */
    public static function hash_multi_get($key,array $hash_keys,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_multi_get($key,$hash_keys);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 移除单个或多个指定哈希对象下的属性
     * @param string $key
     * @param string|array $hash_keys
     * @param string $prefix
     * @return bool
     */
    public static function hash_del($key,$hash_keys,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_del($key,$hash_keys);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }


    /**
     * 指定哈希对象中指定属性是否存在
     * @param $key
     * @param $hash_key
     * @param string $prefix
     * @return bool
     */
    public static function hash_exists($key,$hash_key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_exists($key,$hash_key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }

    /**
     * 为指定哈希对象中指定属性的整数值自增指定数值
     * @param string $key
     * @param string $hash_key
     * @param int $step
     * @param string $prefix
     * @return bool|int
     */
    public static function hash_increment_by_int($key,$hash_key,$step,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_increment_by_int($key,$hash_key,$step);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }
    /**
     * 为指定哈希对象中指定属性的浮点数值自增指定数值
     * @param string $key
     * @param string $hash_key
     * @param float $step
     * @param string $prefix
     * @return bool|int
     */
    public static function hash_increment_by_float($key,$hash_key,$step,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_increment_by_float($key,$hash_key,$step);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }

    /**
     * 获取哈希对象中字段列表
     * @param string $key
     * @param string $prefix
     * @return bool
     */
    public static function hash_keys($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_keys($key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }

    /**
     * 获取哈希对象字段数量
     * @param string $key
     * @param string $prefix
     * @return bool|int
     */
    public static function hash_len($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_len($key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }

    /**
     * 获取哈希对象中所有值
     * @param string $key
     * @param string $prefix
     * @return bool|array
     */
    public static function hash_values($key,$prefix = ''){
        try{
            $option = [];
            if ($prefix)$option['prefix'] = $prefix;
            return self::init_redis($option,true)->hash_values($key);
        }catch (\RedisException $e){
            return false;
        }catch (ErrorException $e){
            return false;
        }
    }



    
    



    /*-----------------------------------------hash对象缓存只支持redis缓存模式 end-----------------------------------*/


    /*----------------------------------------文本缓存工具函数start-----------------------------------------*/

    /**
     * 自动初始化文件缓存
     * @param string $prefix
     * @return \think\cache\Driver
     */
    public static function init_file($prefix = ''){
        self::$file_config['prefix'] = $prefix?$prefix:self::$file_config['prefix'];
        self::$file_handler = \think\Cache::connect(self::$file_config);
        return self::$file_handler;
    }


    /**
     * 以文件类型缓存数据
     * @param $key
     * @param null $value
     * @param int $expire
     * @param string $prefix
     * @return bool
     */
    public static function file_cache($key,$value=null,$expire=70,$prefix=''){
        if (empty($key)) return false;
        $expire = empty($expire)?0:$expire;
        $cache = self::init_file($prefix);
        if ($value){
            return $cache->set($key,$value,$expire);
        }else{
            return $cache->rm($key);
        }
    }



    /**
     * 获取文件类型的缓存数据
     * @param $key
     * @param string $prefix
     * @return mixed
     */
    public static function get_file_cache($key,$prefix=''){
        return self::init_file($prefix)->get($key,[]);
    }


    /**
     * 自增文件缓存（针对数值缓存）
     * @param $key
     * @param $step
     * @param string $prefix
     * @return false|int
     */
    public static function file_cache_inc($key,$step,$prefix = ''){
        return self::init_file($prefix)->inc($key,$step);
    }


    /**
     * 自减文件缓存（针对数值缓存）
     * @param $key
     * @param $step
     * @param string $prefix
     * @return false|int
     */
    public static function file_cache_dec($key,$step,$prefix = ''){
        return self::init_file($prefix)->dec($key,$step);
    }

    /**
     * 删除文件缓存
     * @param $key
     * @param string $prefix
     * @return bool
     */
    public static function file_cache_rm($key,$prefix = ''){
        return self::init_file($prefix)->rm($key);
    }


    /**
     * 清除文件缓存
     * @param $tag
     * @param string $prefix
     * @return bool
     */
    public static function file_cache_clear($tag,$prefix = ''){
        return self::init_file($prefix)->clear($tag);
    }


    /**
     * 批量或单个移除文件缓存
     * @param $keys
     * @param string $prefix
     * @return bool
     */
    public static function file_cache_del($keys,$prefix = ''){
        $cache = self::init_file($prefix);
        /*单个移除*/
        if (is_string($keys)){
            $cache->rm($keys);
            return true;
        }
        /*批量移除*/
        if (is_array($keys)){
            foreach ($keys as $value){
                $cache->rm($value);
            }
            return true;
        }
        return false;
    }


    /*----------------------------------------文本缓存工具函数end-----------------------------------------*/







}