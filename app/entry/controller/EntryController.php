<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/23
 * Time: 18:21
 */

namespace app\entry\controller;


use app\common\lib\exception\MyException;

class EntryController extends EntryBaseController
{


    public function test(){
        try{
            $this->success('test');
        }catch (MyException $e){
            handle_exception($e);
            $this->error(['msg'=>$e->getMessage(),'code'=>$e->getCode()]);
        }
    }



}