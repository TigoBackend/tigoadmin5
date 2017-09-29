<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/9/26
 * Time: 18:26
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use api\common\lib\exception\MyException;

class IndexController extends BaseController
{

    public function index(){
        config('default_return_type','html');
        return "<!doctype html><html><head></head><body><div  style='position: absolute;left: 0px;top: 0px;width: 100%;height: 100%'><img src='http://img.qdczj.com/error.jpg' width='100%'></div></body></html>";
    }

}