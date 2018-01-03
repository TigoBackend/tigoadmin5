<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/1/3
 * Time: 17:26
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use think\Exception;

class WorkerManController extends BaseController
{


    /**
     * 向worker man的web socket服务推送消息
     */
    public function push_to_front(){
        try{
            $client = stream_socket_client('tcp://127.0.0.1:5678',$errno,$errmsg,1);
            $data = ['uid'=>'1','percent'=>'99%'];
            fwrite($client,json_encode($data)."\n");

            $this->success(fread($client,8192));
        }catch (Exception $e){
            $this->error($e->getMessage());
        }
    }


}