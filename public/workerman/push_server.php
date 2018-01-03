<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/1/1
 * Time: 23:09
 */

require_once "../../simplewind/vendor/workerman/workerman-for-win/Autoloader.php";



$worker = new \Workerman\Worker('websocket://127.0.0.1:1234');

$worker->uidConnections = [];

$worker->onWorkerStart = 'on_worker_start';

$worker->onMessage = 'on_message';

$worker->onClose = 'on_close';


/**
 * web socket worker启动回调
 * @param \Workerman\Worker $worker
 * @return bool
 */
function on_worker_start(\Workerman\Worker $worker){
    try{
        $inner_text_worker = new \Workerman\Worker('text://127.0.0.1:5678');
        $inner_text_worker->onMessage = function (\Workerman\Connection\TcpConnection $connection,$buffer){
            $data = json_decode($buffer,true);
            $uid = $data['uid'];
            $ret = send_message_by_uid($uid,$buffer);
            $connection->send($ret?'ok':'fail');
        };
        $inner_text_worker->listen();
    }catch (Exception $e){
        return false;
    }
    return true;
}


/**
 * web socket worker 收到前端消息时的回调
 * @param \Workerman\Connection\TcpConnection $connection
 * @param $data
 */
function on_message(\Workerman\Connection\TcpConnection $connection,$data){
    global $worker;
    if (!isset($connection->uid)){
        $connection->uid = $data;

        $worker->uidConnections[$connection->uid] = $connection;
    }
}


/**
 * 与前端断开链接时的回调
 * @param \Workerman\Connection\TcpConnection $connection
 */
function on_close(\Workerman\Connection\TcpConnection $connection){
    global $worker;
    if (isset($connection->uid)){
        unset($worker->uidConnections[$connection->uid]);
    }
}


/**
 * 推送消息给所有前端用户
 * @param $message
 */
function broadcast($message){
    global  $worker;
    foreach ($worker->uidConnections as $connection){
        $connection->send($message);
    }
}


/**
 * 发送消息给指定uid用户
 * @param $uid
 * @param $message
 * @return bool
 */
function send_message_by_uid($uid,$message){
    global $worker;
    if (isset($worker->uidConnections[$uid])){
        $connection = $worker->uidConnections[$uid];
        $connection->send($message);
        return true;
    }
    return false;
}


\Workerman\Worker::runAll();

