<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/12/4
 * Time: 1:11
 */

namespace think;


use think\cache\driver\Redis;

class RedisCache
{

    protected static $instance = [];


    protected static $handler;


    protected static $options = [
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
     * 连接缓存获取TP5自带的redis实例
     * @param array $options    配置数组
     * @param bool $name        缓存连接标识 true 强制重新连接
     * @return Redis            tp5自带Redis实例
     */
    public static function connect(array $options = [],$name = false){
        $options = array_merge(Config::get('redis_config'),$options);
        if (false === $name) {
            $name = md5(serialize($options));
        }
        $type = 'Redis';
        if (true === $name || !isset(self::$instance[$name])) {
            $class = false !== strpos($type, '\\') ? $type : '\\think\\cache\\driver\\' . ucwords($type);

            // 记录初始化信息
            App::$debug && Log::record('[ CACHE ] INIT ' . $type, 'info');
            if (true === $name) {
                return new $class($options);
            } else {
                self::$instance[$name] = new $class($options);
            }
        }
        return self::$instance[$name];

    }


    /**
     * 直接实例化一个原生Redis实例
     * @param array $options
     * @return \Redis
     */
    public static function get_redis($options=[]){
        $default_config = [
            'host'       => '127.0.0.1',
            'port'       => 6379,
            'password'   => '',
            'select'     => 0,
            'timeout'    => 0,
            'persistent' => false,
        ];
        if (!extension_loaded('redis')) {
            throw new \BadFunctionCallException('not support: redis');
        }
        $options = array_merge($default_config,Config::get('redis_config'), $options);
        $func          = $options['persistent'] ? 'pconnect' : 'connect';
        $redis = new \Redis();
        $redis->$func($options['host'], $options['port'], $options['timeout']);

        if ('' != $options['password']) {
            $redis->auth($options['password']);
        }

        if (0 != $options['select']) {
            $redis->select($options['select']);
        }

        return $redis;
    }


}