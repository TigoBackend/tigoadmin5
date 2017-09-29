<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2017/9/28
 * Time: 23:38
 */

namespace api\entry\controller;


use api\common\controller\BaseController;
use api\common\lib\exception\MyException;
use Qiniu\Auth;
use Qiniu\Processing\ImageUrlBuilder;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;

class QnController extends BaseController
{

    /**
     * 查询文件信息
     */
    public function file_status(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->stat($config['bucket'],'key');
            if ($err !== null){
                dump($err);
                exit;
            }
            $this->success($result);

        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 上传文件示例
     * @throws \Exception
     */
    public function upload(){
        try{
            vendor('qiniu.autoload');
            $file = UPLOAD_PATH."default.jpg";
            if (!is_file($file))throw_my_exception('文件不存在');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            /*校验图片是否已存在七牛以免重复上传浪费带宽*/
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->stat($config['bucket'],'key');
            if ($err === null) throw_my_exception('文件已存在,不需要重复上传');
            unset($err);
            unset($result);
            /*七牛上没有资源则上传资源*/
            $token = $auth->uploadToken($config['bucket'],null,3600);
            $upload_mgr = new UploadManager();
            list($result,$err) = $upload_mgr->putFile($token,'key',$file);
            if ($err !== null) throw_my_exception('upload_qn_img upload err:'.$err->message());
            $this->success($config['domain']."key?v=".time());
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }

    /**
     * 清除七牛云指定文件
     */
    public function drop(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->delete($config['bucket'],'key');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }
            
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());   
        }
    }


    /**
     * 将文件从文件$key2 移动到文件$key3。 可以在不同bucket移动
     */
    public function file_move(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->move('bucket_from','key_from','bucket_to','key_to');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }



    /**
     * 将文件从文件$key 复制到文件$key2。 可以在不同bucket复制
     */
    public function file_copy(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            $rs = $bucket_mgr->copy('bucket_from','key_from','bucket_to','key_to');
            if ($rs !== null){
                dump($rs);
            }else{
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }



    /**
     * 抓取网络资源到存储空间
     */
    public function file_fetch(){
        try{
            vendor('qiniu.autoload');
            $config = config('qn_config');
            $auth = new Auth($config['access_key'],$config['secret_key']);
            $bucket_mgr = new BucketManager($auth);
            list($result,$err) = $bucket_mgr->fetch('url',$config['bucket'],'key');
            if ($err !== null){
                dump($err);
            }else{
                dump($result);
                $this->success('Success!');
            }
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }

    /**
     * 为存储空间中的图片生成缩略图链接
     */
    public function thumbnail(){
        try{
            $params = extract_data_by_keys(input('param.'),['url']);
            check_params($params,['url'],2);
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $thumb_url = $img_builder->thumbnail('url',1,100,100);
            $this->success($thumb_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 为存储空间中的图片生成带图片水印图片链接
     */
    public function water_img(){
        try{
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $water_url = $img_builder->waterImg('url','water_url');
            $this->success($water_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


    /**
     * 为存储空间中的图片生成带文字水印图片链接
     */
    public function water_text(){
        try{
            vendor('qiniu.autoload');
            $img_builder = new ImageUrlBuilder();
            $water_url = $img_builder->waterText('url','text','微软雅黑',500,'#FF0000');
            $this->success($water_url);
        }catch (MyException $e){
            handle_exception($e,'public/log/qn/');
            $this->error($e->getMessage());
        }
    }


}