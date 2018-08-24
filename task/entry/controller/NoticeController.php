<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/21
 * Time: 10:06
 */

namespace task\entry\controller;



use task\common\lib\exception\TaskException;

class NoticeController extends TaskBaseController
{


    public function test(){
        $this->success('task');
    }


    /**
     * 批量推送变价通知模板消息
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function price(){
        try{
            NoticeService::price_notice();
            $this->success('success');
        }catch (TaskException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }


    /**
     * 批量推送开盘通知模板消息
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function open(){
        try{
            NoticeService::open_notice();
            $this->success('success');
        }catch (TaskException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }


    /**
     * 批量推送委托找房通知模板消息
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function search_depute(){
        try{
            NoticeService::search_depute_notice();
            $this->success('success');
        }catch (TaskException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }


    /**
     * 批量离线聊天提醒模板消息
     * @throws \Waters\hx\Exception\HxException
     */
    public function chat_off_line(){
        try{
            NoticeService::chat_off_line();
            $this->success('success');
        }catch (TaskException $e){
            handle_exception($e);
            $this->error($e->getMessage());
        }
    }





}