<?php

/*----------------------------------------------------------异常处理函数start-----------------------------------------------------------------------*/
/**
 * 根据异常记录信息日志
 * @param Exception $e
 * @param string $folder 要保存日志的文件夹路径
 */
function handle_exception(Exception $e,$folder=null){
    if (!$folder)$folder = 'public/log/exception/';
    if ($e instanceof \api\common\lib\exception\MyException && ($e->getLevel() >= \api\common\lib\exception\MyException::EXCEPTION_LEVEL_LOG || \think\Config::get('app_debug'))) {
        \think\Log::init(['type' => 'File', 'path' => ROOT_PATH . $folder, 'file_size' => 2097152, 'time_format' => 'c']);
        \think\Log::record($e->getMyMessage());
    } elseif ($e instanceof Exception) {
        \think\Log::init(['type' => 'File', 'path' => ROOT_PATH . $folder, 'file_size' => 2097152, 'time_format' => 'c']);
        \think\Log::record($e->getTraceAsString());
        \think\Log::record($e->getMessage());
    }
}

/**
 * 记录异常信息到指定目录
 * @param string $msg
 * @param string $folder
 */
function add_log($msg='',$folder=null){
    if (!$folder)$folder = 'public/log/exception/';
    if ($msg){
        \think\Log::init(['type' => 'File', 'path' => ROOT_PATH . $folder, 'file_size' => 2097152, 'time_format' => 'c']);
        \think\Log::record($msg);
    }
}


/**
 * 开启事务
 */
function start_trans(){
    \think\Db::startTrans();
}

/**
 * 提交事务
 */
function commit_trans(){
    \think\Db::commit();
}


/**
 * 回滚事务
 * @param Exception|null $e     异常对象
 * @param string $folder        要保存日志的路径
 */
function end_trans(Exception $e = null,$folder=null){
    if (!$folder)$folder ='public/log/exception/';
    if ($e === null){
        \think\Db::rollback();
    }else{
        if ($e instanceof \api\common\lib\exception\MyException){
            $exLevel = $e->getLevel();
            if ($exLevel >= \api\common\lib\exception\MyException::EXCEPTION_LEVEL_LOG) {
                //写入异常日志
                handle_exception($e,$folder);
                if ($exLevel == \api\common\lib\exception\MyException::EXCEPTION_LEVEL_ROLLBACK)
                    \think\Db::rollback();
            }
        }elseif ($e instanceof Exception){
            handle_exception($e,$folder);
            \think\Db::rollback();
        }
    }
}

/**
 * 如果rs为false则抛出异常
 * @param $rs
 * @param string $msg
 * @throws \Exception
 */
function throw_if_false($rs,$msg="结果为false"){
    if ($rs === false) throw new Exception($msg);
}

/**
 * 抛出自定义异常
 * @param string $msg
 * @param null $data
 * @param int $code
 * @param int $level
 * @throws \api\common\lib\exception\MyException
 */
function throw_my_exception($msg = '异常',$data=null,$code=108,$level = \api\common\lib\exception\MyException::EXCEPTION_LEVEL_NORMAL){
    throw new \api\common\lib\exception\MyException($msg,['code'=>$code,'msg'=>$msg,'data'=>empty($data)?[]:$data],$level);
}

/**
 * 抛出系统级别异常
 * @param string $msg
 * @throws Exception
 */
function throw_exception($msg = '系统异常'){
    throw new Exception($msg);
}


/*----------------------------------------------------------异常处理函数end-----------------------------------------------------------------------*/

/*----------------------------------------------------------工具函数start-----------------------------------------------------------------------*/
/**
 *截取数据中指定key的的值
 * 可用于移除接口中多余的传入参数,只截取接口规定的参数
 * @param array $data 要过滤的引用数组
 * @param array $keys 要截取的key索引数组
 * @return array
 */
function extract_data_by_keys($data=null, $keys=null)
{
    if (empty($data)) return null;
    if (empty($keys)) return $data;
    if (!is_array($data)) {
        return $data;
    } else {
        if (!is_array($keys)) {
            return isset($data[$keys])?$data[$keys]:"";
        } else {
            $result = array();
            foreach ($keys as $key) {
                if (isset($data[$key]) && !isset($result[$key])) $result[$key] = $data[$key];
            }
            unset($data);
            return $result;
        }
    }
}


/**
 * 产生随机字符串
 * @param int $len 长度，默认32位
 * @return string
 */
function getNonceStr($len = 32)
{
    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
    $max = strlen($strPol) - 1;
    for ($i = 0; $i < $len; $i++) {
        $str .= $strPol[rand(0, $max)];
    }
    return $str;
}

/**
 * 获取客户端ip地址
 * @return string
 */
function client_ip(){
    if (isset($_SERVER)) {
        if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
            $real_ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
            $real_ip = $_SERVER["HTTP_CLIENT_IP"];
        } else {
            $real_ip = $_SERVER["REMOTE_ADDR"];
        }
    } else {
        if (getenv("HTTP_X_FORWARDED_FOR")) {
            $real_ip = getenv("HTTP_X_FORWARDED_FOR");
        } else if (getenv("HTTP_CLIENT_IP")) {
            $real_ip = getenv("HTTP_CLIENT_IP");
        } else {
            $real_ip = getenv("REMOTE_ADDR");
        }
    }
    return $real_ip;
}



/**
 * 校验引用数组params中是否有keys中对应的key的值并且不为empty
 * @param $params
 * @param null $keys
 * @param int $exception_type
 * @param string $handle_type
 * @return bool
 * @throws Exception
 */
function check_params($params,$keys = null,$exception_type = 1,$handle_type="THROW"){
    $result = true;
    if(empty($params)){
        $result = false;
    } else if(!empty($keys) && is_array($keys)){
        foreach ($keys as $key){
            if(!isset($params[$key]) || empty($params[$key])){
                $result = false;
                break;
            }
        }
    }else if(!empty($keys)){
        if(!isset($params[$keys]) || empty($params[$keys])) $result = false;
    }
    /*根据处理方法执行操作*/
    if(empty($result)){
        switch ($handle_type){
            case CHECK_REQUEST_METHOD_RETURN:
                return $result;
            case CHECK_REQUEST_METHOD_THROW:
            default:
                switch ($exception_type){
                    case 2:
                        throw_my_exception('参数错误',null,\api\common\controller\BaseController::CODE_PARAMS_ERROR,\api\common\lib\exception\MyException::EXCEPTION_LEVEL_ROLLBACK);
                        break;
                    case 1:
                    default:
                        throw_exception();
                }
        }
    }
    return true;
}


/**
 * 以文件类型缓存数据
 * @param $key
 * @param $value
 * @param int $expire
 * @param string $prefix
 * @return bool
 */
function file_cache($key,$value=null,$expire=70,$prefix=''){
    if (empty($key)) return false;
    $option = array(
        'type'=>'File',
        'prefix'=>$prefix,
        'path'=>CACHE_PATH,
    );
    $expire = empty($expire)?0:$expire;
    $cache = \think\Cache::connect($option);
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
function get_file_cache($key,$prefix=''){
    $option = array(
        'type'=>'File',
        'prefix'=>$prefix,
        'path'=>CACHE_PATH,
    );
    $cache = \think\Cache::connect($option);
    return $cache->get($key,[]);
}


/**
 * 检查通过file_cache函数缓存的手机验证码并清除验证码
 * @param string $tel
 * @param string $code
 * @return bool
 */
function check_verify_code($tel,$code){
    $cache_code = get_file_cache($tel,CACHE_PREFIX_VERIFY_CODE);
    if (!$cache_code) return false;
    if (strval($cache_code) !== strval($code)) return false;
    file_cache($tel,null,0,CACHE_PREFIX_VERIFY_CODE);
    return true;
}


/**
 * 生成新的用户token
 * @return string
 */
function create_user_token(){
    return md5(time().mt_rand(1,999999999)."tg");
}


/**
 * 移除微信昵称中的表情
 * @param $str
 * @return mixed
 */
function filter_emoji($str)
{
    $str = preg_replace_callback(
        '/./u',
        function (array $match) {
            return strlen($match[0]) >= 4 ? '' : $match[0];
        },
        $str);
    return $str;
}


/**
 * 检查手机号格式
 * @param $mobile
 * @return bool
 */
function check_mobile($mobile)
{
    if (preg_match('/1[345789]\d{9}$/', $mobile))
        return true;
    return false;
}


/*----------------------------------------------------------工具函数end-----------------------------------------------------------------------*/

/*----------------------------------------------------------业务函数start-----------------------------------------------------------------------*/
/**
 * base64图片保存到临时目录
 * @param $base64
 * @return array
 */
function base64_img_save($base64){
    if (empty($base64)){
        return array('status'=>-1,'msg'=>'图片上传错误');
    }
    $upload_path = config('common.path_upload_tmp');
    $base64_head = substr(strstr($base64,';',1),11);
    $base64_body = substr(strstr($base64,','),1);
    switch ($base64_head){
        case 'jpeg':
        case 'jpg':
            $suffix = '.jpg';
            break;
        case 'png':
            $suffix = '.png';
            break;
        case 'gif':
            $suffix = '.gif';
            break;
        default:
            return array('status'=>-1,'msg'=>'图片类型异常');
    }
    $img_name = date('YmdHis')."_".rand(0,9999999);
    $file_name = "{$img_name}{$suffix}";
    $path = "{$upload_path}{$file_name}";
    /*判断能否上传*/
    if (!is_dir($upload_path)){
        if (!mkdir($upload_path,0777,true)){
            return array('status'=>-1,'msg'=>'文件上传目录不存在并且无法创建目录');
        }elseif(!chmod($upload_path,0755)){
            return array('status'=>-1,'msg'=>'文件上传目录权限无法设置为可读可写');
        }
    }
    $img = base64_decode($base64_body);
    file_put_contents($path, $img);

    /*图片压缩*/
    $real_file_name = time() ."_". rand(0,9999999).'.jpg';
    $real_file_path = $upload_path.$real_file_name;
    $img_info = getimagesize($path);
    $ext = strtolower(substr(end($img_info),strrpos(end($img_info),'/')+1));
    switch ($ext){
        case "jpeg":
        case "jpg":
            $file = imagecreatefromjpeg($path);
            $rs = imagejpeg($file,$real_file_path);
            break;
        case "png":
            $file = imagecreatefrompng($path);
            $rs = imagejpeg($file,$real_file_path);
            break;
        case 'gif':
            $file = imagecreatefromgif($path);
            $rs = imagejpeg($file,$real_file_path);
            break;
        default:
            return false;
    }
    if (!$rs) return array('status'=>-1,'msg'=>'压缩图片失败');
    /*移除旧图*/
    unlink($path);

    return array('status'=>1,'msg'=>$real_file_name);
}

/**
 * 按照指定文件类型保存临时文件到指定目录
 * @param $file_name
 * @param $type
 * @return bool|string
 */
function save_tmp_img($file_name,$type){
    $file = config('common.path_upload_tmp').$file_name;
    /*要保持的文件不存在也返回成功*/
    if (!file_exists($file))return false;
    $date = date("Ymd");
    switch ($type){
        case IMAGE_TYPE_HEADER:
            $path = config('common.path_header').$date.'/';
            $relative_path = config('common.folder_upload_header').$date.'/'.$file_name;
            break;
        default:
            $path = config('common.path_upload')."other/".$date.'/';
            $relative_path = "other/$date/$file_name";
            break;
    }
    if (!file_exists($path)){
        mkdir($path,0777,true);
        if (!is_dir($path))return false;
    }
    $rs = rename($file,$path.$file_name);
    if ($rs) return $relative_path;
    return false;
}



/**
 * 解析本地图片路径为外部链接url
 * @param $path
 * @param int $type     图片类型
 * @return string
 */
function parse_img($path,$type=1){
    if (strpos($path,'http') === 0) return $path;
    $file = config('common.path_upload').$path;

    $host = $_SERVER["HTTP_HOST"];
    $http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https'))?'https://':'http://';
    if ($path && file_exists(iconv('UTF-8','GB2312//IGNORE',$file))) {
        return $http_type . $host . $path;
    }else{
        switch ($type){
            case IMAGE_TYPE_HEADER:
                return $http_type . $host . "/upload/header/default.png";
            default:
                return $http_type . $host ."/upload/default.jpg";
        }
    }
}


/*----------------------------------------------------------业务函数end-----------------------------------------------------------------------*/




