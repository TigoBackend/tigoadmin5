<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/1/1
 * Time: 22:36
 */

namespace app\admin\controller;


use cmf\controller\AdminBaseController;

class PushController extends AdminBaseController
{


    public function index(){

        return $this->fetch();
    }

}