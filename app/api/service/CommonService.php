<?php  
namespace app\api\service;

use think\Db;
use think\Cache;
use app\api\service\ArticleService;

class CommonService extends BaseService{

	/**
     * 轮播图
     * @param $params
     * @return array
     */
	public function _slide($params){
        $where = array();
        $where['slide_id'] = $params['slide_id'];
        $result = Db::name("slide_item")->field("id as slide_item_id,image,url")->where($where)->order("list_order")->select()->toArray();
        if($result){
            foreach ($result as $k => $v) {
                $result[$k]['image'] = $v['image'] ? cmf_get_image_preview_url($v['image']) : '';
            }
        }

        if($result){
            $data['list'] = $result;
            return array("status"=>true,"msg"=>"获取成功","data"=>$data,"code"=>1);
        }else{
            $data['list'] = [];
            return array("status"=>false,"msg"=>"获取失败","data"=>$data,"code"=>-1);
        }
    }


    /**
     * 上传图片
     * @param $params
     * @return array
     */
    public function _upload_img($params){
        $tmp_result = base64_img_save($params['img']);//上传base64图片
        $result = save_tmp_img($tmp_result['file_name'],$params['type']);
        $data = $result;
        if($result){
            $data['file_name'] = cmf_get_image_preview_url($data['file_name']);
            return array("status"=>true,"msg"=>"上传成功","data"=>$data,"code"=>1);
        }else{
            return array("status"=>false,"msg"=>"上传失败","data"=>[],"code"=>-1);
        }
    }

    /**
	 * 手机生产验证码
	 * @Author   YHX
	 * @DateTime 2017-12-19T10:02:20+0800
	 * @param    [type]                   $params [description]
	 * @return   [type]                           [description]
	 */
	public function verify_code($params){
	  if (!preg_match("/^1[34578]\d{9}$/",$params["phone"])){
            return array("status"=>false,"msg"=>"非法手机号","data"=>[],"code"=>-1);
        }else{
            try{
	            $tel = $params["phone"];
              $type = $params["type"];
              $code = rand(1000,9999);//随机码
	            vendor('ALiYunSMS20170525.index');
	            $sms_sender = new \SmsSender(config('sms_config.access_key_id'),config('sms_config.access_key_secret'));
	            $rs = $sms_sender->sendSms(config('sms_config.sign_name'),config('sms_config.template1'),$tel,['code'=>$code]);
                // dump($rs);die();
	            if (isset($rs->Code) && $rs->Code === 'OK'){
	                /*发送成功执行发送后的逻辑*/
                    //存到缓存中
                    file_cache($tel.$type,$code,180,'VERIFY_CODE');//180秒有效
                    //记录发送记录
                    // add_sms_log($tel,$type);
	                return array("status"=>true,"msg"=>"发送成功","data"=>[],"code"=>1);
	            }else{
	                // add_log("短信发送失败,tel:{$tel},Code:{$rs->Code},Message:{$rs->Message},RequestId:{$rs->RequestId},BizId:{$rs->BizId}");
                    add_log("短信发送失败,tel:{$tel},Code:{$rs->Code},Message:{$rs->Message},RequestId:{$rs->RequestId}");
	                // throw_my_exception('短信业务繁忙,请稍后再试',null,self::CODE_BUSINESS_ERROR);
	                return array("status"=>false,"msg"=>'发送失败',"data"=>[],"code"=>-1);
	            }
	        }catch (MyException $e){
	            // handle_exception($e);
	            // $this->error($e->getMessage());
	            return array("status"=>false,"msg"=>'发送失败',"data"=>[],"code"=>-1);
	        }
        }
	}


	/**
	 * 获取配置信息
	 * @Author   YHX
	 * @DateTime 2018-09-11T18:26:44+0800
	 * @param    [type]                   $params [description]
	 * @return   [type]                           [description]
	 */
	public function _option($params){
		$option_name = $params['option_name'];
        if($option_name=='welcome_android' || $option_name=='welcome_ios' || $option_name=='welcome_ios_x'){
            $option = cmf_get_option('welcome');
        }else{
            $option = cmf_get_option($option_name);
        }
        // dump();die();
        // if($option_name == 'other'){
        //     $option['kefu_qr'] = cmf_get_image_preview_url($option['kefu_qr']);
        //     $option['gzh_qr'] = cmf_get_image_preview_url($option['gzh_qr']);
        // }
        if($option_name == 'invite'){
            $option['invite'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['invite']));
            $option['option'] = $option['invite'];
            unset($option['invite']);
            unset($option['publish_rent_num2']);
            unset($option['publish_machine_num2']);
            unset($option['view_rent_num2']);
            unset($option['view_machine_num2']);
            unset($option['fail_rent_num2']);
            unset($option['fail_machine_num2']);
            unset($option['publish_rent_num3']);
            unset($option['publish_machine_num3']);
            unset($option['view_rent_num3']);
            unset($option['view_machine_num3']);
            unset($option['fail_rent_num3']);
            unset($option['fail_machine_num3']);
            unset($option['publish_rent_num4']);
            unset($option['publish_machine_num4']);
            unset($option['view_rent_num4']);
            unset($option['view_machine_num4']);
            unset($option['fail_rent_num4']);
            unset($option['fail_machine_num4']);
            unset($option['normal_num']);
            unset($option['star_num']);
        }
        if($option_name == 'company_introduce'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['company_introduce']));
            unset($option['company_introduce']);
        }
        if($option_name == 'star_level'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['star_level']));
            unset($option['star_level']);
        }
        if($option_name == 'real_name'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['real_name']));
            unset($option['real_name']);
        }
        if($option_name == 'deal'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['deal']));
            unset($option['deal']);
        }
        if($option_name == 'kefu_time'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['kefu_time']));
            unset($option['kefu_time']);
        }
        if($option_name == 'about_us'){
            $android_version = cmf_get_option('android');
            $option['version'] = $android_version['versionName'];
            // unset($option['kefu_time']);
        }
        if($option_name == 'android'){
            $option['version_url'] = cmf_get_image_preview_url($option['version_url']);
        }
        if($option_name == 'ios'){
            $option['option'] = $option['ios_version_url'];
            unset($option['ios_version_url']);
        }
        if($option_name == 'invite_nums'){
            $option = cmf_get_option('invite');
            $option['invite'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['invite']));
            unset($option['invite']);
        }
        if($option_name == 'company_adjust'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['company_adjust']));
            unset($option['company_adjust']);
        }
        if($option_name == 'privacy_policy'){
            $option['option'] = cmf_replace_content_file_url(htmlspecialchars_decode($option['privacy_policy']));
            unset($option['privacy_policy']);
        }
        if($option_name == 'welcome_android'){
            $option['option'] = cmf_get_image_preview_url($option['welcome_android']);
            unset($option['welcome_android']);
            unset($option['welcome_ios']);
            unset($option['welcome_ios_x']);
            unset($option['welcome']);
        }
        if($option_name == 'welcome_ios'){
            $option['option'] = cmf_get_image_preview_url($option['welcome_ios']);
            unset($option['welcome_android']);
            unset($option['welcome_ios']);
            unset($option['welcome_ios_x']);
            unset($option['welcome']);
        }
        if($option_name == 'welcome_ios_x'){
            $option['option'] = cmf_get_image_preview_url($option['welcome_ios_x']);
            unset($option['welcome_android']);
            unset($option['welcome_ios']);
            unset($option['welcome_ios_x']);
            unset($option['welcome']);
        }
      	$result = $option;
      	if($result){
            return array("status"=>true,"msg"=>"获取成功","data"=>$result,"code"=>1);
        }else{
            return array("status"=>false,"msg"=>"获取失败","data"=>[],"code"=>-1);
        }
	}


   //省市区联动
    public static function area_list(){

        $result = get_file_cache('tree','city');
        if (empty($result)){
            $provinces = Db::name('Areas')
                ->alias('a')
                ->where(['a.is_show'=>1,'areas_type'=>0,'a.flag'=>1])
                ->field(['a.id','a.name as value'])
                ->select();
            if (empty($provinces)) return [];
            $result = $provinces->jsonSerialize();
            foreach ($result as $k => $province){
                $cities = Db::name('Areas')
                    ->alias('a')
                    ->where(['a.parent_id'=>$province['id'],'a.is_show'=>1,'areas_type'=>1,'a.flag'=>1])
                    ->field(['a.id','a.parent_id','a.name as value','a.initials_key'])
                    ->order('a.initials_key')
                    ->select();
                $cities = empty($cities) ? [] : $cities->jsonSerialize();
                foreach ($cities as $key=>$city){
                    $region = Db::name('Areas')
                        ->alias('region')
                        ->where(['region.parent_id'=>$city['id'],'region.flag'=>1,'region.is_show'=>1])
                        ->field(['region.id','region.parent_id','region.name as value'])
                        ->order('sort desc')
                        ->select();
                    $cities[$key]['regions'] = empty($region) ? [] : $region->jsonSerialize();
                }
                $result[$k]['cities'] = $cities;
            }
            file_cache('tree',$result,3600,'city');
        }
        return array("status"=>true,"msg"=>"查询成功","data"=>['list'=>$result],"code"=>1);


    }


    /**
     * 网站配置信息接口
     * @Author   YHX
     * @DateTime 2019-09-17T17:05:35+0800
     * @return   [type]                   [description]
     */
    public function site_option(){
        $site_info = cmf_get_option('site_info');
        $article_category = Db::name('article_category')->where(['delete_time'=>0])->field('ac_id,ac_title_zh,ac_title_en,ac_icon,ac_route')->select()->toArray();
        $links = Db::name('link')->where(['status'=>1])->field('id,name,url,image,target')->order('list_order asc,id asc')->select()->toArray();
        $search_keywords = get_search_keywords();

        foreach ($article_category as $k => $v) {
            $article_category_zh[$k]['ac_id'] = $v['ac_id'];
            $article_category_zh[$k]['ac_title'] = $v['ac_title_zh'];
            $article_category_zh[$k]['ac_icon'] = $v['ac_icon'];
            $article_category_zh[$k]['ac_route'] = $v['ac_route'];
            $article_category_en[$k]['ac_id'] = $v['ac_id'];
            $article_category_en[$k]['ac_title'] = $v['ac_title_en'];
            $article_category_en[$k]['ac_icon'] = $v['ac_icon'];
            $article_category_en[$k]['ac_route'] = $v['ac_route'];

        }

        $zh = [
            'site_name'=>$site_info['site_name'],
            'seo_title'=>$site_info['site_seo_title'],
            'seo_keyword'=>$site_info['site_seo_keywords'],
            'seo_description'=>$site_info['site_seo_description'],
            'site_icp'=>$site_info['site_icp'],
            'site_copyright'=>$site_info['site_copyright'],
            'article_category'=>$article_category_zh,
            'links'=>$links,
            'search_keywords'=>$search_keywords,
        ];

        $en = [
            'site_name'=>$site_info['site_name'],
            'seo_title'=>$site_info['site_seo_title'],
            'seo_keyword'=>$site_info['site_seo_keywords'],
            'seo_description'=>$site_info['site_seo_description'],
            'site_icp'=>$site_info['site_icp'],
            'site_copyright'=>$site_info['site_copyright'],
            'article_category'=>$article_category_en,
            'links'=>$links,
            'search_keywords'=>$search_keywords,
        ];

        $result = ['zh'=>$zh,'en'=>$en];
        return array("status"=>true,"msg"=>"获取成功","data"=>$result,"code"=>1);
        
    }

	
}