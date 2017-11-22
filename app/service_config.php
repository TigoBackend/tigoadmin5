<?php
/*
	放业务相关配置
*/

return [
	/*写日志的模块,所有写日志的模块都需要在此配置*/
	"LOG_MODULE" => [
		"LOGIN" => "登录系统",
		"LOGOUT" => "退出系统",
		"NAV" => "设置-导航管理",
		"NAV_MENU" => "设置-导航管理-导航菜单管理",
		"SLIDE" => "设置-幻灯片管理",
		"SLIDE_ITEM" => "设置-幻灯片管理-幻灯片页面",
		"LINK" => "设置-友情链接",
		"ARTICLE" => "门户管理-文章管理",
		"CATEGORY" => "门户管理-分类管理",
		"PAGE" => "门户管理-页面管理",
		"TAG" => "门户管理-文章标签",
	],
	/*日志类型*/
	"LOG_TYPE" => [
		"UNKNOWN" => 0,
		"ADD" => 1,	/*添加记录*/
		"SAVE" => 2,/*修改记录*/
		"DEL" => 3,/*删除记录*/
	],

];
?>