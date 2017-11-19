<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
$apps = cmf_scan_dir(APP_PATH . '*', GLOB_ONLYDIR);

foreach ($apps as $app) {
    $routeFile = APP_PATH . $app . '/route.php';

    if (file_exists($routeFile)) {
        include_once $routeFile;
    }

}


return [
    '__miss__'=>'entry/Index/index',
    /*微信接口*/
    'wx/login'=>'entry/Wx/login',
    'wx/login_callback'=>'entry/Wx/login_callback',
    'wx/handle_msg'=>'entry/Wx/handle_msg',
    'wx/share'=>'entry/Wx/share',
    'wx/login_proxy'=>'entry/Wx/login_proxy',
    'wx/login_callback_proxy'=>'entry/Wx/login_callback_proxy',

    /*阿里短信接口*/
    'sms/old'=>'entry/Sms/old_version',
    'sms/new'=>'entry/Sms/new_version',

    /*七牛接口*/
    'qn/stat'=>'entry/Qn/file_status',      
    'qn/upload'=>'entry/Qn/upload',
    'qn/drop'=>'entry/Qn/drop',
    'qn/file_move'=>'entry/Qn/file_move',
    'qn/file_copy'=>'entry/Qn/file_copy',
    'qn/file_fetch'=>'entry/Qn/file_fetch',
    'qn/thumbnail'=>'entry/Qn/thumbnail',
    'qn/water_img'=>'entry/Qn/water_img',
    'qn/water_text'=>'entry/Qn/water_text',

    /*redis实例*/
    'redis/test'=>'entry/Redis/check',
    'redis/set'=>'entry/Redis/set',
    'redis/get'=>'entry/Redis/get',
    'redis/has'=>'entry/Redis/has',
    'redis/inc'=>'entry/Redis/inc',
    'redis/dec'=>'entry/Redis/dec',
    'redis/rm'=>'entry/Redis/rm',
    'redis/clear'=>'entry/Redis/clear',
    'redis/keys'=>'entry/Redis/keys',
    'redis/del'=>'entry/Redis/del',
    'redis/del_pattern'=>'entry/Redis/del_pattern',
    'redis/select'=>'entry/Redis/select',
    'redis/move'=>'entry/Redis/move',
    'redis/mget'=>'entry/Redis/mget',
    'redis/mset'=>'entry/Redis/mset',
];