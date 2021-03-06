<?php
/**
 * 耗时任务入口
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/20
 * Time: 17:49
 */


ignore_user_abort(true);
set_time_limit(0);


// [ 入口文件 ]

// 调试模式开关
define("APP_DEBUG", true);

// 定义CMF根目录,可更改此目录
define('CMF_ROOT', __DIR__ . '/../../');

// 定义应用目录
define('APP_PATH', CMF_ROOT . 'task/');

// 定义CMF核心包目录
define('CMF_PATH', CMF_ROOT . 'simplewind/cmf/');

// 定义插件目录
define('PLUGINS_PATH', __DIR__ . '/../plugins/');

// 定义扩展目录
define('EXTEND_PATH', CMF_ROOT . 'simplewind/extend/');
define('VENDOR_PATH', CMF_ROOT . 'simplewind/vendor/');

// 定义应用的运行时目录
define('RUNTIME_PATH', CMF_ROOT . 'data/runtime/');

// 定义CMF 版本号
define('THINKCMF_VERSION', '5.0.170912');

define('APP_NAMESPACE','task');



/*---------------------------------------------------------------天高常量start-----------------------------------------------*/
define('UPLOAD_PATH', __DIR__ . '/../upload/');    /*定义文件上传目录*/
define("CHECK_REQUEST_METHOD_THROW","THROW");   /*校验访问方式异常处理方式抛出异常*/
define("CHECK_REQUEST_METHOD_RETURN","RETURN");     /*校验访问方式异常处理方式return bool*/
/*-----------------------------------------------------------------------业务常量start-----------------------------------------------------------------------*/
define('IMAGE_TYPE_AVATAR',1);      /*图片类型：头像*/

/*---------------------------------------------------------------天高常量end-----------------------------------------------*/

// 加载框架基础文件
require CMF_ROOT . 'simplewind/thinkphp/base.php';

// 执行应用
\think\App::run()->send();