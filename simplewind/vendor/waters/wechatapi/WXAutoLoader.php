<?php

/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/2/19
 * Time: 1:23
 */
class WXAutoLoader
{

    public static function autoload($class){
        $path = str_replace('\\', '/', $class);
        $path = str_replace('Waters/WebChatApi/','',$path);
        $file = __DIR__ . '/src/' . $path . '.php';
        if (file_exists($file)) {
            require_once $file;
        }
    }

}


spl_autoload_register('WXAutoLoader::autoload');
?>