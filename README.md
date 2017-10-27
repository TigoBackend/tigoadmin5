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

##本工程仅限学习使用





