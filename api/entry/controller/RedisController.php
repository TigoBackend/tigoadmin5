<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/11/19
 * Time: 12:25
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use think\Cache;
use think\exception\ErrorException;

class RedisController extends BaseController
{

    /**
     * 设置redis缓存
     */
    public function set(){
        try{
            $key = input('key','');
            $value = input('value','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option,true);
            $rs = $redis->set($key,$value);

            $this->success('set',json_encode($rs));
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 获取redis缓存
     */
    public function get(){
        try{
            $key = input('key','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->get($key,'nothing');
            $this->success('get',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 判断缓存是否存在并且是否有有效值
     */
    public function has(){
        try{
            $key = input('key','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->has($key);
            $this->success('has',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 自增缓存（针对数值缓存）
     */
    public function inc(){
        try{
            $key = input('key','');
            $step = input('step','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->inc($key,$step);
            $this->success('inc',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 自减缓存（针对数值缓存）
     */
    public function dec(){
        try{
            $key = input('key','');
            $step = input('step','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->dec($key,$step);
            $this->success('dec',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 删除单个缓存
     */
    public function rm(){
        try{
            $key = input('key','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->rm($key);
            $this->success('rm',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 清空当前redis数据库
     */
    public function clear(){
        try{
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->clear();
            $this->success('clear',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 查找符合pattern模式给定的key列表
     */
    public function keys(){
        try{
            $pattern = input('pattern','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->keys($pattern);
            $this->success('keys',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }

    /**
     * 移除指定key的缓存
     */
    public function del(){
        try{
            $keys = input('keys','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->del($keys);
            $this->success('del',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 删除符合pattern模式的key的缓存,注意pattern不传或传入*表示移除所有缓存
     */
    public function del_pattern(){
        try{
            $pattern = input('pattern','');
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->del_pattern($pattern);
            $this->success('del_pattern',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 根据索引切换当前redis数据库
     */
    public function select(){
        try{
            $index = input('index',0);
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->select($index);
            $this->success('index',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 将指定key的数据移到指定索引的数据库中
     */
    public function move(){
        try{
            $key = input('key',0);
            $db_index = input('db_index',0);
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->move($key,$db_index);
            $this->success('move',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 获取指定数组中的key对应的缓存(批量获取缓存)
     */
    public function mget(){
        try{
            $keys = input('keys','');
            $keys = explode(',',$keys);
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->mget($keys);
            $this->success('move',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }


    /**
     * 批量添加缓存
     */
    public function mset(){
        try{
            $datas = [
                'ccc'=>'111',
                'ddd'=>'222',
                'eee'=>'444',
            ];
            $option = [
                /*redis服务主机ip*/
                'host'=>'127.0.0.1',
                /*redis服务端口*/
                'port'=>'6379',
                /*redis访问密码*/
                'password'   => '',
                /*要选中的redis数据库索引*/
                'select'     => 0,
                // 缓存有效期 0表示永久缓存
                'expire' => 5,
                /*false 脚本结束之后连接就释放了 true脚本结束之后连接不释放，连接保持在php-fpm进程中*/
                'persistent' => false,
                // 缓存前缀
                'prefix' => 'tg_',
                //链接超时时间
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
            ];
            $redis = Cache::connect($option);
            $rs = $redis->mset($datas);
            $this->success('move',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }





    public function check(){
        try{
            $redis = new \Redis();
            $redis->connect('127.0.0.1',6379);
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


            $option = [
                'host'=>'127.0.0.1',
                'port'=>'6379',
                'timeout'=>2,
                // 驱动方式
                'type'   => 'Redis',
                // 缓存保存目录
                'path'   => CACHE_PATH,
                // 缓存前缀
                'prefix' => 'tg_',
                // 缓存有效期 0表示永久缓存
//                'expire' => 5,
            ];
            $redis = Cache::connect($option);
//            $rs = $redis->mset(['ccc'=>'ccc','ddd'=>'ddd']);
            $rs = $redis->mget(['ccc','ddd']);
//            $rs = $redis->set('checkout','it');
//            dump($rs);
//            $rs = $redis->mget(['name1','checkout']);
//            dump($rs);
//            $rs = $redis->mget(['name1','name5','name2']);
//            $rs = $redis->get('name');
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
            $this->success('check',$rs);
        }catch (\RedisException $e){
            $this->error($e->getMessage());
        }catch (ErrorException $e){
            $this->error($e->getMessage());
        }
    }





}