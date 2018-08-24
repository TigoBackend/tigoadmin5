<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/6/19
 * Time: 10:51
 */

namespace task\common\lib\wx;


use think\RedisCache;
use Waters\WebChatApi\Business\InterfaceWxApiForTP5;

class InterfaceWxApi extends InterfaceWxApiForTP5
{
    protected $app_id = '';

    protected $can_redis = false;

    protected $cache_key_access_token = self::CACHE_KEY_ACCESS_TOKEN;

    protected $cache_key_js_api_ticket = self::CACHE_KEY_JS_API_TICKET;


    /**
     * 构造函数
     * InterfaceWxApi constructor.
     * @param string $app_id
     */
    public function __construct($app_id = '')
    {
        if ($app_id) $this->app_id = $app_id;
        try{
            if (RedisCache::connect()->ping()) $this->can_redis = true;
        }catch (\Exception $e){
            $this->can_redis = false;
        }
    }

    /**
     * 获取缓存中的access_token(如果无需缓存access_token或缓存已经过期则返回null或空字符串)
     * @return mixed|null|string
     */
    public function get_cache_access_token()
    {
        return $this->get_cache(self::CACHE_KEY_ACCESS_TOKEN,$this->app_id);
    }


    /**
     * 缓存微信服务器中获取的普通access_token
     * @param array $result 微信服务器中获取到的access_token信息例如:array("access_token"=>"ACCESS_TOKEN","expires_in"=>7200)
     * @return bool
     */
    public function cache_access_token($result)
    {
        if (isset($result['access_token']) && $result['access_token'] && isset($result['expires_in']) && $result['expires_in']){
            $expires_in = $result['expires_in'] - 200;
            $expires_in = $expires_in > 0 ? $expires_in:3600;
            return $this->cache(self::CACHE_KEY_ACCESS_TOKEN,$result['access_token'],$expires_in,$this->app_id);
        }else{
            return false;
        }
    }

    /**
     * 获取缓存中的网页授权access_token(如果无需缓存access_token或缓存已经过期则返回null或空字符串)
     * 返回null或空字符串则微信api则直接调用微信接口获取网页授权access_token
     * @return string|null
     */
    public function get_cache_auth_access_token()
    {
        return parent::get_cache_auth_access_token();
    }


    /**
     * 缓存网页授权access_token(与普通access_token不同缓存时请别搞混)
     * @param array $result 微信服务器中获取到的网页授权access_token信息例如array("access_token"=>"ACCESS_TOKEN","expires_in"=>7200,"refresh_token"=>"REFRESH_TOKEN","openid"=>"OPENID","scope"=>"SCOPE")
     * @return mixed
     */
    public function cache_auth_access_token($result)
    {
        return parent::cache_auth_access_token($result);
    }



    /**
     * 缓存网页授权refresh_token
     * @param array $result 微信服务器中获取到的网页授权access_token信息例如array("access_token"=>"ACCESS_TOKEN","expires_in"=>7200,"refresh_token"=>"REFRESH_TOKEN","openid"=>"OPENID","scope"=>"SCOPE")
     * @return mixed
     */
    public function cache_auth_refresh_token($result)
    {
        return parent::cache_auth_refresh_token($result);
    }



    /**
     * 获取缓存中的网页授权refresh_token如果有的话
     * @return string|null
     */
    public function get_cache_auth_refresh_token()
    {
        return parent::get_cache_auth_refresh_token();
    }


    /**
     * 获取缓存中的jsapi ticket
     * @return array|mixed
     */
    public function get_cache_js_api_ticket()
    {
        return $this->get_cache(self::CACHE_KEY_JS_API_TICKET,$this->app_id);
    }


    /**
     * 缓存jsapi ticket
     * @param array $result js_api_ticket 结构为['errcode'=>0,'errmsg'=>'ok','ticket'=>"bxLdikRXVbTPdHSM05e5u5sUoXNKd8-41ZO3MhKoyN5OfkWITDGgnr2fwJ0m9E8NYzWKVZvdVtaUgWvsdshFKA",'expires_in'=>7200]
     * @return bool|mixed
     */
    public function cache_js_api_ticket($result)
    {
        if (isset($result['errcode']) && $result['errcode'] == 0 && isset($result['ticket']) && $result['ticket'] && isset($result['expires_in']) && $result['expires_in']){
            $expires_in = $result['expires_in'] - 200;
            $expires_in = $expires_in > 0 ? $expires_in : 3600;
            $this->cache(self::CACHE_KEY_JS_API_TICKET,$result['ticket'],$expires_in,$this->app_id);
        }
        return false;
    }


    /**
     * 记录日志
     * @param string $msg
     * @param null $log_path
     */
    public function log($msg, $log_path = null)
    {
        add_log($msg,$log_path);
    }


    /**
     * 结合redis缓存微信信息
     * @param $key
     * @param array $value
     * @param int $expire
     * @param string $prefix
     * @return bool
     */
    private function cache($key,$value = [],$expire = 70,$prefix = ''){
        if (empty($key)) return false;
        if ($this->can_redis && $value){
            return RedisCache::connect()->set("{$key}{$prefix}",$value,$expire);
        }else{
            return $this->file_cache($key,$value,$expire,$prefix);
        }
    }


    /**
     * 结合redis获取指定微信缓存
     * @param $key
     * @param string $prefix
     * @return array|mixed
     */
    private function get_cache($key,$prefix = ''){
        if (empty($key)) return [];
        if ($this->can_redis){
//            dump("interface get cache:{$key}{$prefix}");
            return RedisCache::connect()->get("{$key}{$prefix}",[]);
        }else{
            return $this->get_file_cache($key,$prefix);
        }
    }




}