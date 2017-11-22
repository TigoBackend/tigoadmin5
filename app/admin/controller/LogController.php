<?php
namespace app\admin\controller;
/*用户操作记录*/
use cmf\controller\AdminBaseController;
use think\Db;
// use app\admin\model\LogModel;
class LogController extends AdminbaseController{

	protected $log_model;

	public function _initialize() {
		parent::_initialize();
		$this->log_model = DB::name("Log");
	}
	// 操作日志列表
	public function index(){
		/**搜索条件**/
		$where = array();
		$user_login = htmlspecialchars_decode(trim(input("user_login")));
		$module = htmlspecialchars_decode(trim(input('module')));		
		$describe = htmlspecialchars_decode(trim(input('describe')));		
		if($user_login){
			$where['u.user_login'] = array('like',"%$user_login%");
		}
		if($module){
			$where['l.module_name'] = array('like',"%$module%");
		}
		if($describe){
			$where['l.describe'] = array('like',"%$describe%");
		}
		$field = "log_id,u.user_login,module_name,action_type,describe,login_ip,FROM_UNIXTIME(l.create_time) as create_time";
        $log_list = $this->log_model
        		 ->alias('l')
        		 ->field($field)
        		 ->join("cmf_user u","u.id = l.user_id","left")//->join("left join cmf_users u on u.id = l.user_id")
         	     ->where($where)
         	     ->order("create_time DESC")
         	     ->paginate(10);
         //    ->limit($page->firstRow, $page->listRows)
            // ->select();
        // 获取分页显示
        $page = $log_list->render();            
		$this->assign("page", $page);
		$this->assign("log_list",$log_list);
		return $this->fetch();
		
	}
}