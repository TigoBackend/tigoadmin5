<?php

/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/7/31
 * Time: 16:19
 */
class ALiYunSMSAutoLoader
{


    public static function autoload($class){
        $name = $class;
        if (false !== strpos($name,'\\')) $name = strstr($class,'\\',true);

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Api/Sms/Request/V20170525/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/Auth/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/Exception/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/Http/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/Profile/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }

        $file_name = ALI_YUN_SMS_AUTO_LOADER_PATH."/Core/Regions/{$name}.php";
        if (is_file($file_name)){
            include_once $file_name;
            return;
        }
    }

}

spl_autoload_register('ALiYunSMSAutoLoader::autoload');
?>