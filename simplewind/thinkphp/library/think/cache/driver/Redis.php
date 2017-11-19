<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2017 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace think\cache\driver;

use think\cache\Driver;

/**
 * Redis缓存驱动，适合单机部署、有前端代理实现高可用的场景，性能最好
 * 有需要在业务层实现读写分离、或者使用RedisCluster的需求，请使用Redisd驱动
 *
 * 要求安装phpredis扩展：https://github.com/nicolasff/phpredis
 * @author    尘缘 <130775@qq.com>
 */
class Redis extends Driver
{
    protected $options = [
        'host'       => '127.0.0.1',
        'port'       => 6379,
        'password'   => '',
        'select'     => 0,
        'timeout'    => 0,
        'expire'     => 0,
        'persistent' => false,
        'prefix'     => '',
    ];

    /**
     * 构造函数
     * @param array $options 缓存参数
     * @access public
     */
    public function __construct($options = [])
    {
        if (!extension_loaded('redis')) {
            throw new \BadFunctionCallException('not support: redis');
        }
        if (!empty($options)) {
            $this->options = array_merge($this->options, $options);
        }
        $func          = $this->options['persistent'] ? 'pconnect' : 'connect';
        $this->handler = new \Redis;
        $this->handler->$func($this->options['host'], $this->options['port'], $this->options['timeout']);

        if ('' != $this->options['password']) {
            $this->handler->auth($this->options['password']);
        }

        if (0 != $this->options['select']) {
            $this->handler->select($this->options['select']);
        }
    }

    /**
     * 判断缓存
     * @access public
     * @param string $name 缓存变量名
     * @return bool
     */
    public function has($name)
    {
        return $this->handler->get($this->getCacheKey($name)) ? true : false;
    }

    /**
     * 读取缓存
     * @access public
     * @param string $name 缓存变量名
     * @param mixed  $default 默认值
     * @return mixed
     */
    public function get($name, $default = false)
    {
        $value = $this->handler->get($this->getCacheKey($name));
        if (empty($value)) {
            return $default;
        }
        $jsonData = json_decode($value, true);
        // 检测是否为JSON数据 true 返回JSON解析数组, false返回源数据 byron sampson<xiaobo.sun@qq.com>
        return (null === $jsonData) ? $value : $jsonData;
    }

    /**
     * 写入缓存
     * @access public
     * @param string            $name 缓存变量名
     * @param mixed             $value  存储数据
     * @param integer|\DateTime $expire  有效时间（秒）
     * @return boolean
     */
    public function set($name, $value, $expire = null)
    {
        if (empty($expire)) {
            $expire = $this->options['expire'];
        }
        if ($expire instanceof \DateTime) {
            $expire = $expire->getTimestamp() - time();
        }
        if ($this->tag && !$this->has($name)) {
            $first = true;
        }
        $key = $this->getCacheKey($name);
        //对数组/对象数据进行缓存处理，保证数据完整性  byron sampson<xiaobo.sun@qq.com>
        $value = (is_object($value) || is_array($value)) ? json_encode($value) : $value;
        if (is_int($expire) && $expire) {
            $result = $this->handler->setex($key, $expire, $value);
        } else {
            $result = $this->handler->set($key, $value);
        }
        isset($first) && $this->setTagItem($key);
        return $result;
    }

    /**
     * 自增缓存（针对数值缓存）
     * @access public
     * @param string    $name 缓存变量名
     * @param int       $step 步长
     * @return false|int
     */
    public function inc($name, $step = 1)
    {
        $key = $this->getCacheKey($name);
        return $this->handler->incrby($key, $step);
    }

    /**
     * 自减缓存（针对数值缓存）
     * @access public
     * @param string    $name 缓存变量名
     * @param int       $step 步长
     * @return false|int
     */
    public function dec($name, $step = 1)
    {
        $key = $this->getCacheKey($name);
        return $this->handler->decrby($key, $step);
    }

    /**
     * 删除单个缓存
     * @access public
     * @param string $name 缓存变量名
     * @return boolean
     */
    public function rm($name)
    {
        return $this->handler->delete($this->getCacheKey($name));
    }

    /**
     * 清除缓存
     * @access public
     * @param string $tag 标签名
     * @return boolean
     */
    public function clear($tag = null)
    {
        if ($tag) {
            // 指定标签清除
            $keys = $this->getTagItem($tag);
            foreach ($keys as $key) {
                $this->handler->delete($key);
            }
            $this->rm('tag_' . md5($tag));
            return true;
        }
        return $this->handler->flushDB();
    }


    /**
     * 获取实际的缓存标识
     * @access public
     * @param string $name 缓存名
     * @return string
     */
    protected function getCacheKey($name)
    {
        if (!empty($this->options['prefix']) && strpos($name,$this->options['prefix']) === 0)return $name;
        return $this->options['prefix'] . $name;
    }


    /**
     * 查找符合pattern模式给定的key列表
     * @param string $pattern
     * @return array
     */
    public function keys($pattern = '*'){
        $pattern = empty($pattern)? '*':(string)$pattern;
        $pattern = $this->getCacheKey($pattern);
        return $this->handler->keys($pattern);
    }


    /**
     * 移除指定key的缓存
     * @param string|array $keys
     * @return int
     * @throws \RedisException
     */
    public function del($keys){
        if (!is_string($keys) && !is_array($keys)) throw new \RedisException('key must be string or array');
        if (is_array($keys)){
            foreach ($keys as $k => $key){
                $keys[$k] = $this->getCacheKey($key);
            }
        }
        return $this->handler->del($keys);
    }

    /**
     * 删除符合pattern模式的key的缓存,注意pattern不传或传入*表示移除所有缓存
     * @param string $pattern
     * @return int
     * @throws \RedisException
     */
    public function del_pattern($pattern = '*'){
        $keys = $this->keys($pattern);
        return $this->del($keys);
    }


    /**
     * 根据索引切换当前redis数据库
     * @param null $index
     * @return bool
     */
    public function select($index=null){
        $index = empty(intval($index))?0:intval($index);
        return $this->handler->select($index);
    }


    /**
     * 将指定key的数据移到指定索引的数据库中
     * @param $key
     * @param $db_index
     * @return bool
     */
    public function move($key,$db_index){
        return $this->handler->move($this->getCacheKey($key),$db_index);
    }


    /**
     * 获取指定数组中的key对应的缓存(批量获取缓存)
     * @param array $keys
     * @return array
     */
    public function mget(array $keys){
        foreach ($keys as $k => $key){
            $keys[$k] = $this->getCacheKey($key);
        }
        return $this->handler->mget($keys);
    }


    /**
     * 批量添加缓存
     * @param array $datas
     * @return bool
     */
    public function mset(array $datas){
        $result = [];
        foreach ($datas as $key => $value){
            $result[$this->getCacheKey($key)] = $value;
        }
        return $this->handler->mset($result);
    }
    
    



}
