<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2017/10/27
 * Time: 16:11
 */


/*----------------------------------------------------------异常处理函数start-----------------------------------------------------------------------*/
/**
 * 根据异常记录信息日志
 * @param Exception $e
 * @param string $folder 要保存日志的文件夹路径
 */
function handle_exception(Exception $e,$folder=null){
    if (!$folder)$folder = 'public/log/exception/';
    if ($e instanceof \app\common\lib\exception\MyException && ($e->getLevel() >= \app\common\lib\exception\MyException::EXCEPTION_LEVEL_LOG || \think\Config::get('app_debug'))) {
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
        if ($e instanceof \app\common\lib\exception\MyException){
            $exLevel = $e->getLevel();
            if ($exLevel >= \app\common\lib\exception\MyException::EXCEPTION_LEVEL_LOG || APP_DEBUG) {
                //写入异常日志
                handle_exception($e,$folder);
                if ($exLevel == \app\common\lib\exception\MyException::EXCEPTION_LEVEL_ROLLBACK)
                    \think\Db::rollback();
            }
        }elseif ($e instanceof Exception){
            handle_exception($e,$folder);
            \think\Db::rollback();
        }
    }
}


/**
 * 抛出自定义异常
 * @param string $msg
 * @param int $code
 * @param int $level
 * @throws \app\common\lib\exception\MyException
 */
function throw_my_exception($msg = '异常',$code=-7,$level = \app\common\lib\exception\MyException::EXCEPTION_LEVEL_NORMAL){
    $code = empty($code)?\app\common\controller\BaseApiController::CODE_BUSINESS_ERROR:$code;
    $level = empty($level)?\app\common\lib\exception\MyException::EXCEPTION_LEVEL_NORMAL:$level;
    throw new \app\common\lib\exception\MyException($msg,$level,$code);
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
function get_nonce_str($len = 32)
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
function check_params($params,$keys = null,$exception_type = 2,$handle_type="THROW"){
    $result = true;
    $msg = "";
    if(empty($params)){
        $result = false;
        if (is_array($keys)){
            foreach ($keys as $key){
                $msg .= "{$key} ";
            }
            $msg .= "不能为空";
        }else{
            $msg = "{$keys}不能为空";
        }
    } else if(!empty($keys) && is_array($keys)){
        foreach ($keys as $key){
            if(!isset($params[$key]) || empty($params[$key])){
                $result = false;
                $msg = "{$key}必须传入";
                break;
            }
        }
    }else if(!empty($keys)){
        if(!isset($params[$keys]) || empty($params[$keys])) {
            $result = false;
            $msg = "{$keys}必须传入";
        }
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
                        throw_my_exception($msg,\app\common\controller\BaseApiController::CODE_PARAMS_ERROR,\app\common\lib\exception\MyException::EXCEPTION_LEVEL_ROLLBACK);
                        break;
                    case 1:
                    default:
                        throw_exception($msg);
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


/**
 * 判断是否来之手机浏览器
 * @return bool
 */
function is_mobile(){
// 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
    {
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
        );
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT']))
    {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        }
    }
    return false;
}



/*----------------------------------------------------------工具函数end-----------------------------------------------------------------------*/

/*----------------------------------------------------------业务函数start-----------------------------------------------------------------------*/


/**
 * base64图片保存到临时目录
 * @param $base64
 * @throws \app\common\lib\exception\MyException
 * @return null|string
 */
function base64_img_save($base64){
    check_params($base64);
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
            throw_my_exception('图片类型异常');
            return null;
    }
    $img_name = date('YmdHis')."_".rand(0,9999999);
    $file_name = "{$img_name}{$suffix}";
    $path = "{$upload_path}{$file_name}";
    /*判断能否上传*/
    if (!is_dir($upload_path)){
        if (!mkdir($upload_path,0777,true)){
            throw_my_exception('文件上传目录不存在并且无法创建目录');
            return null;
        }elseif(!chmod($upload_path,0755)){
            throw_my_exception('文件上传目录权限无法设置为可读可写');
            return null;
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
            throw_my_exception('图片格式错误');
            return null;
    }
    if (!$rs) throw_my_exception('压缩图片失败');
    /*移除旧图*/
    unlink($path);

    return $real_file_name;
}



/**
 * 按照指定文件类型保存临时文件到指定目录
 * @param $file_name
 * @param $type
 * @param $special_path
 * @param int $three_party_upload_status
 * @return bool|string
 * @throws Exception
 */
function save_tmp_img($file_name,$type,$special_path = '',&$three_party_upload_status=0){
    $file = config('common.path_upload_tmp').$file_name;
    /*要保持的文件不存在也返回成功*/
    if (!file_exists($file))return false;
    if (empty($special_path) || !is_string($special_path)) $special_path = date("Ymd");

    switch ($type){
        case IMAGE_TYPE_AVATAR:
            $path = config('common.path_avatar').$special_path.'/';
            $relative_path = config('common.folder_upload_avatar').$special_path.'/'.$file_name;
            break;
        default:
            $path = config('common.path_upload')."other/".$special_path.'/';
            $relative_path = "other/$special_path/$file_name";
            break;
    }
    if (!file_exists($path)){
        mkdir($path,0777,true);
        if (!is_dir($path))return false;
    }
    $rs = rename($file,$path.$file_name);
    //判断是否有配置七牛云,如果是则上传
    $storage = cmf_get_option('storage');
    if (empty($storage['type'])) {
        $storage['type'] = 'Local';
    }
    $fileType = "image";
    if ($storage['type'] != 'Local') { //  增加存储驱动
        $storage = new \cmf\lib\Storage($storage['type'], $storage['storages'][$storage['type']]);
        $result  = $storage->upload($relative_path, './upload/' . $relative_path, $fileType);
        if (!empty($result)){
            $three_party_upload_status = 1;//表示上传成功
        }else{
            $three_party_upload_status = 0;
        }
    }
    if ($rs) return $relative_path;
    return false;
}



/*----------------------------------------------------------业务函数end-----------------------------------------------------------------------*/