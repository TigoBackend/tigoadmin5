<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 10:13
 */

class HxAutoLoader
{

    public static function autoload($class){
        $path = str_replace('\\', '/', $class);
        $path = str_replace('Waters/hx/','',$path);
        $file = __DIR__ . '/src/' . $path . '.php';
        if (file_exists($file)) {
            require_once $file;
        }
    }



}
spl_autoload_register('HxAutoLoader::autoload');
