<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 调试模式开关
define("APP_DEBUG", true);

// 定义 APP 命名空间
define("APP_NAMESPACE", 'api');

// 定义CMF根目录,可更改此目录
define('CMF_ROOT', __DIR__ . '/../../');

// 定义应用目录
define('APP_PATH', CMF_ROOT . 'api/');

// 定义CMF目录
define('CMF_PATH', __DIR__ . '/../../simplewind/cmf/');

// 定义插件目录
define('PLUGINS_PATH', __DIR__ . '/../plugins/');

// 定义扩展目录
define('EXTEND_PATH', __DIR__ . '/../../simplewind/extend/');
define('VENDOR_PATH', __DIR__ . '/../../simplewind/vendor/');

// 定义应用的运行时目录
define('RUNTIME_PATH',__DIR__.'/../../data/runtime/api/');



/*---------------------------------------------------------------天高常量start-----------------------------------------------*/
define('UPLOAD_PATH',__DIR__.'/../upload/');    /*定义文件上传目录*/
define("CHECK_REQUEST_METHOD_THROW","THROW");   /*校验访问方式异常处理方式抛出异常*/
define("CHECK_REQUEST_METHOD_RETURN","RETURN");     /*校验访问方式异常处理方式return bool*/
/*-----------------------------------------------------------------------业务常量start-----------------------------------------------------------------------*/
define('CACHE_PREFIX_VERIFY_CODE','verify_code');   /*验证码缓存文件前缀*/
define('IMAGE_TYPE_HEADER',1);                      /*图片类型头像*/

/*---------------------------------------------------------------天高常量end-----------------------------------------------*/

// 加载框架基础文件
require __DIR__ . '/../../simplewind/thinkphp/base.php';
// 执行应用
\think\App::run()->send();
