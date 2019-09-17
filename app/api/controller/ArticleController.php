<?php
/**
 * yhx2019-1-17
 * 文章接口
 */
namespace app\api\controller;


use think\Request;
use think\Validate;
use think\Cache;
use app\api\service\ArticleService;
// use cmf\controller\CaptchaController;
use cmf\lib\Upload;


class ArticleController extends BaseController
{
	/**
	 * 机械宝典文章分类
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function article_type(){
		$params = input();

		$ArticleService = new ArticleService;
		$result =  $ArticleService->article_type($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}

	


	/**
	 * 机械宝典文章详情
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function article_detail(){
		$params['article_id'] = input('article_id');
		$params['member_id'] = input('member_id');

		$checkRule = array(
			"article_id"=>"require",
		);
		$checkMsg = array(
			"article_id.require" => "文章id不能为空",
		);
		$validate = new Validate($checkRule,$checkMsg);
		if (!$validate->check($params)) {
			$this->showFalseJson($validate->getError());
		}

		$ArticleService = new ArticleService;
		$result =  $ArticleService->article_detail($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}


	/**
	 * 机械宝典文章评论列表
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function comment_list(){
		$params['article_id'] = input('article_id');
		$params["page"] = input("page",1);
		$params["page_size"] = input("page_size",10);
		$checkRule = array(
			"article_id"=>"require",
		);
		$checkMsg = array(
			"article_id.require" => "文章id不能为空",
		);
		$validate = new Validate($checkRule,$checkMsg);
		if (!$validate->check($params)) {
			$this->showFalseJson($validate->getError());
		}

		$ArticleService = new ArticleService;
		$result =  $ArticleService->comment_list($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}


	/**
	 * 机械宝典文章评论
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function comment(){
		$params['article_id'] = input('article_id');
		$params['member_id'] = input('member_id');
		$params['content'] = input('content');

		$checkRule = array(
			"article_id"=>"require",
			"member_id"=>"require",
			"content"=>"require",
		);
		$checkMsg = array(
			"article_id.require" => "文章id不能为空",
			"member_id.require" => "用户id不能为空",
			"content.require" => "评论内容不能为空",
		);
		$validate = new Validate($checkRule,$checkMsg);
		if (!$validate->check($params)) {
			$this->showFalseJson($validate->getError());
		}

		$ArticleService = new ArticleService;
		$result =  $ArticleService->comment($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}



	/**
	 * 文章点赞
	 * @Author   YHX
	 * @DateTime 2019-04-16T12:16:30+0800
	 * @return   [type]                   [description]
	 */
	public function like(){
		$params['article_id'] = input('article_id');
		$params['member_id'] = input('member_id');

		$checkRule = array(
			"article_id"=>"require",
			"member_id"=>"require",
		);
		$checkMsg = array(
			"article_id.require" => "文章id不能为空",
			"member_id.require" => "用户id不能为空",
		);
		$validate = new Validate($checkRule,$checkMsg);
		if (!$validate->check($params)) {
			$this->showFalseJson($validate->getError());
		}

		$ArticleService = new ArticleService;
		$result =  $ArticleService->like($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}


	/**
	 * 首页文章列表
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function home_list(){
		$params = [];
		$params['lang'] = input('lang','en');
		$ArticleService = new ArticleService;
		$result =  $ArticleService->home_list($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}

	/**
	 * 文章列表
	 * @Author   YHX
	 * @DateTime 2019-03-05T17:55:06+0800
	 * @return   [type]                   [description]
	 */
	public function article_list(){
		$params['keyword'] = input('keyword');
		$params['ac_id'] = input('ac_id');
		$params['lang'] = input('lang','en');
		$params["page"] = input("page",1);
		$params["page_size"] = input("page_size",10);
		// $checkRule = array(
		// 	"member_id"=>"require",
		// 	"token"=>"require",
		// );
		// $checkMsg = array(
		// 	"member_id.require" => "用户id不能为空",
		// 	"token.require" => "token不能为空",
		// );
		// $validate = new Validate($checkRule,$checkMsg);
		// if (!$validate->check($params)) {
		// 	$this->showFalseJson($validate->getError());
		// }

		$ArticleService = new ArticleService;
		$result =  $ArticleService->article_list($params);
		if($result['status']){
        	$this->showTrueJson($result['data'],$result['msg'],$result['code']);
      	}else{
        	$this->showFalseJson($result['msg'],$result['code']);
      	}
	}


}