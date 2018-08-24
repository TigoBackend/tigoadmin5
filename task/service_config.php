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
//	"globals" => "\"slide_list\":[{\"title\":\"客户端广告1\",\"image\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"url\":\"http://tigonetwork.com/\",\"h_id\":0},{\"title\":\"客户端广告1\",\"image\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"url\":\"http://tigonetwork.com/\",\"h_id\":0}],\"icon\":[{\"i_key\":\"land_mark\",\"i_title\":\"地标找房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"map\",\"i_title\":\"地图找房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"villa\",\"i_title\":\"别墅\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"condo\",\"i_title\":\"公寓\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"bungalow\",\"i_title\":\"洋房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"office\",\"i_title\":\"写字楼\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"shop\",\"i_title\":\"店铺\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"}],\"houses_information\":[{\"id\":1,\"name\":\"政策动态\",\"description\":\"了解购房新政策\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"id\":2,\"name\":\"城市动态\",\"description\":\"了解城市动态\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"id\":3,\"name\":\"其他动态\",\"description\":\"了了解其他动态\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"}],\"houses_wiki\":[{\"name\":\"准备买房\",\"list\":[{\"id\":2,\"name\":\"购房资格\"},{\"id\":2,\"name\":\"房产政策\"},{\"id\":2,\"name\":\"选区域\"},{\"id\":2,\"name\":\"选房价\"},{\"id\":2,\"name\":\"选户型\"}]},{\"name\":\"签约认购\",\"list\":[{\"id\":2,\"name\":\"购房资格\"},{\"id\":2,\"name\":\"房产政策\"},{\"id\":2,\"name\":\"选区域\"},{\"id\":2,\"name\":\"选房价\"},{\"id\":2,\"name\":\"选户型\"}]},{\"name\":\"看房选房\",\"list\":[{\"id\":2,\"name\":\"购房资格\"},{\"id\":2,\"name\":\"房产政策\"},{\"id\":2,\"name\":\"选区域\"},{\"id\":2,\"name\":\"选房价\"},{\"id\":2,\"name\":\"选户型\"}]}],\"houses_decoration\":[{\"hd_id\":1,\"hd_name\":\"毛坯\"},{\"hd_id\":1,\"hd_name\":\"简装\"},{\"hd_id\":1,\"hd_name\":\"精装\"}],\"building_areas\":[{\"hsba_min_building_areas\":0,\"hsba_max_building_areas\":50,},{\"hsba_min_building_areas\":90,\"hsba_max_building_areas\":120,},{\"hsba_min_building_areas\":300,\"hsba_max_building_areas\":0,}],\"per_sales_price\":[{\"hspp_min_per_sales_price\":0,\"hspp_max_per_sales_price\":5000,},{\"hspp_min_per_sales_price\":6000,\"hspp_max_per_sales_price\":10000,},{\"hspp_min_per_sales_price\":30000,\"hspp_max_per_sales_price\":0,}],\"city_region\":[{\"alm_id\":1,\"alm_name\":\"东莞周边\",\"alm_longitude\":12.036232365,\"alm_latitude\":12.036232365,\"region_list\":[{\"a_id\":1,\"a_name\":\"南城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365},{\"a_id\":2,\"a_name\":\"东城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365}]},{\"alm_id\":1,\"alm_name\":\"中心城区\",\"alm_longitude\":12.036232365,\"alm_latitude\":12.036232365,\"region_list\":[{\"a_id\":3,\"a_name\":\"莞城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365},{\"a_id\":4,\"a_name\":\"万江\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365}]}],\"total_sales_price\":[{\"hstp_min_total_sales_price\":0,\"hstp_max_total_sales_price\":5000},{\"hstp_min_total_sales_price\":6000,\"hstp_max_total_sales_price\":10000},{\"hstp_min_total_sales_price\":30000,\"hstp_max_total_sales_price\":0}]}",
	"globals" => "{\"slide_list\":[{\"title\":\"客户端广告1\",\"image\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"url\":\"http://tigonetwork.com/\",\"h_id\":0},{\"title\":\"客户端广告1\",\"image\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"url\":\"http://tigonetwork.com/\",\"h_id\":0}],\"icon\":[{\"i_key\":\"land_mark\",\"i_title\":\"地标找房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"map\",\"i_title\":\"地图找房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"villa\",\"i_title\":\"别墅\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"condo\",\"i_title\":\"公寓\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"bungalow\",\"i_title\":\"洋房\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"office\",\"i_title\":\"写字楼\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"i_key\":\"shop\",\"i_title\":\"店铺\",\"i_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"}],\"houses_information\":[{\"hin_id\":1,\"name\":\"政策动态\",\"desc\":\"了解购房新政策\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"hin_id\":2,\"name\":\"城市动态\",\"desc\":\"了解城市动态\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"},{\"hin_id\":3,\"name\":\"其他动态\",\"desc\":\"了了解其他动态\",\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"}],\"houses_wiki\":[{\"name\":\"准备买房\",\"list\":[{\"hw_id\":2,\"name\":\"购房资格\"},{\"hw_id\":2,\"name\":\"房产政策\"},{\"hw_id\":2,\"name\":\"选区域\"},{\"hw_id\":2,\"name\":\"选房价\"},{\"hw_id\":2,\"name\":\"选户型\"}]},{\"name\":\"签约认购\",\"list\":[{\"hw_id\":2,\"name\":\"购房资格\"},{\"hw_id\":2,\"name\":\"房产政策\"},{\"hw_id\":2,\"name\":\"选区域\"},{\"hw_id\":2,\"name\":\"选房价\"},{\"hw_id\":2,\"name\":\"选户型\"}]},{\"name\":\"看房选房\",\"list\":[{\"hw_id\":2,\"name\":\"购房资格\"},{\"hw_id\":2,\"name\":\"房产政策\"},{\"hw_id\":2,\"name\":\"选区域\"},{\"hw_id\":2,\"name\":\"选房价\"},{\"hw_id\":2,\"name\":\"选户型\"}]}],\"houses_decoration\":[{\"hd_id\":1,\"hd_name\":\"毛坯\"},{\"hd_id\":1,\"hd_name\":\"简装\"},{\"hd_id\":1,\"hd_name\":\"精装\"}],\"building_areas\":[{\"hsba_min_building_areas\":0,\"hsba_max_building_areas\":50},{\"hsba_min_building_areas\":90,\"hsba_max_building_areas\":120},{\"hsba_min_building_areas\":300,\"hsba_max_building_areas\":0}],\"per_sales_price\":[{\"hspp_min_per_sales_price\":0,\"hspp_max_per_sales_price\":5000},{\"hspp_min_per_sales_price\":6000,\"hspp_max_per_sales_price\":10000},{\"hspp_min_per_sales_price\":30000,\"hspp_max_per_sales_price\":0}],\"city_region\":[{\"alm_id\":1,\"alm_name\":\"东莞周边\",\"alm_longitude\":12.036232365,\"alm_latitude\":12.036232365,\"region_list\":[{\"a_id\":1,\"a_name\":\"南城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365},{\"a_id\":2,\"a_name\":\"东城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365}]},{\"alm_id\":1,\"alm_name\":\"中心城区\",\"alm_longitude\":12.036232365,\"alm_latitude\":12.036232365,\"region_list\":[{\"a_id\":3,\"a_name\":\"莞城\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365},{\"a_id\":4,\"a_name\":\"万江\",\"a_longitude\":12.036232365,\"a_latitude\":12.036232365}]}],\"total_sales_price\":[{\"hstp_min_total_sales_price\":0,\"hstp_max_total_sales_price\":5000},{\"hstp_min_total_sales_price\":6000,\"hstp_max_total_sales_price\":10000},{\"hstp_min_total_sales_price\":30000,\"hstp_max_total_sales_price\":0}]}",
	"areas" => "{\"province_list\":[{\"areas_id\":440000,\"areas_name\":\"广东省\",\"cities\":[{\"areas_id\":441900,\"areas_name\":\"东莞市\",\"regions\":[{\"areas_id\":820337,\"areas_name\":\"沙田镇（虎门港）\"},{\"areas_id\":820336,\"areas_name\":\"长安镇（东莞长安新区）\"}]},{\"areas_id\":440100,\"areas_name\":\"广州市\",\"regions\":[{\"areas_id\":440118,\"areas_name\":\"增城区\"},{\"areas_id\":440117,\"areas_name\":\"从化区\"}]}]}]}",
	"houses_information"=>"{\"post_list\":[{\"post_id\":1,\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"post_title\":\"政策动态测试文章1\",\"post_hits\":100,\"update_time_mark\":\"2018-01-01\"},{\"post_id\":2,\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"post_title\":\"政策动态测试文章2\",\"post_hits\":100,\"update_time_mark\":\"2018-01-01\"},{\"post_id\":3,\"thumbnail\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"post_title\":\"政策动态测试文章3\",\"post_hits\":100,\"update_time_mark\":\"2018-01-01\"}]}",
	"recommend" => "{\"guess_list\":[{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]},{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]}]}",
//	"imgs" => "{\"effect_list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"],\"real_list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"],\"position_list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"],\"surporting_list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"],\"license_list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]}",
	"imgs" => "{\"effect_list\":{\"hi_title\":\"万达城市华庭\",\"hi_description\":\"万达电商通过打通腾讯、百度、万达等线上线下资源，整合多项互联网技术，创造了由通用积分联盟、大会员体系、一卡通、大数据等组成的全业务管理平台，可以帮助实体商业更好更快地向“互联网+”转型，促进实体商业迸发新活力。\",\"imgs\":[\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]},\"real_list\":{\"hi_title\":\"万达城市华庭\",\"hi_description\":\"万达电商通过打通腾讯、百度、万达等线上线下资源，整合多项互联网技术，创造了由通用积分联盟、大会员体系、一卡通、大数据等组成的全业务管理平台，可以帮助实体商业更好更快地向“互联网+”转型，促进实体商业迸发新活力。\",\"imgs\":[\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]},\"position_list\":{\"hi_title\":\"万达城市华庭\",\"hi_description\":\"万达电商通过打通腾讯、百度、万达等线上线下资源，整合多项互联网技术，创造了由通用积分联盟、大会员体系、一卡通、大数据等组成的全业务管理平台，可以帮助实体商业更好更快地向“互联网+”转型，促进实体商业迸发新活力。\",\"imgs\":[\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]},\"surporting_list\":{\"hi_title\":\"万达城市华庭\",\"hi_description\":\"万达电商通过打通腾讯、百度、万达等线上线下资源，整合多项互联网技术，创造了由通用积分联盟、大会员体系、一卡通、大数据等组成的全业务管理平台，可以帮助实体商业更好更快地向“互联网+”转型，促进实体商业迸发新活力。\",\"imgs\":[\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]},\"license_list\":{\"hi_title\":\"万达城市华庭\",\"hi_description\":\"万达电商通过打通腾讯、百度、万达等线上线下资源，整合多项互联网技术，创造了由通用积分联盟、大会员体系、一卡通、大数据等组成的全业务管理平台，可以帮助实体商业更好更快地向“互联网+”转型，促进实体商业迸发新活力。\",\"imgs\":[\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"http://tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]}}",
	"sales" => "{\"sales_list\":[{\"us_avatar\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"us_nickname\":\"销售姓名\",\"us_mobile\":\"13728281818\"},{\"us_avatar\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"us_nickname\":\"销售姓名\",\"us_mobile\":\"13728281818\"},{\"us_avatar\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"us_nickname\":\"销售姓名\",\"us_mobile\":\"13728281818\"}]}",
	"dynamic" => "{\"dynamic_list\":[{\"hd_id\":1,\"hd_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hd_title\":\"标题\",\"hd_excerpt\":\"摘要\",\"hd_hits\":\"111\",\"update_time_mark\":\"2018-01-01\"},{\"hd_id\":1,\"hd_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hd_title\":\"标题\",\"hd_excerpt\":\"摘要\",\"hd_hits\":\"111\",\"update_time_mark\":\"2018-01-01\"},{\"hd_id\":1,\"hd_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hd_title\":\"标题\",\"hd_excerpt\":\"摘要\",\"hd_hits\":\"111\",\"update_time_mark\":\"2018-01-01\"}]}",
	"building" => "{\"houses_distribution\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"building_list\":[{\"hb_id\":1,\"hb_name\":\"楼栋名\",\"hb_position_x\":100,\"hb_position_y\":200,\"hb_open_time_mark\":\"2018-01-01\",\"hb_handover_time_mark\":\"2018-01-01\",\"hb_unit\":\"单元号\",\"hb_floor\":11,\"household\":100,\"hb_type\":\"2梯4户\",\"houses_style\":[{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_room\":3,\"hs_hall\":2,\"hs_wc\":1,\"hs_building_area\":100,\"hs_title\":\"户型名称\",\"hs_total_sales_price\":100,\"hs_per_sales_price\":10000,\"hs_toward\":\"坐北朝南\"}]}]}",
	"style" => "{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_id\":1,\"h_name\":\"楼盘名称\",\"building\":\"楼栋信息\",\"hs_room\":3,\"hs_hall\":2,\"hs_wc\":1,\"hs_toward\":\"坐北朝南\",\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888,\"style_list\":[{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_id\":1,\"hs_ht_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888},{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_id\":1,\"hs_ht_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888}]}",
	"search" => "{\"houses_list\":[{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]},{\"h_id\":2,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]}]}",
	"map_search" => "{\"land_mark_list\":[{\"alm_id\":1,\"alm_name\":\"中心城区\",\"houses_count\":10},{\"alm_id\":2,\"alm_name\":\"东莞周边\",\"houses_count\":10}],\"region_list\":[{\"a_id\":1,\"a_name\":\"东城\",\"houses_count\":10},{\"a_id\":2,\"a_name\":\"南城\",\"houses_count\":10}],\"house_list\":[{\"h_id\":1,\"h_name\":\"万达公寓\",\"h_min_per_sales_price\":10000},{\"h_id\":2,\"h_name\":\"新世界花园\",\"h_min_per_sales_price\":10000}]}",
	"guess" => "{\"guess_list\":[{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]},{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]}]}",
	"detail" => "{\"houses_img\":{\"total_count\":80,\"list\":[\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\"]},\"houses_stick\":1,\"h_id\":1,\"h_name\":\"万达公馆\",\"h_alias\":\"万达\",\"h_sales_status_mark\":\"在售\",\"tag\":\"别墅\",\"h_min_per_sales_price\":11100,\"houses_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"公寓\"},{\"ht_id\":3,\"ht_name\":\"洋房\"}],\"h_address\":\"广东省东莞市东城区莞樟路111号\",\"h_open_time_mark\":\"2018-01-01\",\"h_handover_time_mark\":\"2018-01-01\",\"houses_decoration\":[{\"hd_id\":1,\"hd_name\":\"毛胚\"},{\"hd_id\":2,\"hd_name\":\"精装\"}],\"h_developer\":\"开发商\",\"h_pre_sale_license\":\"东莞商房预售证字12390239号\\\\r\\\\n东莞商房预售证字12390239号\\\\r\\\\n东莞商房预售证字12390239号\\\\r\\\\n\",\"h_years_property_right\":70,\"h_carport\":\"1:0.35\",\"h_planning_household\":\"1111户\",\"h_plot_ratio\":\"3.5\",\"h_greening_ratio\":\"绿化率\",\"houses_recommend_tag\":[{\"hrt_id\":1,\"hrt_title\":\"交通配套\",\"hrt_description\":\"为什么选择这里，内容描述\"},{\"hrt_id\":1,\"hrt_title\":\"优质学校\",\"hrt_description\":\"为什么选择这里，内容描述\"},{\"hrt_id\":1,\"hrt_title\":\"环境宜居\",\"hrt_description\":\"为什么选择这里，内容描述\"}],\"houses_dynamic\":{\"total_count\":100,\"hd_title\":\"动态标题\",\"hd_excerpt\":\"动态摘要\",\"hd_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hd_hits\":100,\"update_time_mark\":\"2018-01-01\"},\"houses_distribution\":{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"total_count\":3,\"houses_building\":[{\"hb_id\":1,\"hb_name\":\"楼栋名\",\"hb_position_x\":100,\"hb_position_y\":20,\"hb_sales_status\":\"在售\"},{\"hb_id\":1,\"hb_name\":\"楼栋名\",\"hb_position_x\":100,\"hb_position_y\":20,\"hb_sales_status\":\"在售\"},{\"hb_id\":1,\"hb_name\":\"楼栋名\",\"hb_position_x\":100,\"hb_position_y\":20,\"hb_sales_status\":\"在售\"}]},\"houses_style\":{\"villa\":[{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_ht_id\":1,\"hs_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888},{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_ht_id\":1,\"hs_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888}],\"bungalow\":[{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_ht_id\":1,\"hs_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888},{\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hs_title\":\"户型标题\",\"hs_ht_id\":1,\"hs_id\":1,\"hs_building_area\":100,\"hs_total_sales_price\":100,\"hs_per_sales_price\":8888}],\"office\":[],\"condo\":[],\"shop\":[]},\"houses_coupon\":[{\"hc_id\":1,\"hc_title\":\"优惠标题\",\"hc_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hc_expire_day\":20,\"hc_total\":100},{\"hc_id\":1,\"hc_title\":\"优惠标题\",\"hc_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hc_expire_day\":20,\"hc_total\":100},{\"hc_id\":1,\"hc_title\":\"优惠标题\",\"hc_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"hc_expire_day\":20,\"hc_total\":100}],\"h_like\":100,\"h_dislike\":10,\"like_status\":1,\"h_has_panorama\":1,\"h_longitude\":113.12323212,\"h_latitude\":22.123123123}",
	"stick_list" => "{\"stick_list\":[{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]},{\"h_id\":1,\"hi_img\":\"tigonetwork.com/themes/home_simpleboot/static/img/logo.png\",\"h_name\":\"万达公寓\",\"alm_name\":\"中心城区\",\"region_name\":\"东城\",\"h_min_building_areas\":100,\"h_max_building_areas\":1000,\"h_min_per_sales_price\":10000,\"h_sales_status\":\"在售\",\"house_type_list\":[{\"ht_id\":1,\"ht_name\":\"别墅\"},{\"ht_id\":2,\"ht_name\":\"洋房\"},{\"ht_id\":3,\"ht_name\":\"公寓\"}]}]}",
	'VERIFY_STATUS'=>[
		1=>'待审核',
		2=>'审核通过',
		3=>'不通过',
	],
	'HOUSES_VERIFY_STATUS'=>[
		1=>'待审核',
		2=>'审核通过',
		3=>'不通过',
	],
	'HOUSES_SALES_STATUS'=>[
		1=>'待售',
		2=>'在售',
		3=>'售罄',
	],
	'HOUSES_PUTAWAY_STATUS'=>[
		1=>'待上架',
		2=>'已上架',
	],
	'ROOM'=>[
		0=>"不限",
		1=>"一室",
		2=>"两室",
		3=>"三室",
		4=>"四室",
		5=>"五室以上",
	],
	'IMG_TYPE'=>[
		4=>"效果图",
		5=>"实景图",
		6=>"样板间",
		7=>"配套图",
		8=>"资质证明图",
	],
	'RECOMMEND'=>[
		1=>'推荐',
		2=>'不推荐',
	],
	'SEX'=>[
		0=>'保密',
		1=>'男',
		2=>'女',
	],
	'DEFAULT_IMG'=>"__TMPL__/public/assets/images/default-thumbnail.png",
	'XY_IMG'=>"__TMPL__/public/assets/images/d.png",
	'ADD_ICON'=>"__TMPL__/public/assets/images/add.png",
	'DEL_ICON'=>"__TMPL__/public/assets/images/del.png",
	//后台一页显示记录条数
	"ADMIN_PAGE_SIZE"=>10,
	//api一页显示条数
	"page_size"=>10,
	//如前端定位城市名找不到，则默认城市为东莞
	"DEFAULT_CITY"=>441900,
	//redis配置
	"REDIS_CONFIG" => [
		'host'       => '127.0.0.1',
		'port'       => 6379,
		'password'   => 'dgTigo003.',
		'select'     => 0,
		'timeout'    => 1,
		'expire'     => 0,
		'persistent' => false,
		'prefix'     => 'tj2:',
	],
	'reservation_type'=>[
		1=>'变价通知',
		2=>'开盘通知',
		3=>'获取优惠',
		4=>'预约',
	],
	'osd_status'=>[
		1=>'待处理',
		2=>'已处理',
		3=>'处理不了',
	],
	'opd_status'=>[
		1=>'待处理',
		2=>'已处理',
		3=>'处理不了',
	],
	'ob_type'=>[
		1=>'留言抢单',
		2=>'预约抢单'
	],
	'us_verify_status'=>[
		0=>'未提交注册',
		1=>'待审核',
		2=>'已审核',
		3=>'审核不通过',
		4=>'禁用',
	],
	'osv_verify_status'=>[
		1=>'待审核',
		2=>'审核通过',
		3=>'审核不通过',
	],
	'os_status'=>[
		1=>'待接单',
		2=>'已接单'
	],
	'hl_action'=>[
		1=>'点赞',
		2=>'点踩'
	],
	'ucr_status'=>[
		1=>'已绑定',
		2=>'已解绑'
	]
];
?>
