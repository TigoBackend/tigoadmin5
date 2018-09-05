<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/23
 * Time: 18:21
 */

namespace app\entry\controller;


use app\common\model\UserWxModel;

class EntryController extends EntryBaseController
{


    public function test(){
        $uw_model = new UserWxModel();
        dump($uw_model->getPk());
        $this->success('test');
    }



}