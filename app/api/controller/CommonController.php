<?php
/**
 * yhx2019-1-14
 * 通用接口
 */
namespace app\api\controller;


use think\Request;
use think\Validate;
use think\Cache;
use app\api\service\MemberService;
use app\api\service\CommonService;
// use cmf\controller\CaptchaController;
use cmf\lib\Upload;


class CommonController extends BaseController
{

    /**
     * 获取区域
     * @Author   YHX
     * @DateTime 2017-07-17T12:00:40+0800
     * @return   [type]                   [description]
     */
    public function area(){
        $parent_id = input('parent_id',0);
        $res = Cache::get('area_'.$parent_id);
        if($res){
            $data['list'] = $res;
            $this->showTrueJson($data);
        }else{
            $res = get_area_list($parent_id);
            if($res){
                Cache::set('area_'.$parent_id,$res,config('cache.expire'));
                $data['list'] = $res;
                $this->showTrueJson($data);
            }else{
                $this->showFalseJson('无数据');
            }
        }
    }

    /**
     * 省市区
     */
    public function area_list(){

        // $CommonService = new CommonService;
        $res = CommonService::area_list();
        if($res["status"]){
            $this->showTrueJson($res["data"],$res["msg"],$res["code"]);
        }else{
            $this->showFalseJson($res["msg"],$res["code"]);
        }
    }

    /**
     * 轮播图片
     */
  	public function slide(){

      $params = input();
       $checkRule = array(
           "slide_id"=>"require",
       );
       $checkMsg = array(
           "slide_id.require" => "slide_id不能为空",
       );
       $validate = new Validate($checkRule,$checkMsg);
       if (!$validate->check($params)) {
           $this->showFalseJson($validate->getError());
       }

  		$CommonService = new CommonService;
  		$result =  $CommonService->_slide($params);
  		if($result['status']){
  			$this->showTrueJson($result['data'],$result['msg'],$result['code']);
  		}else{
  			$this->showFalseJson($result['msg'],$result['code']);
  		}
  	}


    /**
     * 上传图片
     */
    public function upload_img(){
        $data["img"] = input("img");
        $data["type"] = input("type",'MACHINE');
        $checkRule = array(
            "img"=>"require",
        );
        $checkMsg = array(
            "img.require" => "img不能为空",
        );
        $validate = new Validate($checkRule,$checkMsg);
        if (!$validate->check($data)) {
            $this->showFalseJson($validate->getError());
        }
        $service = new CommonService();
        $res = $service->_upload_img($data);
        if($res["status"]){
            $this->showTrueJson($res["data"],$res["msg"],$res["code"]);
        }else{
            $this->showFalseJson($res["msg"],$res["code"]);
        }
    }

   /**
     * 手机验证码 TODO
     * @Author   YHX
     * @DateTime 2017-12-19T09:59:48+0800
     * @return   [type]                   [description]
     */
    public function verify_code(){
        $data["member_id"] = input("member_id");
        $data["phone"] = input("phone");
        $data["type"] = input("type");
        $checkRule = array(
            "phone"=>"require",
            "type"=>"require",
        );
        $checkMsg = array(
            "phone.require" => "手机号码不能为空",
            "type.require" => "type不能为空",
        );
        $validate = new Validate($checkRule,$checkMsg);
        if (!$validate->check($data)) {
            $this->showFalseJson($validate->getError());
        }
        //根据不同类型判断 手机是否存在
        $MemberService = new MemberService();
        $member = $MemberService->get_member_by_phone($data["phone"]);
        $member_by_id = $MemberService->get_member_by_id($data["member_id"]);
        switch ($data['type']) {
          case 'register':
            if($member){
              $this->showFalseJson('手机号已被注册');
            }
            break;

          case 'forget':
            if(!$member){
              $this->showFalseJson('手机号尚未注册');
            }
            break;

          case 'login':
            if(!$member){
              $this->showFalseJson('手机号尚未注册');
            }
            break;

          case 'change_phone1':
            if(!$member){
              $this->showFalseJson('手机号尚未注册');
            }
            if($member_by_id['member_phone'] != $data["phone"]){
              $this->showFalseJson('请输入当前绑定的手机号');
            }
            break;

          case 'change_phone2':
            if($member){
              $this->showFalseJson('手机号已被注册');
            }
            break;

          case 'bind_phone':
            if($member['openid'] != ''){
              $this->showFalseJson('手机号已被绑定');
            }
            break;
          
          default:
            $this->showFalseJson('type不能为空');
            break;
        }
        
        $service = new CommonService();
        $res = $service->verify_code($data);
        if($res["status"]){
            $this->showTrueJson($res["data"],$res["msg"],$res["code"]);
        }else{
            $this->showFalseJson($res["msg"],$res["code"]);
        }
    }


    /**
     * 通用配置
     * @Author   YHX
     * @DateTime 2018-09-11T18:23:44+0800
     * @return   [type]                   [description]
     */
    public function option(){
       $params = input();
       $checkRule = array(
           "option_name"=>"require",
       );
       $checkMsg = array(
           "option_name.require" => "option_name不能为空",
       );
       $validate = new Validate($checkRule,$checkMsg);
       if (!$validate->check($params)) {
           $this->showFalseJson($validate->getError());
       }

      $CommonService = new CommonService;
      $result =  $CommonService->_option($params);
      if($result['status']){
        $this->showTrueJson($result['data'],$result['msg'],$result['code']);
      }else{
        $this->showFalseJson($result['msg'],$result['code']);
      }
    }


    /**
     * 网站配置信息接口
     * @Author   YHX
     * @DateTime 2019-09-17T12:27:27+0800
     * @return   [type]                   [description]
     */
    public function site_option(){
        $params = input();
        $CommonService = new CommonService;
        $result =  $CommonService->site_option($params);
        if($result['status']){
          $this->showTrueJson($result['data'],$result['msg'],$result['code']);
        }else{
          $this->showFalseJson($result['msg'],$result['code']);
        }
    }







}