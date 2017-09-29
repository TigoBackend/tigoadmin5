<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------

if(file_exists(ROOT_PATH."data/conf/database_dev.php")){
    $database=include ROOT_PATH."data/conf/database_dev.php";
}else{
    $database=[];
}

return $database;
