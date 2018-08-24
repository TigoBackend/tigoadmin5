<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 10:16
 */

namespace Waters\hx\helper;


use Waters\hx\business\HxListener;
use Waters\hx\Exception\HxException;
use Waters\hx\http\HxRequest;

class HxClient
{

    private $request;
    private $client_id;
    private $client_secret;
    private $org_name;
    private $app_name;
    private $interface;


    const HX_API_TOKEN = "token/";

    const HX_API_USERS = "users/";

    const HX_API_MESSAGE = "messages/";

    const HX_API_UPLOAD = "chatfiles/";


    /*信息对象类型-用户*/
    const HX_TARGET_TYPE_USERS = 'users';
    /*信息对象类型-群*/
    const HX_TARGET_TYPE_GROUPS = 'chatgroups';
    /*信息对象类型-聊天室*/
    const HX_TARGET_TYPE_ROOMS = 'chatrooms';


    /**
     * 构造
     * HxClient constructor.
     * @param $option
     * @param HxListener $interface
     * @throws \Waters\hx\Exception\HxException
     */
    public function __construct($option, HxListener $interface = null)
    {
        hx_check_params($option, ['client_id', 'client_secret', 'org_name', 'app_name']);
        $this->client_id = $option['client_id'];
        $this->client_secret = $option['client_secret'];
        $this->org_name = $option['org_name'];
        $this->app_name = $option['app_name'];
        $this->request = HxRequest::get_instance($option);
        $this->interface = $interface;
    }


    /**
     * 获取环信token
     * @return string
     */
    public function get_token()
    {
        $token = '';
        if ($this->interface) $token = $this->interface->get_cache_token();
        if (!$token) {
            $body = [
                "grant_type" => "client_credentials",
                "client_id" => $this->client_id,
                "client_secret" => $this->client_secret
            ];
            $header = [
                'Content-Type:application/json',
            ];
            $result = $this->request->curl(self::HX_API_TOKEN, $body, $header);
            if (isset($result['status']) && $result['status']) {
                if ($this->interface) $this->interface->cache_token($result['result']);
                $token = $result['result']['access_token'];
            } elseif ($this->interface) {
                $this->interface->error_log($result['error_info']);
            }
        }
        return $token;
    }


    /**
     * 注册单个用户
     * @param $user_name
     * @param $pwd
     * @param $nick_name
     * @return array
     * @throws HxException
     */
    public function create_user($user_name, $pwd, $nick_name = null)
    {
        $body = [
            'username' => $user_name,
            'password' => $pwd
        ];
        if ($nick_name) $body['nickname'] = $nick_name;
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        return $this->request->curl(self::HX_API_USERS, $body, $header);
    }


    /**
     * 批量注册用户
     * @param array $users
     * @return array
     * @throws HxException
     */
    public function create_users(array $users)
    {
        foreach ($users as $k => $user) {
            hx_check_params($user, ['username', 'password', 'nickname']);
        }
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        return $this->request->curl(self::HX_API_USERS, $users, $header);
    }


    /**
     * 重置用户密码
     * @param $username
     * @param $password
     * @return array
     * @throws HxException
     */
    public function reset_password($username,$password){
        hx_check_params(['username'=>$username,'password'=>$password],['username','password']);
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/password";
        $body = ['newpassword'=>$password];
        return $this->request->curl($api,$body,$header,HxRequest::HX_REQUEST_PUT);
    }


    /**
     * 重置用户昵称
     * @param $username
     * @param $nickname
     * @return array
     * @throws HxException
     */
    public function reset_nickname($username,$nickname){
        hx_check_params(['username'=>$username,'nickname'=>$nickname],['username','nickname']);
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS.$username;
        $body = ['nickname'=>$nickname];
        return $this->request->curl($api,$body,$header,HxRequest::HX_REQUEST_PUT);
    }



    /**
     * 获取用户信息
     * @param $username
     * @return array
     * @throws HxException
     */
    public function get_user($username)
    {
        hx_check_params($username);
        $api = self::HX_API_USERS . $username;
        $this->get_request_option($token, $header);
        return $this->request->curl($api, '', $header, HxRequest::HX_REQUEST_GET);
    }


    /**
     * 批量分页获取用户列表
     * @param int $page_size
     * @param null $cursor
     * @return array
     * @throws HxException
     */
    public function get_users($page_size = 0, $cursor = null)
    {
        $api = self::HX_API_USERS;
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        if ($page_size) $params['limit'] = $page_size;
        if ($cursor) $params['cursor'] = $cursor;
        if (isset($params) && $params) {
            $params = http_build_query($params);
            $api .= "?{$params}";
        }
        return $this->request->curl($api, '', $header, HxRequest::HX_REQUEST_GET);
    }


    /**
     * 删除单个用户
     * @param $username
     * @return array
     * @throws HxException
     */
    public function drop_user($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS.$username;
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_DELETE);
    }


    /**
     * 批量删除指定数量用户
     * @param int $limit
     * @return array
     * @throws HxException
     */
    public function drop_users($limit = 0){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS;
        if ($limit) $api .= "?limit={$limit}";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_DELETE);
    }


    /**
     * 绑定好友
     * @param $username
     * @param $friend_name
     * @return array
     * @throws HxException
     */
    public function bind_friends($username,$friend_name){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/contacts/users/{$friend_name}";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 解绑好友关系
     * @param $username
     * @param $friend_name
     * @return array
     * @throws HxException
     */
    public function unbind_friends($username,$friend_name){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/contacts/users/{$friend_name}";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_DELETE);
    }


    /**
     * 好友列表
     * @param $username
     * @return array
     * @throws HxException
     */
    public function friends_list($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/contacts/users";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }


    /**
     * 用户黑名单列表
     * @param $username
     * @return array
     * @throws HxException
     */
    public function blocks_list($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/blocks/users";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }



    /**
     * 添加黑名单
     * @param $username
     * @param array $blocks_list
     * @return array
     * @throws HxException
     */
    public function bind_blocks($username,array $blocks_list){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/blocks/users";
        $body = [
            'usernames'=>$blocks_list
        ];
        return $this->request->curl($api,$body,$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 移除黑名单
     * @param $username
     * @param $block_name
     * @return array
     * @throws HxException
     */
    public function unbind_blocks($username,$block_name){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/blocks/users/{$block_name}";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_DELETE);
    }


    /**
     * 查询用户在线状态
     * @param $username
     * @return array
     * @throws HxException
     */
    public function get_user_status($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/status";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }


    /**
     * 查找用户离线消息数
     * @param $username
     * @return array
     * @throws HxException
     */
    public function get_offline_msg_count($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/offline_msg_count";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }


    /**
     * 离线消息状态
     * @param $username
     * @param $msg_id
     * @return array
     * @throws HxException
     */
    public function get_offline_msg_status($username,$msg_id){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/offline_msg_status/{$msg_id}";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }


    /**
     * 禁用用户
     * @param $username
     * @return array
     * @throws HxException
     */
    public function user_deactivate($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/deactivate";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 用户解禁
     * @param $username
     * @return array
     * @throws HxException
     */
    public function user_activate($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/activate";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 强制用户下线
     * @param $username
     * @return array
     * @throws HxException
     */
    public function user_disconnect($username){
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_USERS."{$username}/disconnect";
        return $this->request->curl($api,'',$header,HxRequest::HX_REQUEST_GET);
    }


    /**
     * 发送文本消息
     * @param string $from_name    发送者
     * @param array $target         接收者数组
     * @param string $target_type          接收者类型
     * @param string $msg           消息内容
     * @return array
     * @throws HxException
     */
    public function msg_text_send($from_name = '',array $target,$target_type,$msg){
        hx_check_params(['from_name'=>$from_name,'target_name'=>$target,'msg'=>$msg],['from_name','target_name','msg']);
        if (!in_array(strtolower($target_type),[self::HX_TARGET_TYPE_USERS,self::HX_TARGET_TYPE_GROUPS,self::HX_TARGET_TYPE_ROOMS])) throw new HxException('target_type error');
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_MESSAGE;
        $body = [
            'target_type'=>strtolower($target_type),
            'target'=>$target,
            'msg'=>[
                'type'=>'txt',
                'msg'=>$msg
            ],
            'from'=>$from_name ? $from_name : 'admin'
        ];
        return $this->request->curl($api,$body,$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 发送图片消息
     * @param $from_name
     * @param array $target
     * @param $target_type
     * @param $file_path
     * @return array
     * @throws HxException
     */
    public function msg_img_send($from_name,array $target,$target_type,$file_path){
        hx_check_params(['from_name'=>$from_name,'target'=>$target,'file_path'=>$file_path,'target_type'=>$target_type],['from_name','target','file_path','target_type']);
        if (!in_array(strtolower($target_type),[self::HX_TARGET_TYPE_USERS,self::HX_TARGET_TYPE_GROUPS,self::HX_TARGET_TYPE_ROOMS])) throw new HxException('target_type error');
        $result = $this->upload($file_path);
        if (!isset($result['status']) && !$result['status']) throw new HxException('upload fail');
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $api = self::HX_API_MESSAGE;
        if (is_file($file_path)){
            $file_info = pathinfo($file_path);
            $filename = $file_info['basename'];
            $image_size = getimagesize($file_path);
            $width = $image_size[0];
            $height = $image_size[1];
        }else{
            $filename = $this->get_nonce_str(5).".jpg";
            $width = 480;
            $height = 720;
        }
        $body = [
            'target_type'=>strtolower($target_type),
            'target'=>$target,
            'msg'=>[
                'type'=>'img',
                'url'=>$result['result']['entities'][0]['uuid'],
                'filename'=>$filename,
                'secret'=>$result['result']['entities'][0]['share-secret'],
                'size'=>[
                    'width'=>$width,
                    'height'=>$height
                ]
            ],
            'from'=>$from_name ? $from_name : 'admin'
        ];
        return $this->request->curl($api,$body,$header,HxRequest::HX_REQUEST_POST);
    }


    /**
     * 透传消息
     * @param string $from_name
     * @param array $target
     * @param $target_type
     * @param $data
     * @return array
     * @throws HxException
     */
    public function msg_ext_send($from_name = 'admin',array $target,$target_type, $data){
        hx_check_params(['from_name'=>$from_name,'target'=>$target,'target_type'=>$target_type,'data'=>$data],['from_name','target','target_type','data']);
        if (!in_array(strtolower($target_type),[self::HX_TARGET_TYPE_USERS,self::HX_TARGET_TYPE_GROUPS,self::HX_TARGET_TYPE_ROOMS])) throw new HxException('target_type error');
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $body = [
            'target_type'=>strtolower($target_type),
            'target'=>$target,
            'msg'=>[
                'type'=>'cmd',
                'action'=> is_array($data) && $data ? json_encode($data,JSON_UNESCAPED_UNICODE) : $data
            ],
            'from'=>$from_name ? $from_name : 'admin'
        ];

        return $this->request->curl(self::HX_API_MESSAGE,$body,$header,HxRequest::HX_REQUEST_POST);

    }




    /**
     * 文件上传
     * @param $file_path
     * @return array
     * @throws HxException
     */
    public function upload($file_path){
//        if (!is_file($file_path)) throw new HxException('file not exist');
        if (!$this->get_request_option($token, $header)) throw new HxException('option error');
        $header = [
            "restrict-access:true",
            "Authorization:Bearer {$token}",
            'enctype:multipart/form-data'
        ];
//        $file = file_get_contents($file_path);
        $body = [
            'file'=> new \CURLFile($file_path)
//            'file'=> $file
        ];
        return $this->request->curl(self::HX_API_UPLOAD,$body,$header,'XXX');
    }



    /**
     * 封装内部token跟header
     * @param $token
     * @param $header
     * @return bool
     * @throws HxException
     */
    private function get_request_option(&$token='', &$header=[])
    {
        $token = $this->get_token();
        if (empty($token)) throw new HxException('token lost');
        $header = [
            'Content-Type:application/json',
            "Authorization:Bearer {$token}"
        ];
        return true;
    }



    private function get_nonce_str($len = 32)
    {
        $str = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol) - 1;
        for ($i = 0; $i < $len; $i++) {
            $str .= $strPol[rand(0, $max)];
        }
        return $str;
    }




}