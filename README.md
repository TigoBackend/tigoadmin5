### 基于ThinkCMF 5.0 API 的后台+api框架供学习参考之用
如需使用请到官方维护的github中获取源代码:https://github.com/thinkcmf/thinkcmf

当前版本功能:
1、接口工程(api)、后台工程(app)已经整合到一起

2、为了不影响ThinkCMF后期的更新需要,项目提供APP_FORMAL_ENVIRONMENT常量切换生产环境跟测试环境,生产环境与测试环境唯一的区别只在于
使用的配置文件不一样,以方便在生产环境与测试环境使用不同的配置文件,如微信配置等.
中生产环境使用正常的cmf配置文件(config.php、database.php等),测试环境使用另外的(config_dev.php、database_dev.php),包括data目录
下的共用配置文件也遵循这个规则

3、api接口模块已实现项目中大多数功能函数

4、api接口模块提供了base64上传功能与后台工程公用public/upload文件夹管理资源

5、api接口模块已经实现微信功能(已提供接口示例),该功能依赖waters/webchatapi这个自己写的微信接口类库方便扩展业务

6、api接口模块已经实现了旧版跟新版阿里大于短信功能(已提供接口示例)

7、api接口模块已经实现七牛云存储的部分功能(已提供接口示例)

8、后台新增自定义微信公众号菜单功能

9、后台新增操作日志功能
(1).修改/app/service_config.php 配置文件，添加写日志模块名，如 "TAG" => "门户管理-文章标签",主菜单与子菜单之间用“-”分隔
(2).配置完后，使用以下函数即可记录日志到数据库：cmf_write_log(config("LOG_MODULE.TAG"),config("LOG_TYPE.ADD"),"添加文章标签,ID为：".$intId.",内容为：".json_encode($arrData,JSON_UNESCAPED_UNICODE));
本例中将插入到数据库的数据转成json再插入,其中JSON_UNESCAPED_UNICODE为防止中文被转成乱码
(3).该功能新增表cmf_log,已在安装文件中写入,新项目直接安装即可,如果是正在使用的版本,则需要执行以下数据库脚本：
--
-- 2017-11-21 19:10 增加操作日志表 jewey
--
DROP TABLE IF EXISTS `cmf_log`;
CREATE TABLE `cmf_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `module_name` varchar(100) DEFAULT NULL COMMENT '模块名',
  `action_type` tinyint(1) DEFAULT '0' COMMENT '操作类型：1.新增，2.修改，3.删除',
  `describe` varchar(1000) DEFAULT NULL COMMENT '操作描述',
  `login_ip` varchar(50) DEFAULT NULL COMMENT '登录ip',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

--
-- 2017-11-22 09:22 添加操作日志菜单 jewey
--
INSERT INTO `cmf_admin_menu` VALUES ('163', '0', '1', '1', '10000', 'Admin', 'Log', 'index', '', '操作日志', '', '');
--
-- 2017-11-22 09:22 添加管理员操作日志权限 jewey
--
INSERT INTO `cmf_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'Admin/Log/index', '', '操作日志', '')

##本工程仅限学习使用





