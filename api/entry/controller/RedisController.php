<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/11/19
 * Time: 12:25
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use think\exception\ErrorException;
use think\RedisCache;

class RedisController extends BaseController
{


    public function check(){
        try{
//            $redis = new \Redis();
//            $redis->connect('127.0.0.1',6379);
//            $rs = $redis->set('name',false);
//            dump($rs);
//            $rs = $redis->exists('name');
//            dump($rs);
//            $rs = $redis->get('name');
//            dump($rs);
//            $rs = $redis->del('name');
//            dump($rs);
//            $rs = $redis->exists('name');
//            dump($rs);
//            $rs = $redis->keys('*');
//            dump($rs);
//            $rs = $redis->del(['checknow','checknew']);
//            dump($rs);
//            $rs = $redis->mset(['ccc'=>'ccc','ddd'=>'ddd']);


//            $option = [
//                /*redis服务主机ip*/
//                'host'=>'127.0.0.1',
//                /*redis服务端口*/
//                'port'=>'6379',
//                /*redis访问密码*/
//                'password'   => '',
//                /*要选中的redis数据库索引*/
//                'select'     => 0,
//                // 缓存有效期 0表示永久缓存
//                'expire' => 5,
//                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
//                'persistent' => false,
//                // 缓存前缀
//                'prefix' => 'tg_',
//                //链接超时时间
//                'timeout'=>2,
//                // 驱动方式
//                'type'   => 'Redis',
//            ];
//            $redis = Cache::connect($option);
//            $rs = $redis->mset(['ccc'=>'ccc','ddd'=>'ddd']);
//            $rs = $redis->mget(['ccc','ddd']);
//            $rs = $redis->set('checkout','it');
//            dump($rs);
//            $rs = $redis->mget(['name1','checkout']);
//            dump($rs);
//            $rs = $redis->mget(['name1','name5','name2']);
//            $rs = $redis->get('name3');
//            dump($rs);
//            $rs = $redis->move('name','1');
//            dump($rs);
//            $rs = $redis->get('name');
//            dump($rs);
//            $rs = $redis->select(1);
//            dump($rs);
//            $rs = $redis->get('name');
//            dump($rs);
//            $rs = $redis->select(1);
//            dump($rs);
//            $rs = $redis->get('name');
//            dump($rs);
//            $rs = $redis->keys();
//            dump($rs);
//            $rs = $redis->del_pattern('check*');
//            dump($rs);
//            $rs = $redis->keys();
//            dump($rs);
            
//            $rs = WatersCache::get('name','nothing');
//            dump($rs);
//            $rs = WatersCache::set('name','check now',5);
//            dump($rs);
//            $rs = WatersCache::get('name','nothing');
//            dump($rs);
//            $rs = WatersCache::rm('name');
//            dump($rs);
//            $rs = WatersCache::get('name','nothing');
//            dump($rs);
//            $rs = WatersCache::hash_get_all('hm');
//            dump($rs);
//            $rs = WatersCache::hash_multi_set('Waters',['name'=>'Waters Fong','age'=>35,'sex'=>'male','job'=>'coder']);
//            dump($rs);
//            $rs = WatersCache::hash_set('Waters','lover','nan');
//            dump($rs);
//            $rs = WatersCache::hash_get_all('Waters');
//            dump($rs);
//            $rs = WatersCache::hash_get('Waters','lover');
//            dump($rs);
//            $rs = WatersCache::hash_multi_get('Waters',['name','lover']);
//            dump($rs);
//            $rs = WatersCache::hash_del('Waters',['name','age']);
//            dump($rs);
//            $rs = WatersCache::exists('Waters');
//            dump($rs);
//            $rs = WatersCache::hash_exists('Waters','job');
//            dump($rs);
//            $rs = WatersCache::hash_keys('Waters');
//            dump($rs);
//            $rs = WatersCache::hash_len('Waters');
//            dump($rs);
//            $rs = WatersCache::hash_values('Waters');
//            dump($rs);
//            $rs = WatersCache::hash_increment_by_int('Waters','age',-3);
//            dump($rs);
//            $rs = WatersCache::hash_increment_by_float('Waters','money',-11.11);
//            dump($rs);
//            $rs = WatersCache::hash_get_all('Waters');
//            dump($rs);


//            $redis = new \Redis();
            $options = [
                'host'       => '127.0.0.1',
                'port'       => 6379,
                'password'   => 'dgTigo003.',
                'select'     => 0,
                'timeout'    => 1,
                'expire'     => 0,
                'persistent' => false,
                'prefix'     => 'gyq_',
            ];
            $options1 = [
                'host'       => '127.0.0.1',
                'port'       => 6379,
                'password'   => 'dgTigo003.',
                'select'     => 0,
                'timeout'    => 0,
                'expire'     => 0,
                'persistent' => false,
                'prefix'     => '',
            ];
//            $redis = new Redis($options);
//            $redis = new \Redis();
//            $redis->connect('127.0.0.1');
//            $redis->auth('dgTigo003.');
//            $rs = $redis->hMset('hm',['name'=>'Waters Fong','age'=>35,'sex'=>'male','job'=>'coder']);
//            dump($rs);
//            $rs = $redis->hGetAll('hm');
//            dump($rs);
//            $rs = $redis->hGet('hm','age');
//            dump($rs);
//            $rs = $redis->list_index('list1',0);
//            $rs = $redis->lPush('list',json_encode(['name'=>'Ucc'],JSON_UNESCAPED_UNICODE),['name'=>'UBB'],['name'=>'UDD'],['name'=>'UFF'],['name'=>'UQQ'],['name'=>'UUU']);
//            $rs = $redis->lRem('list',json_encode(['name'=>'UFF'],JSON_UNESCAPED_UNICODE),1);
//            $rs = $redis->rPushx('lis11t','ddd');
//            $rs = $redis->has('list1');
//            $rs = $redis->lRange('list2',0,100);
//            dump($rs);
            $redis = RedisCache::connect($options);
//            $rs = $redis->zAdd('z1',7,'v7');
//            $rs = $redis->zAdd('z1',1,'v1');
//            $rs = $redis->zAdd('z1',3,'v3');
//            $rs = $redis->zAdd('z1',1.1,'v1.1');
            $rs = $redis->zRange('z1',0,-1,true);
            dump($rs);
            $rs = $redis->zRangeByScore('z1',0,3);
            dump($rs);
            $rs = $redis->zRevRangeByScore('z1',3,0);
            dump($rs);
            $rs = $redis->zRange('z1',0,0);
            dump($rs);
            $rs = $redis->zRevRange('z1',0,0);
            dump($rs);
            $this->success('check',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }





}