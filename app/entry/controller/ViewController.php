<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/5/20
 * Time: 16:58
 */

namespace app\entry\controller;


use cmf\controller\BaseController;


/**
 * 视图控制器
 * Class ViewController
 * @package app\entry\controller
 */
class ViewController extends BaseController
{
    protected $is_mobile = false;


    protected function _initializeView()
    {
        $this->is_mobile = is_mobile();
        $root = cmf_get_root();
        $viewReplaceStr = [
            '__ROOT__'     => $root,
            '__TMPL__'     => "{$root}/../app/entry/view",
            '__STATIC__'   => "{$root}/static",
            '__WEB_ROOT__' => $root
        ];
        config('view_replace_str', $viewReplaceStr);
    }


    function err(){
        $img_name = $this->is_mobile ? '404mo-min.jpg' : '404pc-min.jpg';
        $this->assign('img_name',$img_name);
        return $this->fetch();
    }


}