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



    /*---------------------------------------string函数 start-----------------------------------------*/

    /**
     * 判断字符串缓存
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
        $value = (is_object($value) || is_array($value)) ? json_encode($value,JSON_UNESCAPED_UNICODE) : $value;
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
     * 获取指定数组中的key对应的缓存(批量获取缓存),自动进行json格式化
     * @param array $keys
     * @return array
     */
    public function mget(array $keys){
        foreach ($keys as $k => $key){
            $keys[$k] = $this->getCacheKey($key);
        }
        $result = $this->handler->mget($keys);
        foreach ($result as $k => $value){
            $result[$k] = $this->string_to_value($value);
        }
        return $result;
    }


    /**
     * 批量添加缓存
     * @param array $datas
     * @return bool
     */
    public function mset(array $datas){
        $result = [];
        foreach ($datas as $key => $value){
            $result[$this->getCacheKey($key)] = $this->value_to_string($value);
        }
        return $this->handler->mset($result);
    }


    /**
     * @param $key
     * @param $value
     * @return string
     */
    public function getSet($key,$value){
        return $this->handler->getSet($this->getCacheKey($key),$this->value_to_string($value));
    }


    /**
     * 在指定key的字符串后面最加一段新字符串
     * @param string $key
     * @param mixed $value
     * @return int
     */
    public function append($key,$value){
        return $this->handler->append($this->getCacheKey($key),$this->value_to_string($value));
    }


    /**
     * 根据范围返回指定key对应的截取过后的字符串
     * @param string $key
     * @param int $start    -1倒数第一个字符 0第一个字符
     * @param int $end      -1倒数第一个字符 0第一个字符
     * @return string
     * <pre>
     * $redis->set('key', 'string value');
     * $redis->getRange('key', 0, 5);   // 'string'
     * $redis->getRange('key', -5, -1); // 'value'
     * </pre>
     */
    public function getRange($key,$start,$end){
        return $this->handler->getRange($this->getCacheKey($key),$start,$end);
    }


    /**
     * 将指定key的字符串对应的字符索引(包括)往后的字符串替换为指定值
     * @param $key
     * @param $offset
     * @param $value
     * @return string
     * <pre>
     * $redis->set('key', 'Hello world');
     * $redis->setRange('key', 6, "redis"); // returns 11
     * $redis->get('key');                  // "Hello redis"
     * </pre>
     */
    public function setRange($key,$offset,$value){
        return $this->handler->setRange($this->getCacheKey($key),$offset,$value);
    }


    /**
     * 返回指定key字符串的长度
     * @param $key
     * @return int
     * <pre>
     * $redis->set('key', 'value');
     * $redis->strlen('key'); // 5
     * </pre>
     */
    public function strlen($key){
        return $this->handler->strlen($this->getCacheKey($key));
    }


    /**
     * Return a single bit out of a larger string
     *
     * @param   string  $key
     * @param   int     $offset
     * @return  int:    the bit value (0 or 1)
     * @link    http://redis.io/commands/getbit
     * @example
     * <pre>
     * $redis->set('key', "\x7f");  // this is 0111 1111
     * $redis->getBit('key', 0);    // 0
     * $redis->getBit('key', 1);    // 1
     * </pre>
     */
    public function getBit($key,$offset){
        return $this->handler->getBit($this->getCacheKey($key),$offset);
    }


    /**
     * Changes a single bit of a string.
     *
     * @param   string  $key
     * @param   int     $offset
     * @param   bool|int $value bool or int (1 or 0)
     * @return  int:    0 or 1, the value of the bit before it was set.
     * @link    http://redis.io/commands/setbit
     * @example
     * <pre>
     * $redis->set('key', "*");     // ord("*") = 42 = 0x2f = "0010 1010"
     * $redis->setBit('key', 5, 1); // returns 0
     * $redis->setBit('key', 7, 1); // returns 0
     * $redis->get('key');          // chr(0x2f) = "/" = b("0010 1111")
     * </pre>
     */
    public function setBit($key,$offset,$value){
        return $this->handler->setBit($this->getCacheKey($key),$offset,$value);
    }




    /*---------------------------------------string函数 end-----------------------------------------*/



    /*---------------------------------------hash函数 start-----------------------------------------*/

    /**
     * 批量保存哈希对象属性
     * @param string $key
     * @param array $obj
     * @return bool
     */
    public function hMset($key,array $obj){
        return $this->handler->hMset($this->getCacheKey($key),$obj);
    }


    /**
     * 保存单个属性到哈希对象
     * @param $key
     * @param $hash_key
     * @param $value
     * @return int
     */
    public function hSet($key,$hash_key,$value){
        return $this->handler->hSet($this->getCacheKey($key),$hash_key,$this->value_to_string($value));
    }


    /**
     * 保存单个属性到哈希对象如果这个属性已经存在的话,否则失败
     * @param $key
     * @param $hash_key
     * @param $value
     * @return bool
     */
    public function hSetNx($key,$hash_key,$value){
        return $this->handler->hSetNx($this->getCacheKey($key),$hash_key,$this->value_to_string($value));
    }


    /**
     *获取整个哈希对象
     * @param $key
     * @return array
     */
    public function hGetAll($key){
        return $this->handler->hGetAll($this->getCacheKey($key));
    }


    /**
     * 获取单个哈希对象属性
     * @param $key
     * @param $hash_key
     * @return string
     */
    public function hGet($key,$hash_key){
        return $this->handler->hGet($this->getCacheKey($key),$hash_key);
    }

    /**
     * 获取多个指定哈希对象属性
     * @param $key
     * @param array $hash_keys
     * @return array
     */
    public function hMGet($key,array $hash_keys){
        return $this->handler->hMGet($this->getCacheKey($key),$hash_keys);
    }


    /**
     * 移除单个或多个指定哈希对象下的属性(最多5个属性)
     * 如果需要批量多个属性删除可以选择hMDel函数或直接使用原生的Redis类的hDel函数
     * @param $key
     * @param $hash_key1
     * @param null $hash_key2
     * @param null $hash_key3
     * @param null $hash_key4
     * @param null $hash_key5
     * @return int
     */
    public function hDel($key,$hash_key1,$hash_key2=null,$hash_key3=null,$hash_key4=null,$hash_key5=null){
        return $this->handler->hDel($this->getCacheKey($key),$hash_key1,$hash_key2,$hash_key3,$hash_key4,$hash_key5);
    }


    /**
     * 移除单个或多个指定哈希对象下的属性
     * @param string $key
     * @param array $hash_keys
     */
    public function hMDel($key,array $hash_keys){
        if (is_array($hash_keys)){
            foreach ($hash_keys as $hash_key){
                $this->handler->hDel($this->getCacheKey($key),$hash_key);
            }
        }
    }




    /**
     * 指定哈希对象中指定属性是否存在
     * @param $key
     * @param $hash_key
     * @return bool
     */
    public function hExists($key,$hash_key){
        return $this->handler->hExists($this->getCacheKey($key),$hash_key);
    }

    /**
     * 为指定哈希对象中指定属性的整数值自增指定数值
     * @param string $key
     * @param string $hash_key
     * @param int $step
     * @return int
     */
    public function hIncrBy($key,$hash_key,$step){
        return $this->handler->hIncrBy($this->getCacheKey($key),$hash_key,$step);
    }


    /**
     * 为指定哈希对象中指定属性的浮点数值自增指定数值
     * @param string $key
     * @param string $hash_key
     * @param float $step
     * @return float
     */
    public function hIncrByFloat($key,$hash_key,$step){
        return $this->handler->hIncrByFloat($this->getCacheKey($key),$hash_key,$step);
    }


    /**
     * 获取哈希对象中字段列表
     * @param string $key
     * @return array
     */
    public function hKeys($key){
        return $this->handler->hKeys($this->getCacheKey($key));
    }


    /**
     * 获取哈希对象字段数量
     * @param $key
     * @return int
     */
    public function hLen($key){
        return $this->handler->hLen($this->getCacheKey($key));
    }


    /**
     * 获取哈希对象中所有值
     * @param $key
     * @return array
     */
    public function hVals($key){
        return $this->handler->hVals($this->getCacheKey($key));
    }


    /*---------------------------------------hash函数 end-----------------------------------------*/
    /*---------------------------------------list函数 start-----------------------------------------*/

    /**
     *移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
     * 自动格式化json字符串
     * @param $key
     * @param int $timeout
     * @return array|bool
     */
    public function blop($key, $timeout=1){
        if ($this->type($key) !== \Redis::REDIS_LIST) return false;
        $result = $this->handler->blPop($this->getCacheKey($key),$timeout);
        if (isset($result[1])){
            $result[1] = $this->string_to_value($result[1]);
        }
        return $result;
    }


    /**
     *移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
     * 自动格式化json字符串
     * @param $key
     * @param int $timeout
     * @return array|bool
     */
    public function brPop($key, $timeout=1){
        if ($this->type($key) !== \Redis::REDIS_LIST) return false;
        $result = $this->handler->brPop($this->getCacheKey($key),$timeout);
        if (isset($result[1])){
            $result[1] = $this->string_to_value($result[1]);
        }
        return $result;
    }


    /**
     * 从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
     * 自动格式化json字符串
     * @param $source
     * @param $destination
     * @param int $timeout
     * @return bool|string
     */
    public function brpoplpush($source,$destination,$timeout=1){
        if ($this->type($source) !== \Redis::REDIS_LIST) return false;
        $result = $this->handler->brpoplpush($this->getCacheKey($source),$this->getCacheKey($destination),$timeout);
        return $this->string_to_value($result);
    }


    /**
     * 通过索引获取列表中的元素
     * 自动格式化json字符串
     * @param $key
     * @param int $index
     * @return String
     */
    public function lIndex($key,$index=0){
        $result = $this->handler->lIndex($this->getCacheKey($key),$index);
        return $this->string_to_value($result);
    }


    /**
     * 在列表的元素前或者后插入元素
     * 自动格式化json数据
     * @param $key
     * @param $position
     * @param $pivot
     * @param $value
     * @return int
     */
    public function lInsert($key, $position, $pivot, $value){
        return $this->handler->lInsert($this->getCacheKey($key), $position, $pivot,$this->value_to_string($value));
    }

    /**
     * 获取列表长度
     * @param $key
     * @return int
     */
    public function lLen($key){
        return $this->handler->lLen($this->getCacheKey($key));
    }


    /**
     * 移出并获取列表的第一个元素
     * @param $key
     * @return string
     */
    public function lPop($key){
        $result = $this->handler->lPop($this->getCacheKey($key));
        return $this->string_to_value($result);
    }


    /**
     * 将一个或多个值插入到列表头部
     * 自动格式化json
     * @param $key
     * @param $value1
     * @param null $value2
     * @param null $valueN
     * @return bool
     */
    public function lPush($key,$value1,$value2 = null,$valueN = null){
        $params = func_get_args();
        $key = $this->getCacheKey($key);
        $rs = $this->handler->lPush($key,$this->value_to_string($value1));
        if (!$rs) return false;
        for ($i=2;$i < count($params);$i++){
            $this->handler->lPush($key,$this->value_to_string($params[$i]));
        }
        return true;
    }

    /**
     * 将一个值插入到已存在的列表头部
     * @param $key
     * @param $value
     * @return int
     */
    public function lPushx($key,$value){
        return $this->handler->lPushx($this->getCacheKey($key),$this->value_to_string($value));
    }


    /**
     * 获取列表指定范围内的元素
     * @param $key
     * @param $start
     * @param $stop
     * @return array
     */
    public function lRange($key,$start,$stop){
        $tmp = $this->handler->lRange($this->getCacheKey($key),$start,$stop);
        $result = [];
        foreach ($tmp as $k => $v){
            $result[] = $this->string_to_value($v);
        }
        return $result;
    }


    /**
     * 移除列表元素
     * @param $key
     * @param $value
     * @param int $count
     * count > 0 : 从表头开始向表尾搜索，移除与 VALUE 相等的元素，数量为 COUNT 。
     * count < 0 : 从表尾开始向表头搜索，移除与 VALUE 相等的元素，数量为 COUNT 的绝对值。
     * count = 0 : 移除表中所有与 VALUE 相等的值。
     * @return int
     */
    public function lRem($key,$value,$count=0){
        return $this->handler->lRem($this->getCacheKey($key),$this->value_to_string($value),$count);
    }


    /**
     * 通过索引设置列表元素的值
     * @param $key
     * @param $index
     * @param $value
     * @return BOOL
     */
    public function lSet($key,$index,$value){
        return $this->handler->lSet($this->getCacheKey($key),$index,$this->value_to_string($value));
    }


    /**
     * 对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除。
     * @param $key
     * @param $start
     * @param $stop
     * @return array
     */
    public function lTrim($key,$start,$stop){
        return $this->handler->lTrim($this->getCacheKey($key),$start,$stop);
    }


    /**
     * @param $key
     * @return mixed
     */
    public function rPop($key){
        $result = $this->handler->rPop($this->getCacheKey($key));
        return $this->string_to_value($result);
    }


    /**
     * 移除列表的最后一个元素，并将该元素添加到另一个列表并返回
     * @param $source
     * @param $destination
     * @return bool|mixed
     */
    public function rpoplpush($source,$destination){
        if ($this->type($source) !== \Redis::REDIS_LIST) return false;
        $result = $this->handler->rpoplpush($this->getCacheKey($source),$this->getCacheKey($destination));
        return $this->string_to_value($result);
    }


    /**
     * 在列表尾部添加一个或多个值
     * @param $key
     * @param $value1
     * @param null $value2
     * @param null $valueN
     * @return bool
     */
    public function rPush($key,$value1,$value2 = null,$valueN = null){
        $params = func_get_args();
        $key = $this->getCacheKey($key);
        $rs = $this->handler->rPush($key,$this->value_to_string($value1));
        if (!$rs) return false;
        for ($i=2;$i < count($params);$i++){
            $this->handler->rPush($key,$this->value_to_string($params[$i]));
        }
        return true;
    }

    /**
     * 为已存在的列表尾部添加值
     * @param $key
     * @param $value
     * @return int
     */
    public function rPushx($key,$value){
        return $this->handler->rPushx($this->getCacheKey($key),$this->value_to_string($value));
    }





    /*---------------------------------------list函数 end-----------------------------------------*/
    /*---------------------------------------key函数 start-----------------------------------------*/



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
        }else{
            $keys = $this->getCacheKey($keys);
        }
        return $this->handler->del($keys);
    }

    /**
     * 序列化给定 key ，并返回被序列化的值。
     * @param string $key
     * @return string
     */
    public function dump($key){
        return $this->handler->dump($this->getCacheKey($key));
    }


    /**
     * 判断指定key是否存在
     * @param string $key
     * @return bool
     */
    public function exists($key){
        return $this->handler->exists($this->getCacheKey($key));
    }

    /**
     * 为给定 key 设置过期时间。
     * @param string $key
     * @param int $seconds
     * @return bool
     */
    public function expire($key,$seconds){
        return $this->handler->expire($this->getCacheKey($key),$seconds);
    }


    /**
     * EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp)。
     * @param string $key
     * @param int $timestamp
     * @return bool
     */
    public function expireAt($key,$timestamp){
        return $this->handler->expireAt($this->getCacheKey($key),$timestamp);
    }


    /**
     * 设置 key 的过期时间以毫秒计。
     * @param string $key
     * @param int $milliseconds
     * @return bool
     */
    public function pExpire($key,$milliseconds){
        return $this->handler->pExpire($this->getCacheKey($key),$milliseconds);
    }


    /**
     * 设置 key 过期时间的时间戳(unix timestamp) 以毫秒计
     * @param string $key
     * @param int $milli_timestamp
     * @return bool
     */
    public function pExpireAt($key,$milli_timestamp){
        return $this->handler->pExpireAt($this->getCacheKey($key),$milli_timestamp);
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
     * 将指定key的数据移到指定索引的数据库中
     * @param $key
     * @param $db_index
     * @return bool
     */
    public function move($key,$db_index){
        $db_index = empty(intval($db_index))?0:intval($db_index);
        return $this->handler->move($this->getCacheKey($key),$db_index);
    }


    /**
     * 移除 key 的过期时间，key 将持久保持。
     * @param $key
     * @return bool
     */
    public function persist($key){
        return $this->handler->persist($this->getCacheKey($key));
    }


    /**
     * 以毫秒为单位返回 key 的剩余的过期时间。
     * @param string $key
     * @return int
     */
    public function pttl($key){
        return $this->handler->pttl($this->getCacheKey($key));
    }


    /**
     * 以秒为单位，返回给定 key 的剩余生存时间(TTL, time to live)。
     * @param string $key
     * @return int
     */
    public function ttl($key){
        return $this->handler->ttl($this->getCacheKey($key));
    }


    /**
     * 从当前数据库中随机返回一个 key 。自动移除prefix
     * @return string
     */
    public function randomKey(){
        $key = $this->handler->randomKey();
        if (!empty($this->options['prefix']) && strpos($key,$this->options['prefix']) === 0){
            $key = substr($key,strlen($this->options['prefix']));
        }
        return $key;
    }


    /**
     * 修改 key 的名称(如果新的key已经存在则覆盖原有的值)
     * @param $key
     * @param $new_key
     * @return bool
     */
    public function rename($key,$new_key){
        return $this->handler->rename($this->getCacheKey($key),$this->getCacheKey($new_key));
    }


    /**
     * 仅当 newkey 不存在时，将 key 改名为 newkey 。
     * @param $key
     * @param $new_key
     * @return bool
     */
    public function renameNx($key,$new_key){
        return $this->handler->renameNx($this->getCacheKey($key),$this->getCacheKey($new_key));
    }



    /**
     * 返回 key 所储存的值的类型
     * @param $key
     * @return int
     */
    public function type($key){
        return $this->handler->type($this->getCacheKey($key));
    }


    /**
     * 
     * @param $key
     * @param $second
     */
    public function setTimeout($key,$second){
        $this->handler->setTimeout($this->getCacheKey($key),$second);
    }

    /*---------------------------------------key函数 end-----------------------------------------*/


    /*---------------------------------------set函数 start-----------------------------------------*/

    /**
     * 向集合添加一个或多个成员
     * @param string $key
     * @param mixed $member
     * @return int
     */
    public function sAdd($key,$member){
        return $this->handler->sAdd($this->getCacheKey($key),$this->value_to_string($member));
    }


    /**
     * 返回指定key的集合中所有成员的数量
     *
     * @param   string  $key
     * @return  int     the cardinality of the set identified by key, 0 if the set doesn't exist.
     * @link    http://redis.io/commands/scard
     * @example
     * <pre>
     * $redis->sAdd('key1' , 'set1');
     * $redis->sAdd('key1' , 'set2');
     * $redis->sAdd('key1' , 'set3');   // 'key1' => {'set1', 'set2', 'set3'}
     * $redis->sCard('key1');           // 3
     * $redis->sCard('keyX');           // 0
     * </pre>
     */
    public function sCard($key){
        return $this->handler->sCard($this->getCacheKey($key));
    }



    /**
     * 以第一个集合为基础返回所有集合的差集
     * 最对比对5个key如果需要比多更多key请使用原生redis的sDiff
     *
     * @param   string  $key1 Any number of keys corresponding to sets in redis.
     * @param   string  $key2 ...
     * @param   string  $key3 ...
     * @param   string  $key4 ...
     * @param   string  $key5 ...
     * @return  array   of strings: The difference of the first set will all the others.
     * @link    http://redis.io/commands/sdiff
     * @example
     * <pre>
     * $redis->delete('s0', 's1', 's2');
     *
     * $redis->sAdd('s0', '1');
     * $redis->sAdd('s0', '2');
     * $redis->sAdd('s0', '3');
     * $redis->sAdd('s0', '4');
     *
     * $redis->sAdd('s1', '1');
     * $redis->sAdd('s2', '3');
     *
     * var_dump($redis->sDiff('s0', 's1', 's2'));
     *
     * //array(2) {
     * //  [0]=>
     * //  string(1) "4"
     * //  [1]=>
     * //  string(1) "2"
     * //}
     * </pre>
     */
    public function sDiff($key1,$key2,$key3=null,$key4=null,$key5=null){
        return $this->handler->sDiff($this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }


    /**
     * 以第一个集合为基础返回所有集合的差集并保存到destination的key中
     * 最对比对5个key如果需要比多更多key请使用原生redis的sDiffStore
     *
     * @param   string  $destination    the key to store the diff into.
     * @param   string  $key1      Any number of keys corresponding to sets in redis
     * @param   string  $key2      ...
     * @param   string  $key3      ...
     * @param   string  $key4      ...
     * @param   string  $key5      ...
     * @return  int:    The cardinality of the resulting set, or FALSE in case of a missing key.
     * @link    http://redis.io/commands/sdiffstore
     * @example
     * <pre>
     * $redis->delete('s0', 's1', 's2');
     *
     * $redis->sAdd('s0', '1');
     * $redis->sAdd('s0', '2');
     * $redis->sAdd('s0', '3');
     * $redis->sAdd('s0', '4');
     *
     * $redis->sAdd('s1', '1');
     * $redis->sAdd('s2', '3');
     *
     * var_dump($redis->sDiffStore('dst', 's0', 's1', 's2'));
     * var_dump($redis->sMembers('dst'));
     *
     * //int(2)
     * //array(2) {
     * //  [0]=>
     * //  string(1) "4"
     * //  [1]=>
     * //  string(1) "2"
     * //}
     * </pre>
     */
    public function sDiffStore($destination,$key1,$key2,$key3=null,$key4=null,$key5=null){
        return $this->handler->sDiffStore($this->getCacheKey($destination),$this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }


    /**
     * 以第一个集合为基础返回所有集合的交集
     * 最对比对5个key如果需要比多更多key请使用原生redis的sInter
     *
     * @param   string  $key1  keys identifying the different sets on which we will apply the intersection.
     * @param   string  $key2  ...
     * @param   string  $key3  ...
     * @param   string  $key4  ...
     * @param   string  $key5  ...
     * @return  array, contain the result of the intersection between those keys.
     * If the intersection between the different sets is empty, the return value will be empty array.
     * @link    http://redis.io/commands/sinterstore
     * @example
     * <pre>
     * $redis->sAdd('key1', 'val1');
     * $redis->sAdd('key1', 'val2');
     * $redis->sAdd('key1', 'val3');
     * $redis->sAdd('key1', 'val4');
     *
     * $redis->sAdd('key2', 'val3');
     * $redis->sAdd('key2', 'val4');
     *
     * $redis->sAdd('key3', 'val3');
     * $redis->sAdd('key3', 'val4');
     *
     * var_dump($redis->sInter('key1', 'key2', 'key3'));
     *
     * //array(2) {
     * //  [0]=>
     * //  string(4) "val4"
     * //  [1]=>
     * //  string(4) "val3"
     * //}
     * </pre>
     */
    public function sInter($key1,$key2,$key3=null,$key4=null,$key5=null){
        return $this->handler->sInter($this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }


    /**
     * 以第一个集合为基础返回所有集合的交集并保存到新的key中
     * 最对比对5个key如果需要比多更多key请使用原生redis的sInterStore
     *
     * @param   string  $destination the key to store the diff into.
     * @param   string  $key1 are intersected as in sInter.
     * @param   string  $key2 ...
     * @param   string  $key3 ...
     * @param   string  $key4 ...
     * @param   string  $key5 ...
     * @return  int:    The cardinality of the resulting set, or FALSE in case of a missing key.
     * @link    http://redis.io/commands/sinterstore
     * @example
     * <pre>
     * $redis->sAdd('key1', 'val1');
     * $redis->sAdd('key1', 'val2');
     * $redis->sAdd('key1', 'val3');
     * $redis->sAdd('key1', 'val4');
     *
     * $redis->sAdd('key2', 'val3');
     * $redis->sAdd('key2', 'val4');
     *
     * $redis->sAdd('key3', 'val3');
     * $redis->sAdd('key3', 'val4');
     *
     * var_dump($redis->sInterStore('output', 'key1', 'key2', 'key3'));
     * var_dump($redis->sMembers('output'));
     *
     * //int(2)
     * //
     * //array(2) {
     * //  [0]=>
     * //  string(4) "val4"
     * //  [1]=>
     * //  string(4) "val3"
     * //}
     * </pre>
     */
    public function sInterStore($destination,$key1,$key2,$key3=null,$key4=null,$key5=null){
        return $this->handler->sInterStore($this->getCacheKey($destination),$this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }


    /**
     * 检测指定集合中是否已经存在某个值
     *
     * @param   string  $key
     * @param   string  $member
     * @return  bool    TRUE if value is a member of the set at key key, FALSE otherwise.
     * @link    http://redis.io/commands/sismember
     * @example
     * <pre>
     * $redis->sAdd('key1' , 'set1');
     * $redis->sAdd('key1' , 'set2');
     * $redis->sAdd('key1' , 'set3'); // 'key1' => {'set1', 'set2', 'set3'}
     *
     * $redis->sIsMember('key1', 'set1'); // TRUE
     * $redis->sIsMember('key1', 'setX'); // FALSE
     * </pre>
     */
    public function sIsMember($key,$member){
        return $this->handler->sIsMember($this->getCacheKey($key),$this->value_to_string($member));
    }


    /**
     * 返回指定集合所有值
     *
     * @param   string  $key
     * @return  array   An array of elements, the contents of the set.
     * @link    http://redis.io/commands/smembers
     * @example
     * <pre>
     * $redis->delete('s');
     * $redis->sAdd('s', 'a');
     * $redis->sAdd('s', 'b');
     * $redis->sAdd('s', 'a');
     * $redis->sAdd('s', 'c');
     * var_dump($redis->sMembers('s'));
     *
     * //array(3) {
     * //  [0]=>
     * //  string(1) "c"
     * //  [1]=>
     * //  string(1) "a"
     * //  [2]=>
     * //  string(1) "b"
     * //}
     * // The order is random and corresponds to redis' own internal representation of the set structure.
     * </pre>
     */
    public function sMembers($key){
        $tmp = $this->handler->sMembers($this->getCacheKey($key));
        if (empty($tmp))return false;
        $result =[];
        foreach ($tmp as $value){
            $result[] = $this->string_to_value($value);
        }
        return $result;
    }


    /**
     * Moves the specified member from the set at $source to the set at $destination.
     * 移动指定集合的指定值到指定集合中
     *
     * @param   string  $source
     * @param   string  $destination
     * @param   string  $member
     * @return  bool    If the operation is successful, return TRUE.
     * If the srcKey and/or dstKey didn't exist, and/or the member didn't exist in srcKey, FALSE is returned.
     * @link    http://redis.io/commands/smove
     * @example
     * <pre>
     * $redis->sAdd('key1' , 'set11');
     * $redis->sAdd('key1' , 'set12');
     * $redis->sAdd('key1' , 'set13');          // 'key1' => {'set11', 'set12', 'set13'}
     * $redis->sAdd('key2' , 'set21');
     * $redis->sAdd('key2' , 'set22');          // 'key2' => {'set21', 'set22'}
     * $redis->sMove('key1', 'key2', 'set13');  // 'key1' =>  {'set11', 'set12'}
     *                                          // 'key2' =>  {'set21', 'set22', 'set13'}
     * </pre>
     */
    public function sMove($source,$destination,$member){
        return $this->sMove($this->getCacheKey($source),$this->getCacheKey($destination),$this->value_to_string($member));
    }


    /**
     * 随机返回并移除指定集合中的值
     *
     * @param   string  $key
     * @return  string  "popped" value
     * bool FALSE if set identified by key is empty or doesn't exist.
     * @link    http://redis.io/commands/spop
     * @example
     * <pre>
     * $redis->sAdd('key1' , 'set1');
     * $redis->sAdd('key1' , 'set2');
     * $redis->sAdd('key1' , 'set3');   // 'key1' => {'set3', 'set1', 'set2'}
     * $redis->sPop('key1');            // 'set1', 'key1' => {'set3', 'set2'}
     * $redis->sPop('key1');            // 'set3', 'key1' => {'set2'}
     * </pre>
     */
    public function sPop($key){
        $result = $this->handler->sPop($this->getCacheKey($key));
        return $this->string_to_value($result);
    }


    /**
     * 随机返回指定集合中的值
     *
     * @param   string  $key
     * @return  string  value from the set
     * bool FALSE if set identified by key is empty or doesn't exist.
     * @link    http://redis.io/commands/srandmember
     * @example
     * <pre>
     * $redis->sAdd('key1' , 'set1');
     * $redis->sAdd('key1' , 'set2');
     * $redis->sAdd('key1' , 'set3');   // 'key1' => {'set3', 'set1', 'set2'}
     * $redis->sRandMember('key1');     // 'set1', 'key1' => {'set3', 'set1', 'set2'}
     * $redis->sRandMember('key1');     // 'set3', 'key1' => {'set3', 'set1', 'set2'}
     * </pre>
     */
    public function sRandMember($key){
        $result = $this->handler->sRandMember($this->getCacheKey($key));
        return $this->string_to_value($result);
    }


    /**
     * 移除指定集合中的一个或多个值(最多移除5个)
     * 如需要移除超过5个则使用原生redis提供的sRem函数
     * @param   string  $key
     * @param   string  $member1
     * @param   string  $member2
     * @param   string  $member3
     * @param   string  $member4
     * @param   string  $member5
     * @return  int     The number of elements removed from the set.
     * @link    http://redis.io/commands/srem
     * @example
     * <pre>
     * var_dump( $redis->sAdd('k', 'v1', 'v2', 'v3') );    // int(3)
     * var_dump( $redis->sRem('k', 'v2', 'v3') );          // int(2)
     * var_dump( $redis->sMembers('k') );
     * //// Output:
     * // array(1) {
     * //   [0]=> string(2) "v1"
     * // }
     * </pre>
     */
    public function sRem($key,$member1,$member2=null,$member3=null,$member4=null,$member5=null){
        $params = func_get_args();
        $key = $this->getCacheKey($key);
        $rs = $this->handler->sRem($key,$this->value_to_string($member1));
        if (!$rs)return false;
        for ($i = 2;$i < count($params); $i++){
            $this->handler->sRem($key,$this->value_to_string($params[$i]));
        }
        return true;
    }



    /**
     * @see sRem()
     * @link    http://redis.io/commands/srem
     * @param   string  $key
     * @param   string  $member1
     * @param   string  $member2
     * @param   string  $member3
     * @param   string  $member4
     * @param   string  $member5
     */
    public function sRemove($key,$member1,$member2=null,$member3=null,$member4=null,$member5=null){
        $params = func_get_args();
        $key = $this->getCacheKey($key);
        $this->handler->sRemove($key,$this->value_to_string($member1));
        for ($i = 2;$i < count($params); $i++){
            $this->handler->sRemove($key,$this->value_to_string($params[$i]));
        }
    }


    /**
     * 以第一个集合为基础返回2-5个集合中的并集
     * 最多比对5个集合,如果需要比对多与5个集合则需要使用原生redis的sUnion函数
     * @param   string  $key1 Any number of keys corresponding to sets in redis.
     * @param   string  $key2 ...
     * @param   string  $key3 ...
     * @param   string  $key4 ...
     * @param   string  $key5 ...
     * @return  array   of strings: The union of all these sets.
     * @link    http://redis.io/commands/sunionstore
     * @example
     * <pre>
     * $redis->delete('s0', 's1', 's2');
     *
     * $redis->sAdd('s0', '1');
     * $redis->sAdd('s0', '2');
     * $redis->sAdd('s1', '3');
     * $redis->sAdd('s1', '1');
     * $redis->sAdd('s2', '3');
     * $redis->sAdd('s2', '4');
     *
     * var_dump($redis->sUnion('s0', 's1', 's2'));
     *
     * array(4) {
     * //  [0]=>
     * //  string(1) "3"
     * //  [1]=>
     * //  string(1) "4"
     * //  [2]=>
     * //  string(1) "1"
     * //  [3]=>
     * //  string(1) "2"
     * //}
     * </pre>
     */
    public function sUnion($key1,$key2,$key3=null,$key4=null,$key5=null){
        return $this->handler->sUnion($this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }


    /**
     *
     * 以第一个集合为基础返回2-5个集合中的并集并保存到指定集合
     * 最多比对5个集合,如果需要比对多与5个集合则需要使用原生redis的sUnion函数
     * @param   string  $destination  the key to store the diff into.
     * @param   string  $key1    Any number of keys corresponding to sets in redis.
     * @param   string  $key2    ...
     * @param   string  $key3    ...
     * @param   string  $key4    ...
     * @param   string  $key5    ...
     * @return  int     Any number of keys corresponding to sets in redis.
     * @link    http://redis.io/commands/sunionstore
     * @example
     * <pre>
     * $redis->delete('s0', 's1', 's2');
     *
     * $redis->sAdd('s0', '1');
     * $redis->sAdd('s0', '2');
     * $redis->sAdd('s1', '3');
     * $redis->sAdd('s1', '1');
     * $redis->sAdd('s2', '3');
     * $redis->sAdd('s2', '4');
     *
     * var_dump($redis->sUnionStore('dst', 's0', 's1', 's2'));
     * var_dump($redis->sMembers('dst'));
     *
     * //int(4)
     * //array(4) {
     * //  [0]=>
     * //  string(1) "3"
     * //  [1]=>
     * //  string(1) "4"
     * //  [2]=>
     * //  string(1) "1"
     * //  [3]=>
     * //  string(1) "2"
     * //}
     * </pre>
     */
    public function sUnionStore($destination,$key1,$key2=null,$key3=null,$key4=null,$key5=null){
        return $this->handler->sUnionStore($this->getCacheKey($destination),$this->getCacheKey($key1),$this->getCacheKey($key2),$this->getCacheKey($key3),$this->getCacheKey($key4),$this->getCacheKey($key5));
    }



    /**
     * 按照排序要求返回无序集合内容操作(尽量应用于值是数字的集合)
     *
     * @param   string  $key
     * @param   array   $option array(key => value, ...) - optional, with the following keys and values:
     * - 'by' => 'some_pattern_*',
     * - 'limit' => array(0, 1),
     * - 'get' => 'some_other_pattern_*' or an array of patterns,
     * - 'sort' => 'asc' or 'desc',
     * - 'alpha' => TRUE,
     * - 'store' => 'external-key'
     * @return  array
     * An array of values, or a number corresponding to the number of elements stored if that was used.
     * @link    http://redis.io/commands/sort
     * @example
     * <pre>
     * $redis->delete('s');
     * $redis->sadd('s', 5);
     * $redis->sadd('s', 4);
     * $redis->sadd('s', 2);
     * $redis->sadd('s', 1);
     * $redis->sadd('s', 3);
     *
     * var_dump($redis->sort('s')); // 1,2,3,4,5
     * var_dump($redis->sort('s', array('sort' => 'desc'))); // 5,4,3,2,1
     * var_dump($redis->sort('s', array('sort' => 'desc', 'store' => 'out'))); // (int)5
     * </pre>
     */
    public function sort($key,array $option = null){
        return $this->handler->sort($this->getCacheKey($key),$option);
    }



    /*---------------------------------------set函数 end-----------------------------------------*/
    /*---------------------------------------sorted set函数 start-----------------------------------------*/

    /**
     * 向有序集合中添加一个数据
     * @param string $key
     * @param float $score
     * @param string $member
     * @return int
     */
    public function zAdd($key,$score,$member){
        return $this->handler->zAdd($this->getCacheKey($key),$score,$this->value_to_string($member));
    }


    /**
     * 向有序集合中添加一个或多个数据,性能没有原生的zAdd好,如有需要请使用原生的zAdd
     * @param $key
     * @param $members
     * <pre>
     * $redis->zAdd('z', [[1,'v1'],[4,'v4'],[3,'v3'],] );
     *
     * </pre>
     */
    public function zMAdd($key,$members){
        $key = $this->getCacheKey($key);
        foreach ($members as $k => $member){
            if (!is_array($member) || count($member) !== 2)continue;
            $this->handler->zAdd($key,$member[0],$this->value_to_string($member[1]));
        }
    }


    /**
     * 返回指定有序集合的成员数
     *
     * @param   string  $key
     * @return  int     the set's cardinality
     * @link    http://redis.io/commands/zsize
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zCard('key');            // 3
     * </pre>
     */
    public function zCard($key){
        return $this->handler->zCard($this->getCacheKey($key));
    }


    /**
     * 根据索引范围返回复合要求的有序集合成员数量
     *
     * @param   string  $key
     * @param   string  $start
     * @param   string  $end
     * @return  int     the size of a corresponding zRangeByScore.
     * @link    http://redis.io/commands/zcount
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zCount('key', 0, 3); // 2, corresponding to array('val0', 'val2')
     * </pre>
     */
    public function zCount($key,$start,$end){
        return $this->handler->zCount($this->getCacheKey($key),$start,$end);
    }


    /**
     * Increments the score of a member from a sorted set by a given amount.
     * 将指定有序集合中的指定成员对应的score进行自增操作
     * @param   string  $key
     * @param   float   $increment (double) value that will be added to the member's score
     * @param   string  $member
     * @return  float   the new value
     * @link    http://redis.io/commands/zincrby
     * @example
     * <pre>
     * $redis->delete('key');
     * $redis->zIncrBy('key', 2.5, 'member1');  // key or member1 didn't exist, so member1's score is to 0
     *                                          // before the increment and now has the value 2.5
     * $redis->zIncrBy('key', 1, 'member1');    // 3.5
     * </pre>
     */
    public function zIncrBy($key,$increment,$member){
        return $this->handler->zIncrBy($this->getCacheKey($key),$increment,$this->value_to_string($member));
    }


    /**
     * Creates an intersection of sorted sets given in second argument.
     * The result of the union will be stored in the sorted set defined by the first argument.
     * The third optional argument defines weights to apply to the sorted sets in input.
     * In this case, the weights will be multiplied by the score of each element in the sorted set
     * before applying the aggregation. The forth argument defines the AGGREGATE option which
     * specify how the results of the union are aggregated.
     *
     * @param   string  $destination
     * @param   array   $zSetKeys
     * @param   array   $weights
     * @param   string  $aggregateFunction Either "SUM", "MIN", or "MAX":
     * defines the behaviour to use on duplicate entries during the zInter.
     * @return  int     The number of values in the new sorted set.
     * @link    http://redis.io/commands/zinterstore
     * @example
     * <pre>
     * $redis->delete('k1');
     * $redis->delete('k2');
     * $redis->delete('k3');
     *
     * $redis->delete('ko1');
     * $redis->delete('ko2');
     * $redis->delete('ko3');
     * $redis->delete('ko4');
     *
     * $redis->zAdd('k1', 0, 'val0');
     * $redis->zAdd('k1', 1, 'val1');
     * $redis->zAdd('k1', 3, 'val3');
     *
     * $redis->zAdd('k2', 2, 'val1');
     * $redis->zAdd('k2', 3, 'val3');
     *
     * $redis->zInter('ko1', array('k1', 'k2'));               // 2, 'ko1' => array('val1', 'val3')
     * $redis->zInter('ko2', array('k1', 'k2'), array(1, 1));  // 2, 'ko2' => array('val1', 'val3')
     *
     * // Weighted zInter
     * $redis->zInter('ko3', array('k1', 'k2'), array(1, 5), 'min'); // 2, 'ko3' => array('val1', 'val3')
     * $redis->zInter('ko4', array('k1', 'k2'), array(1, 5), 'max'); // 2, 'ko4' => array('val3', 'val1')
     * </pre>
     */
    public function zInter($destination,$zSetKeys,array $weights = null, $aggregateFunction = 'SUM'){
        $keys = [];
        foreach ($zSetKeys as $k => $v){
            $keys[] = $this->getCacheKey($v);
        }
        return $this->handler->zInter($this->getCacheKey($destination),$keys,$weights,$aggregateFunction);
    }


    /**
     * Returns a range of elements from the ordered set stored at the specified key,
     * with values in the range [start, end]. start and stop are interpreted as zero-based indices:
     * 0 the first element,
     * 1 the second ...
     * -1 the last element,
     * -2 the penultimate ...
     * 根据索引范围返回指定有序集合中的成员(按score升序排列)。索引的定义如下:
     * 0 第一个成员,
     * 1 第二个成员 ...
     * -1 倒数第一个成员,
     * -2 倒数第二个成员 ...
     * 如果$withScores为true则返回的结果包括该成员的score
     *
     * @param   string  $key
     * @param   int     $start
     * @param   int     $end
     * @param   bool    $withScores
     * @return  array   Array containing the values in specified range.
     * @link    http://redis.io/commands/zrange
     * @example
     * <pre>
     * $redis->zAdd('key1', 0, 'val0');
     * $redis->zAdd('key1', 2, 'val2');
     * $redis->zAdd('key1', 10, 'val10');
     * $redis->zRange('key1', 0, -1); // array('val0', 'val2', 'val10')
     * // with scores
     * $redis->zRange('key1', 0, -1, true); // array('val0' => 0, 'val2' => 2, 'val10' => 10)
     * </pre>
     */
    public function zRange($key,$start,$end,$withScores = false){
        $tmp = $this->handler->zRange($this->getCacheKey($key),$start,$end,$withScores);
        $result = [];
        if ($withScores === true){
            foreach ($tmp as $k => $value){
                $result[] = $this->string_to_value($value);
            }
        }else{
            foreach ($tmp as $k => $value){
                $result[$this->string_to_value($k)] = $value;
            }
        }
        return $result;
    }


    /**
     * 多功能有序集合数据查找函数
     * 返回指定有序集合按score升序排列符合score范围的成员
     *
     * zRevRangeByScore returns the same items in reverse order, when the start and end parameters are swapped.
     *
     * @param   string  $key
     * @param   int     $start 最小分数
     * @param   int     $end    最大分数
     * @param   array   $options Two options are available:
     *                      - withscores => TRUE,
     *                      - and limit => array($offset, $count)
     * @return  array   Array containing the values in specified range.
     * @link    http://redis.io/commands/zrangebyscore
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zRangeByScore('key', 0, 3);                                          // array('val0', 'val2')
     * $redis->zRangeByScore('key', 0, 3, array('withscores' => TRUE);              // array('val0' => 0, 'val2' => 2)
     * $redis->zRangeByScore('key', 0, 3, array('limit' => array(1, 1));                        // array('val2' => 2)
     * $redis->zRangeByScore('key', 0, 3, array('limit' => array(1, 1));                        // array('val2')
     * $redis->zRangeByScore('key', 0, 3, array('withscores' => TRUE, 'limit' => array(1, 1));  // array('val2' => 2)
     * </pre>
     */
    public function zRangeByScore($key,$start,$end,array $options = []){
        $tmp = $this->handler->zRangeByScore($this->getCacheKey($key),$start,$end,$options);
        $result = [];
        if (isset($options['withscores']) && $options['withscores'] === true){
            foreach ($tmp as $k => $value){
                $result[$this->string_to_value($k)] = $value;
            }
        }else{
            foreach ($tmp as $k => $value){
                $result[] = $this->string_to_value($value);
            }
        }
        return $result;
    }


    /**
     * Deletes a specified member from the ordered set.
     * 删除指定有序集合中指定的一个或多个(最多5个)指定的值
     * 如果需要删除多于5个值的话请使用原生redis的zRem函数
     *
     * @param   string  $key
     * @param   string  $member1
     * @param   string  $member2
     * @param   string  $member3
     * @param   string  $member4
     * @param   string  $member5
     * @return  int     Number of deleted values
     * @link    http://redis.io/commands/zrem
     * @example
     * <pre>
     * $redis->zAdd('z', 1, 'v2', 2, 'v2', 3, 'v3', 4, 'v4' );  // int(2)
     * $redis->zRem('z', 'v2', 'v3');                           // int(2)
     * var_dump( $redis->zRange('z', 0, -1) );
     * //// Output:
     * // array(2) {
     * //   [0]=> string(2) "v1"
     * //   [1]=> string(2) "v4"
     * // }
     * </pre>
     */
    public function zRem($key,$member1,$member2=null,$member3=null,$member4=null,$member5=null){
        return $this->handler->zRem($this->getCacheKey($key),$this->value_to_string($member1),$this->value_to_string($member2),$this->value_to_string($member3),$this->value_to_string($member4),$this->value_to_string($member5));
    }


    /**
     * @see zRem()
     * @param   string  $key
     * @param   string  $member1
     * @param   string  $member2
     * @param   string  $member3
     * @param   string  $member4
     * @param   string  $member5
     * @return  int     Number of deleted values
     * @link    http://redis.io/commands/zrem
     */
    public function zDelete($key,$member1,$member2=null,$member3=null,$member4=null,$member5=null){
        $this->handler->zDelete($this->getCacheKey($key),$this->value_to_string($member1),$this->value_to_string($member2),$this->value_to_string($member3),$this->value_to_string($member4),$this->value_to_string($member5));
    }

    /**
     * 删除指定有序集合中指定的一个或多个指定的值,性能比原生的zRem函数差,如有需求请使用原生的zRem函数
     * @param $key
     * @param array $members
     */
    public function zMRem($key,array $members){
        $key = $this->getCacheKey($key);
        foreach ($members as $k => $member){
            $this->handler->zRem($key,$this->value_to_string($member));
        }
    }

    /**
     * @see zMRem()
     * @param $key
     * @param array $members
     */
    public function zMDelete($key,array $members){
        $key = $this->getCacheKey($key);
        foreach ($members as $k => $member){
            $this->handler->zDelete($key,$this->value_to_string($member));
        }
    }



    /**
     * Returns the elements of the sorted set stored at the specified key in the range [start, end]
     * in reverse order. start and stop are interpretated as zero-based indices:
     * 0 the first element,
     * 1 the second ...
     * -1 the last element,
     * -2 the penultimate ...
     * 根据索引范围返回指定有序集合中的成员(按score降序排列)。索引的定义如下:
     * 0 第一个成员,
     * 1 第二个成员 ...
     * -1 倒数第一个成员,
     * -2 倒数第二个成员 ...
     * 如果$withScores为true则返回的结果包括该成员的score
     *
     * @param   string  $key
     * @param   int     $start
     * @param   int     $end
     * @param   bool    $withScores
     * @return  array   Array containing the values in specified range.
     * @link    http://redis.io/commands/zrevrange
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zRevRange('key', 0, -1); // array('val10', 'val2', 'val0')
     *
     * // with scores
     * $redis->zRevRange('key', 0, -1, true); // array('val10' => 10, 'val2' => 2, 'val0' => 0)
     * </pre>
     */
    public function zRevRange($key, $start, $end, $withScores = null){
        $tmp = $this->handler->zRevRange($this->getCacheKey($key),$start,$end,$withScores);
        $result = [];
        if ($withScores === true){
            foreach ($tmp as $k => $value){
                $result[] = $this->string_to_value($value);
            }
        }else{
            foreach ($tmp as $k => $value){
                $result[$this->string_to_value($k)] = $value;
            }
        }
        return $result;
    }


    /**
     * Returns the elements of the sorted set stored at the specified key which have scores in the
     * range [start,end]. Adding a parenthesis before start or end excludes it from the range.
     * +inf and -inf are also valid limits.
     *
     * zRevRangeByScore returns the same items in reverse order, when the start and end parameters are swapped.
     * 返回指定有序集合按score降序排列符合score范围的成员
     *
     * @param   string  $key
     * @param   int     $end    分数最大值
     * @param   int     $start  分数最小值
     * @param   array   $options Two options are available:
     *                      - withscores => TRUE,
     *                      - and limit => array($offset, $count)
     * @return  array   Array containing the values in specified range.
     * @link    http://redis.io/commands/zrangebyscore
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zRangeByScore('key', 0, 3);                                          // array('val0', 'val2')
     * $redis->zRangeByScore('key', 0, 3, array('withscores' => TRUE);              // array('val0' => 0, 'val2' => 2)
     * $redis->zRangeByScore('key', 0, 3, array('limit' => array(1, 1));                        // array('val2' => 2)
     * $redis->zRangeByScore('key', 0, 3, array('limit' => array(1, 1));                        // array('val2')
     * $redis->zRangeByScore('key', 0, 3, array('withscores' => TRUE, 'limit' => array(1, 1));  // array('val2' => 2)
     * </pre>
     */
    public function zRevRangeByScore($key, $end, $start, array $options = array()){
        $tmp = $this->handler->zRevRangeByScore($this->getCacheKey($key),$end,$start,$options);
        $result = [];
        if (isset($options['withscores']) && $options['withscores'] === true){
            foreach ($tmp as $k => $value){
                $result[$this->string_to_value($k)] = $value;
            }
        }else{
            foreach ($tmp as $k => $value){
                $result[] = $this->string_to_value($value);
            }
        }
        return $result;
    }


    /**
     * Deletes the elements of the sorted set stored at the specified key which have scores in the range [start,end].
     * 根据score范围移除指定有序集合中符合条件的成员
     *
     * @param   string          $key
     * @param   float|string    $start double or "+inf" or "-inf" string
     * @param   float|string    $end double or "+inf" or "-inf" string
     * @return  int             The number of values deleted from the sorted set
     * @link    http://redis.io/commands/zremrangebyscore
     * @example
     * <pre>
     * $redis->zAdd('key', 0, 'val0');
     * $redis->zAdd('key', 2, 'val2');
     * $redis->zAdd('key', 10, 'val10');
     * $redis->zRemRangeByScore('key', 0, 3); // 2
     * </pre>
     */
    public function zRemRangeByScore($key,$start,$end){
        return $this->handler->zRemRangeByScore($this->getCacheKey($key),$start,$end);
    }


    /**
     * @see zRemRangeByScore()
     * @param string    $key
     * @param float     $start
     * @param float     $end
     */
    public function zDeleteRangeByScore($key,$start,$end){
        $this->handler->zDeleteRangeByScore($this->getCacheKey($key),$start,$end);
    }


    /**
     * Deletes the elements of the sorted set stored at the specified key which have rank in the range [start,end].
     *根据索引范围移除指定有序集合中符合条件的成员
     * @param   string  $key
     * @param   int     $start
     * @param   int     $end
     * @return  int     The number of values deleted from the sorted set
     * @link    http://redis.io/commands/zremrangebyrank
     * @example
     * <pre>
     * $redis->zAdd('key', 1, 'one');
     * $redis->zAdd('key', 2, 'two');
     * $redis->zAdd('key', 3, 'three');
     * $redis->zRemRangeByRank('key', 0, 1); // 2
     * $redis->zRange('key', 0, -1, array('withscores' => TRUE)); // array('three' => 3)
     * </pre>
     */
    public function zRemRangeByRank($key,$start,$end){
        return $this->handler->zRemRangeByRank($this->getCacheKey($key),$start,$end);
    }


    /**
     * @see zRemRangeByRank()
     * @param   string  $key
     * @param   int     $start
     * @param   int     $end
     * @link    http://redis.io/commands/zremrangebyscore
     */
    public function zDeleteRangeByRank($key,$start,$end){
        $this->handler->zDeleteRangeByRank($this->getCacheKey($key),$start,$end);
    }


    /**
     * @see zCard()
     * @param string $key
     */
    public function zSize($key){
        return $this->handler->zSize($this->getCacheKey($key));
    }

    /**
     * Returns the score of a given member in the specified sorted set.
     * 返回指定有序集合指定的成员的score
     * @param   string  $key
     * @param   string  $member
     * @return  float
     * @link    http://redis.io/commands/zscore
     * @example
     * <pre>
     * $redis->zAdd('key', 2.5, 'val2');
     * $redis->zScore('key', 'val2'); // 2.5
     * </pre>
     */
    public function zScore($key,$member){
        return $this->handler->zScore($this->getCacheKey($key),$this->value_to_string($member));
    }


    /**
     * Returns the rank of a given member in the specified sorted set, starting at 0 for the item
     * with the smallest score. zRevRank starts at 0 for the item with the largest score.
     * 根据score升序排列返回指定有序集合指定的成员的索引
     * @param   string  $key
     * @param   string  $member
     * @return  int     the item's score.
     * @link    http://redis.io/commands/zrank
     * @example
     * <pre>
     * $redis->delete('z');
     * $redis->zAdd('key', 1, 'one');
     * $redis->zAdd('key', 2, 'two');
     * $redis->zRank('key', 'one');     // 0
     * $redis->zRank('key', 'two');     // 1
     * $redis->zRevRank('key', 'one');  // 1
     * $redis->zRevRank('key', 'two');  // 0
     * </pre>
     */
    public function zRank($key,$member){
        return $this->handler->zRank($this->getCacheKey($key),$this->value_to_string($member));
    }


    /**
     * Returns the rank of a given member in the specified sorted set, starting at 0 for the item
     * with the smallest score. zRevRank starts at 0 for the item with the largest score.
     * 根据score降序排列返回指定有序集合指定的成员的索引
     * @param   string  $key
     * @param   string  $member
     * @return  int     the item's score.
     * @link    http://redis.io/commands/zrank
     * @example
     * <pre>
     * $redis->delete('z');
     * $redis->zAdd('key', 1, 'one');
     * $redis->zAdd('key', 2, 'two');
     * $redis->zRank('key', 'one');     // 0
     * $redis->zRank('key', 'two');     // 1
     * $redis->zRevRank('key', 'one');  // 1
     * $redis->zRevRank('key', 'two');  // 0
     * </pre>
     */
    public function zRevRank($key,$member){
        return $this->handler->zRevRank($this->getCacheKey($key),$this->value_to_string($member));
    }


    /**
     * Creates an union of sorted sets given in second argument.
     * The result of the union will be stored in the sorted set defined by the first argument.
     * The third optionnel argument defines weights to apply to the sorted sets in input.
     * In this case, the weights will be multiplied by the score of each element in the sorted set
     * before applying the aggregation. The forth argument defines the AGGREGATE option which
     * specify how the results of the union are aggregated.
     *
     * @param string    $destination
     * @param array     $keys
     * @param array     $weights
     * @param string    $aggregateFunction  Either "SUM", "MIN", or "MAX": defines the behaviour to use on
     * duplicate entries during the zUnion.
     * @return int The number of values in the new sorted set.
     * @link    http://redis.io/commands/zunionstore
     * @example
     * <pre>
     * $redis->delete('k1');
     * $redis->delete('k2');
     * $redis->delete('k3');
     * $redis->delete('ko1');
     * $redis->delete('ko2');
     * $redis->delete('ko3');
     *
     * $redis->zAdd('k1', 0, 'val0');
     * $redis->zAdd('k1', 1, 'val1');
     *
     * $redis->zAdd('k2', 2, 'val2');
     * $redis->zAdd('k2', 3, 'val3');
     *
     * $redis->zUnion('ko1', array('k1', 'k2')); // 4, 'ko1' => array('val0', 'val1', 'val2', 'val3')
     *
     * // Weighted zUnion
     * $redis->zUnion('ko2', array('k1', 'k2'), array(1, 1)); // 4, 'ko2' => array('val0', 'val1', 'val2', 'val3')
     * $redis->zUnion('ko3', array('k1', 'k2'), array(5, 1)); // 4, 'ko3' => array('val0', 'val2', 'val3', 'val1')
     * </pre>
     */
    public function zUnion($destination,$keys,array $weights = null,$aggregateFunction = 'SUM'){
        $tmp_keys = [];
        foreach ($keys as $key){
            $tmp_keys[] = $this->getCacheKey($key);
        }
        return $this->handler->zUnion($this->getCacheKey($destination),$tmp_keys,$weights,$aggregateFunction);
    }

    /*---------------------------------------sorted set函数 end-----------------------------------------*/
    /*---------------------------------------其他函数 start-----------------------------------------*/

    /**
     * 清除当前数据库中的所有数据
     * @return bool
     */
    public function flushDB(){
        return $this->handler->flushDB();
    }


    /**
     * 清除所有数据库中的数据
     * @return bool
     */
    public function flushAll(){
        return $this->handler->flushAll();
    }


    /**
     * 返回当前数据库中key的数量
     * @return int
     */
    public function dbSize(){
        return $this->handler->dbSize();
    }


    public function ping(){
        return $this->handler->ping();
    }

    /*---------------------------------------其他函数 end-----------------------------------------*/





































    /*---------------------------------------工具函数start-------------------------------------------------*/

    /**
     * 将特殊数据结构解析成字符串
     * @param $value
     * @return mixed
     */
    protected function value_to_string($value){
        return (is_object($value) || is_array($value))?json_encode($value,JSON_UNESCAPED_UNICODE):$value;
    }


    /**
     * 将json字符串转换为数组,如果是的话
     * @param $str
     * @return mixed
     */
    protected function string_to_value($str){
        $tmp = json_decode($str,true);
        return empty($tmp)?$str:$tmp;
    }

    /**
     * 获取实际的缓存标识
     * @access public
     * @param string $name 缓存名
     * @return string
     */
    protected function getCacheKey($name)
    {
        if (empty($name))return null;
        if (!empty($this->options['prefix']) && strpos($name,$this->options['prefix']) === 0)return $name;
        return $this->options['prefix'] . $name;
    }


    /*---------------------------------------工具函数end-------------------------------------------------*/



}
