<?php  
namespace app\api\service;

use think\Db;
use think\Cache;

class ArticleService extends BaseService{

	/**
     * 机械宝典文章分类
     * @Author   YHX
     * @DateTime 2018-09-11T18:26:44+0800
     * @param    [type]                   $params [description]
     * @return   [type]                           [description]
     */
    public function article_type($params){
        $article_type_list = get_article_type_list();
        $result = $article_type_list;
        if($result){
            $data['list'] = $result;
            return array("status"=>true,"msg"=>"获取成功","data"=>$data,"code"=>1);
        }else{
            $data['list'] = [];
            return array("status"=>false,"msg"=>"获取失败","data"=>$data,"code"=>-1);
        }
    }


    /**
     * 机械宝典文章列表
     * @Author   YHX
     * @DateTime 2018-09-11T18:26:44+0800
     * @param    [type]                   $params [description]
     * @return   [type]                           [description]
     */
    public function article_list($params){
        $where = array();
        
        if(isset($params['at_id'])){
            $where['at_id'] = $params['at_id'];
        }
        if(isset($params['keyword'])){
            $where['article_name'] = array('like','%'.$params['keyword'].'%');
        }
        $where['delete_time'] = 0;

        $start = ($params["page"]-1)*$params["page_size"];
        $order = "list_order DESC,create_time DESC";
        $fields = "article_id,at_id,article_name,article_thumb,article_click,article_like,create_time";
        $list = Db::name("article")
            ->field($fields)
            ->order($order)
            ->where($where)
            ->limit($start,$params["page_size"])
            ->select()
            ->toArray();

        if($list){
            foreach ($list as $k => $v) {
                $list[$k]['at_name'] = $v['at_id'] ? get_article_type_name($v['at_id']) : '';
                $list[$k]['article_thumb'] = $v['article_thumb'] ? cmf_get_image_preview_url($v['article_thumb']) : '';
                $list[$k]['article_comment'] = get_article_comment_nums($v['article_id']);
                $list[$k]['create_time'] = $v['create_time'] ? date('Y-m-d H:i:s',$v['create_time']) : '';
            }
            $data['list'] = $list;
            return array("status"=>true,"msg"=>"查询成功","data"=>$data,"code"=>1);
        }else{
        	$data['list'] = [];
            return array("status"=>true,"msg"=>"查询成功，数据为空","data"=>$data,"code"=>1);
        }
    }


    /**
     * 机械宝典文章详情
     * @Author   YHX
     * @DateTime 2018-09-13T12:07:24+0800
     * @return   [type]                   [description]
     */
    public function article_detail($params){
    	//增加点击量
    	if(isset($params['member_id']) && isset($params['article_id'])){
    		$article_Inc = Db::name("article")->where(['article_id'=>$params['article_id']])->setInc('article_click');
    	}
    	
        $where = array();
        
        $where['article_id'] = $params['article_id'];
        $where['delete_time'] = 0;
        
        $fields = "article_id,at_id,article_name,article_thumb,article_click,article_like,article_content,create_time";
        $result = Db::name("article")->where($where)->field($fields)->find();
        if($result){
            $result["at_name"] = $result['at_id'] ? get_article_type_name($result['at_id']) : '';
            $result["is_like"] = isset($params['member_id']) ? get_article_is_like($params['member_id'],$result['article_id']) : 2;
            $result["is_collect"] = isset($params['member_id']) ? get_article_is_collect($params['member_id'],$result['article_id']) : 2;
            $result['article_thumb'] = $result['article_thumb'] ? cmf_get_image_preview_url($result['article_thumb']) : '';
            $result['article_content'] = $result['article_content'] ? cmf_replace_content_file_url(htmlspecialchars_decode($result['article_content'])) : '';
            $result['article_comment'] = get_article_comment_nums($result['article_id']);
            $result['create_time'] = $result['create_time'] ? date('Y-m-d H:i:s',$result['create_time']) : '';
            $result['comment_list'] = $this->get_article_comment_list($result['article_id']);

            return array("status"=>true,"msg"=>"查询成功","data"=>$result,"code"=>1);
        }else{
            return array("status"=>true,"msg"=>"查询成功，数据为空","data"=>[],"code"=>1);
        }
    }


    /**
     * 获取文章评论列表(5条)
     * @Author   YHX
     * @DateTime 2019-03-08T11:44:01+0800
     * @param    [type]                   $article_id [description]
     * @return   [type]                               [description]
     */
    public function get_article_comment_list($article_id){
        $where = array();
        
        $where['ac_status'] = 1;
        $where['adjust_status'] = 1;
        $where['article_id'] = $article_id; 
        $where['a.delete_time'] = 0;

        // $start = ($params["page"]-1)*$params["page_size"];
        $order = "a.update_time DESC";
        $fields = "ac_id,article_id,a.member_id,content,return_content,ac_like,ac_status,a.create_time,member_name,member_avatar";
        $list = Db::name("article_comment")
            ->alias('a')
            ->join('cmf_member b','a.member_id = b.member_id','left')
            ->field($fields)
            ->order($order)
            ->where($where)
            ->limit(5)
            ->select()
            ->toArray();

        if($list){
            foreach ($list as $k => $v) {
                $list[$k]['member_avatar'] = $v['member_avatar'] ? cmf_get_image_preview_url($v['member_avatar']) : config('default_avatar');
                $list[$k]['create_time'] = $v['create_time'] ? date('Y-m-d H:i:s',$v['create_time']) : '';
            }
            
        }else{
            
        }
        return $list;
    }


    /**
     * 机械宝典文章评论列表
     * @Author   YHX
     * @DateTime 2018-09-11T18:26:44+0800
     * @param    [type]                   $params [description]
     * @return   [type]                           [description]
     */
    public function comment_list($params){
        $where = array();
        
        $where['ac_status'] = 1;
        $where['adjust_status'] = 1;
        $where['article_id'] = $params['article_id']; 
        $where['a.delete_time'] = 0;

        $start = ($params["page"]-1)*$params["page_size"];
        $order = "a.update_time DESC";
        $fields = "ac_id,article_id,a.member_id,content,return_content,ac_like,ac_status,a.create_time,member_name,member_avatar";
        $list = Db::name("article_comment")
            ->alias('a')
            ->join('cmf_member b','a.member_id = b.member_id','left')
            ->field($fields)
            ->order($order)
            ->where($where)
            ->limit($start,$params["page_size"])
            ->select()
            ->toArray();

        if($list){
            foreach ($list as $k => $v) {
                $list[$k]['member_avatar'] = $v['member_avatar'] ? cmf_get_image_preview_url($v['member_avatar']) : config('default_avatar');
                $list[$k]['create_time'] = $v['create_time'] ? date('Y-m-d H:i:s',$v['create_time']) : '';
            }
            $result['list'] = $list;
            return array("status"=>true,"msg"=>"查询成功","data"=>$result,"code"=>1);
        }else{
            $result['list'] = [];
            return array("status"=>true,"msg"=>"查询成功，数据为空","data"=>$result,"code"=>1);
        }
    }


    /**
     * 机械宝典文章评论
     * @Author   YHX
     * @DateTime 2019-03-06T11:03:02+0800
     * @param    [type]                   $params [description]
     */
    public function comment($params){
        try {
            start_trans();
            
            $data['member_id'] = $params['member_id'];
            $data['article_id'] = $params['article_id'];
            $data['content'] = $params['content'];
            $data['create_time'] = time();
            $data['update_time'] = time();

            $result = Db::name('article_comment')->insertGetId($data);

            if($result){
                commit_trans();
                return array("status"=>true,"msg"=>"评论成功","data"=>(object)[],"code"=>1);
            }else{
                end_trans();
                return array("status"=>false,"msg"=>"评论失败".$result,"data"=>(object)[],"code"=>-1);
            }
        } catch (\Exception $e) {
            // dump($e);
            // die();
            add_log($e);
            end_trans($e);
            return array("status"=>false,"msg"=>"评论失败","data"=>(object)[],"code"=>-100);
        }
    }


    /**
     * 文章点赞
     * @Author   YHX
     * @DateTime 2019-03-06T11:03:02+0800
     * @param    [type]                   $params [description]
     */
    public function like($params){
        try {
            start_trans();
            
            $where['member_id'] = $params['member_id'];
            $where['article_id'] = $params['article_id'];
            $where['delete_time'] = time();
            $has_like = Db::name('article_like')->where($where)->find();
            if($has_like){
                return array("status"=>false,"msg"=>"已经点赞过","data"=>(object)[],"code"=>-1);
            }

            $data['member_id'] = $params['member_id'];
            $data['article_id'] = $params['article_id'];
            $data['create_time'] = time();
            $data['update_time'] = time();

            $result = Db::name('article_like')->insertGetId($data);

            if($result){
                $res = Db::name('article')->where(['article_id'=>$params['article_id']])->setInc('article_like');
                commit_trans();
                return array("status"=>true,"msg"=>"点赞成功","data"=>(object)[],"code"=>1);
            }else{
                end_trans();
                return array("status"=>false,"msg"=>"点赞失败".$result,"data"=>(object)[],"code"=>-1);
            }
        } catch (\Exception $e) {
            // dump($e);
            // die();
            add_log($e);
            end_trans($e);
            return array("status"=>false,"msg"=>"点赞失败","data"=>(object)[],"code"=>-100);
        }
    }


    /**
     * 首页文章列表
     * @Author   YHX
     * @DateTime 2018-09-11T18:26:44+0800
     * @param    [type]                   $params [description]
     * @return   [type]                           [description]
     */
    public function home_list($params){
        $lang = $params['lang'];
        $where = array();
        $where['a.delete_time'] = 0;

        // $start = ($params["page"]-1)*$params["page_size"];
        $order = "a.create_time DESC";
        if($lang == 'zh'){
            $fields = "article_id,a.ac_id,thumb,ac_title_zh as ac_title,title_zh as title,publish_time";
            $slide_fields = "id,content,title,description,author,image,url";
        }else{
            $fields = "article_id,a.ac_id,thumb,ac_title_en as ac_title,title_en as title,publish_time";
            $slide_fields = "id,content_en as content,title_en as title,description_en as description,author_en as author,image,url";
        }
        
        $list = Db::name("article")
            ->alias('a')
            ->join('article_category b','a.ac_id = b.ac_id','left')
            ->field($fields)
            ->order($order)
            ->where($where)
            // ->limit($start,$params["page_size"])
            ->limit(6)
            ->select()
            ->toArray();

        $slides = Db::name("slide_item")->field($slide_fields)->where(['slide_id'=>1])->order("list_order asc")->select()->toArray();
        $ad = Db::name("slide_item")->field($slide_fields)->where(['slide_id'=>2])->order("list_order asc")->select()->toArray();

        if($list){
            foreach ($list as $k => $v) {
                $list[$k]['thumb'] = $v['thumb'] ? cmf_get_image_preview_url($v['thumb']) : '';
                $list[$k]['publish_time'] = $v['publish_time'] ? date('Y-m-d H:i:s',$v['publish_time']) : '';
            }
            // return $list;
            $result['list'] = $list;
            $result['slides'] = $slides;
            $result['ad'] = $ad;
            return array("status"=>true,"msg"=>"查询成功","data"=>$result,"code"=>1);
        }else{
            // return [];
            $result['list'] = [];
            $result['slides'] = $slides;
            $result['ad'] = $ad;
            return array("status"=>true,"msg"=>"查询成功，数据为空","data"=>$result,"code"=>1);
        }
    }


    /**
     * 文章列表
     * @Author   YHX
     * @DateTime 2018-09-11T18:26:44+0800
     * @param    [type]                   $params [description]
     * @return   [type]                           [description]
     */
    public function article_list($params){
        $where = array();
        
        if(isset($params['ac_id'])){
            $where['ac_id'] = $params['ac_id'];
        }
        if(isset($params['keyword'])){
            $where['title_zh|title_en|subtitle_zh|subtitle_en|text1_zh|text2_zh|text3_zh|text4_zh|text5_zh|text6_zh|text1_en|text2_en|text3_en|text4_en|text5_en|text5_en'] = array('like','%'.$params['keyword'].'%');
        }
        $where['delete_time'] = 0;

        $start = ($params["page"]-1)*$params["page_size"];
        $order = "list_order DESC,create_time DESC";
        $fields = "article_id,at_id,article_name,article_thumb,article_click,article_like,create_time";
        $list = Db::name("article")
            ->field($fields)
            ->order($order)
            ->where($where)
            ->limit($start,$params["page_size"])
            ->select()
            ->toArray();

        if($list){
            foreach ($list as $k => $v) {
                $list[$k]['at_name'] = $v['at_id'] ? get_article_type_name($v['at_id']) : '';
                $list[$k]['article_thumb'] = $v['article_thumb'] ? cmf_get_image_preview_url($v['article_thumb']) : '';
                $list[$k]['article_comment'] = get_article_comment_nums($v['article_id']);
                $list[$k]['create_time'] = $v['create_time'] ? date('Y-m-d H:i:s',$v['create_time']) : '';
            }
            $data['list'] = $list;
            return array("status"=>true,"msg"=>"查询成功","data"=>$data,"code"=>1);
        }else{
            $data['list'] = [];
            return array("status"=>true,"msg"=>"查询成功，数据为空","data"=>$data,"code"=>1);
        }
    }


}