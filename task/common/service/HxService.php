<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/3/22
 * Time: 10:02
 */

namespace task\common\service;


use think\RedisCache;
use Waters\hx\business\HxListener;
use Waters\hx\helper\HxClient;
vendor('waters.hx.index');
class HxService implements HxListener
{

    const CACHE_PREFIX = 'HX';

    const CACHE_KEY_TOKEN = 'hx_access_token';


    private $log_path = 'public/log/hx/';

    /**
     * @var HxClient
     */
    private $client;

    /*是否可使用redis缓存*/
    protected $can_redis = false;
    /*是否可使用环信*/
    protected $can_hx = true;

    public function __construct()
    {
        /*初始化环信实例*/
        try{
            $this->client = new HxClient(config('hx_config'),$this);
        }catch (\Exception $e){
            $this->can_hx = false;
        }
        /*初始化redis标识*/
        try{
            if (RedisCache::connect()->ping()) $this->can_redis = true;
        }catch (\Exception $e){
            $this->can_redis = false;
        }
    }

    /**
     * 缓存中获取环信access token
     * @return mixed|string
     */
    public function get_cache_token()
    {
        if ($this->can_redis){
            $access_token = RedisCache::connect()->get(self::CACHE_KEY_TOKEN,'');
            if (empty($access_token)) $access_token = get_file_cache(self::CACHE_KEY_TOKEN,self::CACHE_PREFIX);
        }else{
            $access_token = get_file_cache(self::CACHE_KEY_TOKEN,self::CACHE_PREFIX);
        }
        return $access_token;
    }


    /**
     * 缓存环信access_token
     * @param array $result
     * @return bool
     */
    public function cache_token($result)
    {
        if (isset($result['expires_in']) && isset($result['access_token'])){
            $expires_in = $result['expires_in'] > 600 ? $result['expires_in'] - 600 : 600;
            if ($this->can_redis){
                RedisCache::connect()->set(self::CACHE_KEY_TOKEN,$result['access_token'],$expires_in);
                file_cache(self::CACHE_KEY_TOKEN,$result['access_token'],$expires_in,self::CACHE_PREFIX);
            }else{
                file_cache(self::CACHE_KEY_TOKEN,$result['access_token'],$expires_in,self::CACHE_PREFIX);
            }
        }
        return true;
    }

    /**
     * 记录日志
     * @param $msg
     * @return mixed|void
     */
    public function error_log($msg)
    {
        add_log($msg,$this->log_path);
    }


    /**
     * 注册环信账号
     * @param $user_name
     * @param $password
     * @param null $nickname
     * @return bool
     * @throws \Waters\hx\Exception\HxException
     */
    public function register($user_name,$password,$nickname=null){
        if (!$this->can_hx) return false;
        $res = $this->client->get_user_status($user_name);
        if ($res['status']) return false;
        $info = $this->client->create_user($user_name,$password,$nickname);
        if (!$info['status']){
            $this->error_log(json_encode($info));
            return false;
        }
        return true;
    }


    /**
     * 强制注册环信账号
     * @param $user_name
     * @param $password
     * @param null $nickname
     * @return bool
     * @throws \Waters\hx\Exception\HxException
     */
    public function register_force($user_name,$password,$nickname=null){
        if (!$this->can_hx) return false;
        $res = $this->client->get_user_status($user_name);
        /*强制移除旧用户*/
        if ($res['status']) $this->client->drop_user($user_name);
        /*创建新用户*/
        $info = $this->client->create_user($user_name,$password,$nickname);
        if (!$info['status']){
            $this->error_log(json_encode($info));
            return false;
        }
        return true;
    }


    /**
     * 获取环信access_token
     * @return string
     */
    public function get_access_token(){
        if (!$this->can_hx) return '';
        return $this->client->get_token();
    }


    /**
     * 根据用户类型查找对应的好友列表
     * @param $user_name
     * @return array
     * @throws \Waters\hx\Exception\HxException
     */
    public function get_friends($user_name){
        if (!$this->can_hx) return [];
        $friend_list = $this->client->friends_list($user_name);
        if (!isset($friend_list['status']) || !$friend_list['status'] || !isset($friend_list['result']['data'])) return [];
        $friend_list = $friend_list['result']['data'];
        return $friend_list;
    }


    /**
     * 绑定用户好友
     * @param $user_name
     * @param $friend_name
     * @return array|bool
     * @throws \Waters\hx\Exception\HxException
     */
    public function bind_friends($user_name,$friend_name){
        if (!$this->can_hx) return false;
        return $this->client->bind_friends($user_name,$friend_name);
    }


    /**
     * 发送聊天消息
     * @param $from_user_name
     * @param array $target
     * @param $target_type
     * @param $msg
     * @return array|bool
     * @throws \Waters\hx\Exception\HxException
     */
    public function msg_text_send($from_user_name,array $target,$target_type,$msg){
        if (!$this->can_hx) return false;
        return $this->client->msg_text_send($from_user_name,$target,$target_type,$msg);
    }


    /**
     * 指定用户离线消息数量
     * @param $user_name
     * @return array|bool
     * @throws \Waters\hx\Exception\HxException
     */
    public function get_off_line_msg_count($user_name){
        if (!$this->can_hx) return false;
        return $this->client->get_offline_msg_count($user_name);
    }






}