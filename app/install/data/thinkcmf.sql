--
-- 表的结构 `cmf_admin_menu`
--

CREATE TABLE IF NOT EXISTS `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

--
-- 转存表中的数据 `cmf_admin_menu`
--

INSERT INTO `cmf_admin_menu` VALUES ('1', '0', '0', '1', '20', 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理'), ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理'), ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理'), ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序'), ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子'), ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口'), ('7', '6', '1', '1', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理'), ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接'), ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存'), ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接'), ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存'), ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接'), ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序'), ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏'), ('15', '6', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置'), ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存'), ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板'), ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交'), ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试'), ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理'), ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表'), ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加'), ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存'), ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑'), ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存'), ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除'), ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序'), ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单'), ('29', '6', '1', '1', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理'), ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航'), ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存'), ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航'), ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存'), ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航'), ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单'), ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单'), ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存'), ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单'), ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存'), ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单'), ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序'), ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表'), ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用'), ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置'), ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交'), ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装'), ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新'), ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件'), ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组'), ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理'), ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色'), ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交'), ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色'), ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交'), ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色'), ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限'), ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交'), ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站'), ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原'), ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除'), ('61', '6', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理'), ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则'), ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交'), ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑'), ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交'), ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除'), ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用'), ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用'), ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序'), ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL'), ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息'), ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交'), ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改'), ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交'), ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置'), ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交'), ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存'), ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理'), ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片'), ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交'), ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片'), ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交'), ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片'), ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表'), ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加'), ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交'), ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑'), ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交'), ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除'), ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏'), ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示'), ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序'), ('93', '6', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储'), ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交'), ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理'), ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板'), ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板'), ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装'), ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新'), ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板'), ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板'), ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置'), ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表'), ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑'), ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存'), ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除'), ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存'), ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源'), ('109', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理'), ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理'), ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加'), ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交'), ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑'), ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交'), ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改'), ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交'), ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除'), ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员'), ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员'), ('120', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理'), ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表'), ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章'), ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交'), ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章'), ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交'), ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除'), ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布'), ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶'), ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐'), ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序'), ('131', '120', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表'), ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类'), ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交'), ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类'), ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交'), ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框'), ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序'), ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类'), ('139', '120', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理'), ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面'), ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交'), ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面'), ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交'), ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面'), ('145', '120', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签'), ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签'), ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交'), ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态'), ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签'), ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表'), ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件'), ('152', '109', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组'), ('153', '152', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户'), ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑'), ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用'), ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户'), ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定'), ('158', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理'), ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作'), ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交'), ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作'),('162','0','1','1','10000','admin','Wx','index','','公众号菜单','wechat','微信公众号菜单');



-- --------------------------------------------------------

--
-- 表的结构 `cmf_asset`
--

CREATE TABLE IF NOT EXISTS `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_access`
--

CREATE TABLE IF NOT EXISTS `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_rule`
--

CREATE TABLE IF NOT EXISTS `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

--
-- 转存表中的数据 `cmf_auth_rule`
--

INSERT INTO `cmf_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', ''), ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', ''), ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', ''), ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', ''), ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', ''), ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', ''), ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', ''), ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', ''), ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', ''), ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', ''), ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', ''), ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', ''), ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', ''), ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', ''), ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', ''), ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', ''), ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', ''), ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', ''), ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', ''), ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', ''), ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', ''), ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', ''), ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', ''), ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', ''), ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', ''), ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', ''), ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', ''), ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', ''), ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', ''), ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', ''), ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', ''), ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', ''), ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', ''), ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', ''), ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', ''), ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', ''), ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', ''), ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', ''), ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', ''), ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', ''), ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', ''), ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', ''), ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', ''), ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', ''), ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', ''), ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', ''), ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', ''), ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', ''), ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', ''), ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', ''), ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', ''), ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', ''), ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', ''), ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', ''), ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', ''), ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', ''), ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', ''), ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', ''), ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', ''), ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', ''), ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', ''), ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', ''), ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', ''), ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', ''), ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', ''), ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', ''), ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', ''), ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', ''), ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', ''), ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', ''), ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', ''), ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', ''), ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', ''), ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', ''), ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', ''), ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', ''), ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', ''), ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', ''), ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', ''), ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', ''), ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', ''), ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', ''), ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', ''), ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', ''), ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', ''), ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', ''), ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', ''), ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', ''), ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', ''), ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', ''), ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', ''), ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', ''), ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', ''), ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', ''), ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', ''), ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', ''), ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', ''), ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', ''), ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', ''), ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', ''), ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', ''), ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', ''), ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', ''), ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', ''), ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', ''), ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', ''), ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', ''), ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', ''), ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', ''), ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', ''), ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', ''), ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', ''), ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', ''), ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', ''), ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', ''), ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', ''), ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', ''), ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', ''), ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', ''), ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', ''), ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', ''), ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', ''), ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', ''), ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', ''), ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', ''), ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', ''), ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', ''), ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', ''), ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', ''), ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', ''), ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', ''), ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', ''), ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', ''), ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', ''), ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', ''), ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', ''), ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', ''), ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', ''), ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', ''), ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', ''), ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', ''), ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', ''), ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', ''), ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', ''), ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', ''), ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', ''), ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', ''), ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', ''), ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', ''), ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', ''), ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', ''), ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', ''), ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', ''), ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', ''), ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', ''), ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', ''), ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', ''), ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', ''), ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', ''), ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', ''), ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');



-- --------------------------------------------------------

--
-- 表的结构 `cmf_comment`
--

CREATE TABLE IF NOT EXISTS `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook`
--

CREATE TABLE IF NOT EXISTS `cmf_hook` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook_plugin`
--

CREATE TABLE IF NOT EXISTS `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_link`
--

CREATE TABLE IF NOT EXISTS `cmf_link` (
  `id` bigint(20) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

--
-- 转存表中的数据 `cmf_link`
--

INSERT INTO `cmf_link` (`id`, `status`, `rating`, `list_order`, `description`, `url`, `name`, `image`, `target`, `rel`) VALUES
(1, 1, 1, 8, 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav`
--

CREATE TABLE IF NOT EXISTS `cmf_nav` (
  `id` int(10) unsigned NOT NULL,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

--
-- 转存表中的数据 `cmf_nav`
--

INSERT INTO `cmf_nav` (`id`, `is_main`, `name`, `remark`) VALUES
(1, 1, '主导航', '主导航'),
(2, 0, '底部导航', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav_menu`
--

CREATE TABLE IF NOT EXISTS `cmf_nav_menu` (
  `id` int(11) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

--
-- 转存表中的数据 `cmf_nav_menu`
--

INSERT INTO `cmf_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`) VALUES
(1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_option`
--

CREATE TABLE IF NOT EXISTS `cmf_option` (
  `id` bigint(20) unsigned NOT NULL,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

--
-- 表的结构 `cmf_plugin`
--

CREATE TABLE IF NOT EXISTS `cmf_plugin` (
  `id` int(11) unsigned NOT NULL COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category`
--

CREATE TABLE IF NOT EXISTS `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';
-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category_post`
--

CREATE TABLE IF NOT EXISTS `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_post`
--

CREATE TABLE IF NOT EXISTS `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

--
-- 表的结构 `cmf_portal_tag`
--

CREATE TABLE IF NOT EXISTS `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_tag_post`
--

CREATE TABLE IF NOT EXISTS `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recycle_bin`
--

CREATE TABLE IF NOT EXISTS `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role`
--

CREATE TABLE IF NOT EXISTS `cmf_role` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

--
-- 转存表中的数据 `cmf_role`
--

INSERT INTO `cmf_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`) VALUES
(1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！'),
(2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role_user`
--

CREATE TABLE IF NOT EXISTS `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

--
-- 表的结构 `cmf_route`
--

CREATE TABLE IF NOT EXISTS `cmf_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide`
--

CREATE TABLE IF NOT EXISTS `cmf_slide` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide_item`
--

CREATE TABLE IF NOT EXISTS `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme`
--

CREATE TABLE IF NOT EXISTS `cmf_theme` (
  `id` int(11) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述'
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme_file`
--

CREATE TABLE IF NOT EXISTS `cmf_theme_file` (
  `id` int(11) NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置'
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_third_party_user`
--

CREATE TABLE IF NOT EXISTS `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user`
--

CREATE TABLE IF NOT EXISTS `cmf_user` (
  `id` bigint(20) unsigned NOT NULL,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_action_log`
--

CREATE TABLE IF NOT EXISTS `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_favorite`
--

CREATE TABLE IF NOT EXISTS `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_login_attempt`
--

CREATE TABLE IF NOT EXISTS `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_token`
--

CREATE TABLE IF NOT EXISTS `cmf_user_token` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_verification_code`
--

CREATE TABLE IF NOT EXISTS `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `parentid` (`parent_id`),
  ADD KEY `model` (`controller`);

--
-- Indexes for table `cmf_asset`
--
ALTER TABLE `cmf_asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `module` (`app`,`status`,`type`);

--
-- Indexes for table `cmf_comment`
--
ALTER TABLE `cmf_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post_ID` (`object_id`),
  ADD KEY `comment_approved_date_gmt` (`status`),
  ADD KEY `comment_parent` (`parent_id`),
  ADD KEY `table_id_status` (`table_name`,`object_id`,`status`),
  ADD KEY `createtime` (`create_time`);

--
-- Indexes for table `cmf_hook`
--
ALTER TABLE `cmf_hook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_link`
--
ALTER TABLE `cmf_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_visible` (`status`);

--
-- Indexes for table `cmf_nav`
--
ALTER TABLE `cmf_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_option`
--
ALTER TABLE `cmf_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_taxonomy_id` (`category_id`);

--
-- Indexes for table `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  ADD KEY `post_parent` (`parent_id`),
  ADD KEY `post_author` (`user_id`),
  ADD KEY `post_date` (`create_time`) USING BTREE;

--
-- Indexes for table `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_taxonomy_id` (`post_id`);

--
-- Indexes for table `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_role`
--
ALTER TABLE `cmf_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`parent_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cmf_route`
--
ALTER TABLE `cmf_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_slide`
--
ALTER TABLE `cmf_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_cid` (`slide_id`);

--
-- Indexes for table `cmf_theme`
--
ALTER TABLE `cmf_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user`
--
ALTER TABLE `cmf_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login` (`user_login`),
  ADD KEY `user_nickname` (`user_nickname`);

--
-- Indexes for table `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user_id`,`object`,`action`),
  ADD KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`);

--
-- Indexes for table `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `cmf_asset`
--
ALTER TABLE `cmf_asset`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `cmf_comment`
--
ALTER TABLE `cmf_comment`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_hook`
--
ALTER TABLE `cmf_hook`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `cmf_link`
--
ALTER TABLE `cmf_link`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cmf_nav`
--
ALTER TABLE `cmf_nav`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cmf_option`
--
ALTER TABLE `cmf_option`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `cmf_role`
--
ALTER TABLE `cmf_role`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cmf_route`
--
ALTER TABLE `cmf_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cmf_slide`
--
ALTER TABLE `cmf_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_theme`
--
ALTER TABLE `cmf_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_user`
--
ALTER TABLE `cmf_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=9;

ALTER TABLE `cmf_route` ADD `type` TINYINT NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加' AFTER `status`;

-- 2017-09-12 12:38 更改字段长度
ALTER TABLE `cmf_hook` CHANGE `hook` `hook` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子';
ALTER TABLE `cmf_hook` CHANGE `name` `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称';
ALTER TABLE `cmf_hook_plugin` CHANGE `hook` `hook` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钩子名';

INSERT INTO `cmf_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化'), ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始'), ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化'), ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始'), ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤'), ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束'), ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法'), ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束'), ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化'), ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化'), ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码'), ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始'), ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前'), ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始'), ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前'), ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前'), ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前'), ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始'), ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前'), ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始'), ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前'), ('22', '3', '1', '评论区', 'comment', '', '评论区'), ('23', '3', '1', '留言区', 'guestbook', '', '留言区'), ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘'), ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前'), ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前'), ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面'), ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换'), ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后'), ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前'), ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');


ALTER TABLE `cmf_plugin` ADD `demo_url` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议' AFTER `title`;
ALTER TABLE `cmf_plugin` ADD `author_url` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '作者网站链接' AFTER `author`;

--
-- 2017-07-06 11:10 增加用户操作表
--
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

--
-- 2017-07-06 11:10 增加用户操作积分等奖励日志表
--
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

--
-- 2017-08-07 12:02:01  增加post_excerpt默认值
--
ALTER TABLE `cmf_portal_post` CHANGE `post_excerpt` `post_excerpt` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'post摘要';

-- 2017-09-06 10:35更正 admin_menu表list_order 字段类型
ALTER TABLE `cmf_admin_menu` CHANGE `list_order` `list_order` FLOAT NOT NULL DEFAULT '10000' COMMENT '排序';

-- 2017-09-07 13:35 增加用户表 more 字段
ALTER TABLE `cmf_user` ADD `more` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展属性' AFTER `mobile`;

-- 微信公众号菜单表
DROP TABLE IF EXISTS `cmf_wx_menu`;
CREATE TABLE `cmf_wx_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `list_order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `name` varchar(20) NOT NULL COMMENT '微信菜单名',
  `type` varchar(10) NOT NULL COMMENT '菜单类型',
  `content_type` varchar(10) NOT NULL COMMENT '内容类型',
  `content_value` varchar(255) NOT NULL COMMENT '菜单内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='微信公众号菜单表';


-- 全国地区表
DROP TABLE IF EXISTS `cmf_areas`;
CREATE TABLE `cmf_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL COMMENT '父级id',
  `name` varchar(20) DEFAULT NULL COMMENT '地区名称',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示 -1:不显示 1:显示  该字段配合flag一起使用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '地区排序(同级别的地区中数值越大越排前),用于设置热门地区',
  `initials_key` char(255) NOT NULL COMMENT '城市的开头手写字母',
  `areas_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '地区类型 0:省(直辖市) 1:市(直辖市) 2:区、镇、乡、街道办等',
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '标识该地区是否可用 1:可用 -1:不可用  该字段配合flag一起使用',
  PRIMARY KEY (`id`),
  KEY `isShow` (`is_show`,`flag`),
  KEY `areaType` (`areas_type`),
  KEY `parentId` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=820456 DEFAULT CHARSET=utf8;

INSERT INTO `cmf_areas` VALUES ('110000', '0', '北京市', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('110100', '110000', '北京市', '1', '50', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('110101', '110100', '东城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110102', '110100', '西城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110105', '110100', '朝阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110106', '110100', '丰台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110107', '110100', '石景山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110108', '110100', '海淀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110109', '110100', '门头沟区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110111', '110100', '房山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110112', '110100', '通州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110113', '110100', '顺义区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110114', '110100', '昌平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110115', '110100', '大兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110116', '110100', '怀柔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110117', '110100', '平谷区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('110228', '110200', '密云县', '1', '0', '', '2', '-1');
INSERT INTO `cmf_areas` VALUES ('110229', '110200', '延庆县', '1', '0', '', '2', '-1');
INSERT INTO `cmf_areas` VALUES ('120000', '0', '天津市', '1', '50', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('120101', '120100', '和平区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120102', '120100', '河东区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120103', '120100', '河西区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120104', '120100', '南开区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120105', '120100', '河北区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120106', '120100', '红桥区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120110', '120100', '东丽区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120111', '120100', '西青区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120112', '120100', '津南区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120113', '120100', '北辰区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120114', '120100', '武清区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120115', '120100', '宝坻区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120116', '120100', '滨海新区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120221', '120200', '宁河县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120223', '120200', '静海县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('120225', '120200', '蓟县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130000', '0', '河北省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('130100', '130000', '石家庄市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130102', '130100', '长安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130104', '130100', '桥西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130105', '130100', '新华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130107', '130100', '井陉矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130108', '130100', '裕华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130109', '130100', '藁城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130110', '130100', '鹿泉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130111', '130100', '栾城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130121', '130100', '井陉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130123', '130100', '正定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130125', '130100', '行唐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130126', '130100', '灵寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130127', '130100', '高邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130128', '130100', '深泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130129', '130100', '赞皇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130130', '130100', '无极县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130131', '130100', '平山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130132', '130100', '元氏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130133', '130100', '赵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130181', '130100', '辛集市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130183', '130100', '晋州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130184', '130100', '新乐市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130200', '130000', '唐山市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130202', '130200', '路南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130203', '130200', '路北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130204', '130200', '古冶区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130205', '130200', '开平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130207', '130200', '丰南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130208', '130200', '丰润区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130209', '130200', '曹妃甸区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130223', '130200', '滦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130224', '130200', '滦南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130225', '130200', '乐亭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130227', '130200', '迁西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130229', '130200', '玉田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130281', '130200', '遵化市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130283', '130200', '迁安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130300', '130000', '秦皇岛市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130302', '130300', '海港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130303', '130300', '山海关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130304', '130300', '北戴河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130321', '130300', '青龙满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130322', '130300', '昌黎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130323', '130300', '抚宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130324', '130300', '卢龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130400', '130000', '邯郸市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130402', '130400', '邯山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130403', '130400', '丛台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130404', '130400', '复兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130406', '130400', '峰峰矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130421', '130400', '邯郸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130423', '130400', '临漳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130424', '130400', '成安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130425', '130400', '大名县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130426', '130400', '涉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130427', '130400', '磁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130428', '130400', '肥乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130429', '130400', '永年县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130430', '130400', '邱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130431', '130400', '鸡泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130432', '130400', '广平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130433', '130400', '馆陶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130434', '130400', '魏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130435', '130400', '曲周县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130481', '130400', '武安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130500', '130000', '邢台市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130502', '130500', '桥东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130503', '130500', '桥西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130521', '130500', '邢台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130522', '130500', '临城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130523', '130500', '内丘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130524', '130500', '柏乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130525', '130500', '隆尧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130526', '130500', '任县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130527', '130500', '南和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130528', '130500', '宁晋县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130529', '130500', '巨鹿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130530', '130500', '新河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130531', '130500', '广宗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130532', '130500', '平乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130533', '130500', '威县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130534', '130500', '清河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130535', '130500', '临西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130581', '130500', '南宫市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130582', '130500', '沙河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130600', '130000', '保定市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130602', '130600', '新市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130603', '130600', '北市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130604', '130600', '南市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130621', '130600', '满城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130622', '130600', '清苑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130623', '130600', '涞水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130624', '130600', '阜平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130625', '130600', '徐水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130626', '130600', '定兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130627', '130600', '唐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130628', '130600', '高阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130629', '130600', '容城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130630', '130600', '涞源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130631', '130600', '望都县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130632', '130600', '安新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130633', '130600', '易县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130634', '130600', '曲阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130635', '130600', '蠡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130636', '130600', '顺平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130637', '130600', '博野县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130638', '130600', '雄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130681', '130600', '涿州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130682', '130600', '定州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130683', '130600', '安国市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130684', '130600', '高碑店市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130700', '130000', '张家口市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130702', '130700', '桥东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130703', '130700', '桥西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130705', '130700', '宣化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130706', '130700', '下花园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130721', '130700', '宣化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130722', '130700', '张北县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130723', '130700', '康保县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130724', '130700', '沽源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130725', '130700', '尚义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130726', '130700', '蔚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130727', '130700', '阳原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130728', '130700', '怀安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130729', '130700', '万全县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130730', '130700', '怀来县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130731', '130700', '涿鹿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130732', '130700', '赤城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130733', '130700', '崇礼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130800', '130000', '承德市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130802', '130800', '双桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130803', '130800', '双滦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130804', '130800', '鹰手营子矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130821', '130800', '承德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130822', '130800', '兴隆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130823', '130800', '平泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130824', '130800', '滦平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130825', '130800', '隆化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130826', '130800', '丰宁满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130827', '130800', '宽城满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130828', '130800', '围场满族蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130900', '130000', '沧州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('130902', '130900', '新华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130903', '130900', '运河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130921', '130900', '沧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130922', '130900', '青县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130923', '130900', '东光县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130924', '130900', '海兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130925', '130900', '盐山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130926', '130900', '肃宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130927', '130900', '南皮县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130928', '130900', '吴桥县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130929', '130900', '献县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130930', '130900', '孟村回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130981', '130900', '泊头市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130982', '130900', '任丘市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130983', '130900', '黄骅市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('130984', '130900', '河间市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131000', '130000', '廊坊市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('131002', '131000', '安次区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131003', '131000', '广阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131022', '131000', '固安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131023', '131000', '永清县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131024', '131000', '香河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131025', '131000', '大城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131026', '131000', '文安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131028', '131000', '大厂回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131081', '131000', '霸州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131082', '131000', '三河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131100', '130000', '衡水市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('131102', '131100', '桃城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131121', '131100', '枣强县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131122', '131100', '武邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131123', '131100', '武强县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131124', '131100', '饶阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131125', '131100', '安平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131126', '131100', '故城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131127', '131100', '景县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131128', '131100', '阜城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131181', '131100', '冀州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('131182', '131100', '深州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140000', '0', '山西省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('140100', '140000', '太原市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140105', '140100', '小店区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140106', '140100', '迎泽区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140107', '140100', '杏花岭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140108', '140100', '尖草坪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140109', '140100', '万柏林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140110', '140100', '晋源区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140121', '140100', '清徐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140122', '140100', '阳曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140123', '140100', '娄烦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140181', '140100', '古交市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140200', '140000', '大同市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140202', '140200', '城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140203', '140200', '矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140211', '140200', '南郊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140212', '140200', '新荣区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140221', '140200', '阳高县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140222', '140200', '天镇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140223', '140200', '广灵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140224', '140200', '灵丘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140225', '140200', '浑源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140226', '140200', '左云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140227', '140200', '大同县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140300', '140000', '阳泉市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140302', '140300', '城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140303', '140300', '矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140311', '140300', '郊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140321', '140300', '平定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140322', '140300', '盂县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140400', '140000', '长治市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140402', '140400', '城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140411', '140400', '郊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140421', '140400', '长治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140423', '140400', '襄垣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140424', '140400', '屯留县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140425', '140400', '平顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140426', '140400', '黎城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140427', '140400', '壶关县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140428', '140400', '长子县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140429', '140400', '武乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140430', '140400', '沁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140431', '140400', '沁源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140481', '140400', '潞城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140500', '140000', '晋城市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140502', '140500', '城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140521', '140500', '沁水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140522', '140500', '阳城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140524', '140500', '陵川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140525', '140500', '泽州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140581', '140500', '高平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140600', '140000', '朔州市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140602', '140600', '朔城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140603', '140600', '平鲁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140621', '140600', '山阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140622', '140600', '应县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140623', '140600', '右玉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140624', '140600', '怀仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140700', '140000', '晋中市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140702', '140700', '榆次区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140721', '140700', '榆社县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140722', '140700', '左权县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140723', '140700', '和顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140724', '140700', '昔阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140725', '140700', '寿阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140726', '140700', '太谷县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140727', '140700', '祁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140728', '140700', '平遥县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140729', '140700', '灵石县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140781', '140700', '介休市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140800', '140000', '运城市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140802', '140800', '盐湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140821', '140800', '临猗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140822', '140800', '万荣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140823', '140800', '闻喜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140824', '140800', '稷山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140825', '140800', '新绛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140826', '140800', '绛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140827', '140800', '垣曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140828', '140800', '夏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140829', '140800', '平陆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140830', '140800', '芮城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140881', '140800', '永济市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140882', '140800', '河津市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140900', '140000', '忻州市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('140902', '140900', '忻府区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140921', '140900', '定襄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140922', '140900', '五台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140923', '140900', '代县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140924', '140900', '繁峙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140925', '140900', '宁武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140926', '140900', '静乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140927', '140900', '神池县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140928', '140900', '五寨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140929', '140900', '岢岚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140930', '140900', '河曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140931', '140900', '保德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140932', '140900', '偏关县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('140981', '140900', '原平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141000', '140000', '临汾市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('141002', '141000', '尧都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141021', '141000', '曲沃县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141022', '141000', '翼城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141023', '141000', '襄汾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141024', '141000', '洪洞县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141025', '141000', '古县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141026', '141000', '安泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141027', '141000', '浮山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141028', '141000', '吉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141029', '141000', '乡宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141030', '141000', '大宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141031', '141000', '隰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141032', '141000', '永和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141033', '141000', '蒲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141034', '141000', '汾西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141081', '141000', '侯马市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141082', '141000', '霍州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141100', '140000', '吕梁市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('141102', '141100', '离石区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141121', '141100', '文水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141122', '141100', '交城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141123', '141100', '兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141124', '141100', '临县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141125', '141100', '柳林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141126', '141100', '石楼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141127', '141100', '岚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141128', '141100', '方山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141129', '141100', '中阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141130', '141100', '交口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141181', '141100', '孝义市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('141182', '141100', '汾阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150000', '0', '内蒙古自治区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('150100', '150000', '呼和浩特市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150102', '150100', '新城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150103', '150100', '回民区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150104', '150100', '玉泉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150105', '150100', '赛罕区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150121', '150100', '土默特左旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150122', '150100', '托克托县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150123', '150100', '和林格尔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150124', '150100', '清水河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150125', '150100', '武川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150200', '150000', '包头市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150202', '150200', '东河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150203', '150200', '昆都仑区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150204', '150200', '青山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150205', '150200', '石拐区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150206', '150200', '白云鄂博矿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150207', '150200', '九原区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150221', '150200', '土默特右旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150222', '150200', '固阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150223', '150200', '达尔罕茂明安联合旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150300', '150000', '乌海市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150302', '150300', '海勃湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150303', '150300', '海南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150304', '150300', '乌达区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150400', '150000', '赤峰市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150402', '150400', '红山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150403', '150400', '元宝山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150404', '150400', '松山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150421', '150400', '阿鲁科尔沁旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150422', '150400', '巴林左旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150423', '150400', '巴林右旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150424', '150400', '林西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150425', '150400', '克什克腾旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150426', '150400', '翁牛特旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150428', '150400', '喀喇沁旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150429', '150400', '宁城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150430', '150400', '敖汉旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150500', '150000', '通辽市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150502', '150500', '科尔沁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150521', '150500', '科尔沁左翼中旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150522', '150500', '科尔沁左翼后旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150523', '150500', '开鲁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150524', '150500', '库伦旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150525', '150500', '奈曼旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150526', '150500', '扎鲁特旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150581', '150500', '霍林郭勒市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150600', '150000', '鄂尔多斯市', '1', '0', 'E', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150602', '150600', '东胜区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150621', '150600', '达拉特旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150622', '150600', '准格尔旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150623', '150600', '鄂托克前旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150624', '150600', '鄂托克旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150625', '150600', '杭锦旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150626', '150600', '乌审旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150627', '150600', '伊金霍洛旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150700', '150000', '呼伦贝尔市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150702', '150700', '海拉尔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150703', '150700', '扎赉诺尔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150721', '150700', '阿荣旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150722', '150700', '莫力达瓦达斡尔族自治旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150723', '150700', '鄂伦春自治旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150724', '150700', '鄂温克族自治旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150725', '150700', '陈巴尔虎旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150726', '150700', '新巴尔虎左旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150727', '150700', '新巴尔虎右旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150781', '150700', '满洲里市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150782', '150700', '牙克石市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150783', '150700', '扎兰屯市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150784', '150700', '额尔古纳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150785', '150700', '根河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150800', '150000', '巴彦淖尔市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150802', '150800', '临河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150821', '150800', '五原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150822', '150800', '磴口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150823', '150800', '乌拉特前旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150824', '150800', '乌拉特中旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150825', '150800', '乌拉特后旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150826', '150800', '杭锦后旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150900', '150000', '乌兰察布市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('150902', '150900', '集宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150921', '150900', '卓资县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150922', '150900', '化德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150923', '150900', '商都县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150924', '150900', '兴和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150925', '150900', '凉城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150926', '150900', '察哈尔右翼前旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150927', '150900', '察哈尔右翼中旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150928', '150900', '察哈尔右翼后旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150929', '150900', '四子王旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('150981', '150900', '丰镇市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152200', '150000', '兴安盟', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('152201', '152200', '乌兰浩特市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152202', '152200', '阿尔山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152221', '152200', '科尔沁右翼前旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152222', '152200', '科尔沁右翼中旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152223', '152200', '扎赉特旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152224', '152200', '突泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152500', '150000', '锡林郭勒盟', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('152501', '152500', '二连浩特市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152502', '152500', '锡林浩特市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152522', '152500', '阿巴嘎旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152523', '152500', '苏尼特左旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152524', '152500', '苏尼特右旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152525', '152500', '东乌珠穆沁旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152526', '152500', '西乌珠穆沁旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152527', '152500', '太仆寺旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152528', '152500', '镶黄旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152529', '152500', '正镶白旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152530', '152500', '正蓝旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152531', '152500', '多伦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152900', '150000', '阿拉善盟', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('152921', '152900', '阿拉善左旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152922', '152900', '阿拉善右旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('152923', '152900', '额济纳旗', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210000', '0', '辽宁省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('210100', '210000', '沈阳市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210102', '210100', '和平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210103', '210100', '沈河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210104', '210100', '大东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210105', '210100', '皇姑区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210106', '210100', '铁西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210111', '210100', '苏家屯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210112', '210100', '浑南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210113', '210100', '沈北新区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210114', '210100', '于洪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210122', '210100', '辽中县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210123', '210100', '康平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210124', '210100', '法库县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210181', '210100', '新民市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210200', '210000', '大连市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210202', '210200', '中山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210203', '210200', '西岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210204', '210200', '沙河口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210211', '210200', '甘井子区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210212', '210200', '旅顺口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210213', '210200', '金州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210224', '210200', '长海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210281', '210200', '瓦房店市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210282', '210200', '普兰店市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210283', '210200', '庄河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210300', '210000', '鞍山市', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210302', '210300', '铁东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210303', '210300', '铁西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210304', '210300', '立山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210311', '210300', '千山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210321', '210300', '台安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210323', '210300', '岫岩满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210381', '210300', '海城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210400', '210000', '抚顺市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210402', '210400', '新抚区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210403', '210400', '东洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210404', '210400', '望花区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210411', '210400', '顺城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210421', '210400', '抚顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210422', '210400', '新宾满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210423', '210400', '清原满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210500', '210000', '本溪市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210502', '210500', '平山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210503', '210500', '溪湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210504', '210500', '明山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210505', '210500', '南芬区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210521', '210500', '本溪满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210522', '210500', '桓仁满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210600', '210000', '丹东市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210602', '210600', '元宝区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210603', '210600', '振兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210604', '210600', '振安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210624', '210600', '宽甸满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210681', '210600', '东港市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210682', '210600', '凤城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210700', '210000', '锦州市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210702', '210700', '古塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210703', '210700', '凌河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210711', '210700', '太和区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210726', '210700', '黑山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210727', '210700', '义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210781', '210700', '凌海市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210782', '210700', '北镇市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210800', '210000', '营口市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210802', '210800', '站前区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210803', '210800', '西市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210804', '210800', '鲅鱼圈区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210811', '210800', '老边区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210881', '210800', '盖州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210882', '210800', '大石桥市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210900', '210000', '阜新市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('210902', '210900', '海州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210903', '210900', '新邱区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210904', '210900', '太平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210905', '210900', '清河门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210911', '210900', '细河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210921', '210900', '阜新蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('210922', '210900', '彰武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211000', '210000', '辽阳市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('211002', '211000', '白塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211003', '211000', '文圣区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211004', '211000', '宏伟区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211005', '211000', '弓长岭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211011', '211000', '太子河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211021', '211000', '辽阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211081', '211000', '灯塔市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211100', '210000', '盘锦市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('211102', '211100', '双台子区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211103', '211100', '兴隆台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211121', '211100', '大洼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211122', '211100', '盘山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211200', '210000', '铁岭市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('211202', '211200', '银州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211204', '211200', '清河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211221', '211200', '铁岭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211223', '211200', '西丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211224', '211200', '昌图县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211281', '211200', '调兵山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211282', '211200', '开原市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211300', '210000', '朝阳市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('211302', '211300', '双塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211303', '211300', '龙城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211321', '211300', '朝阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211322', '211300', '建平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211324', '211300', '喀喇沁左翼蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211381', '211300', '北票市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211382', '211300', '凌源市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211400', '210000', '葫芦岛市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('211402', '211400', '连山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211403', '211400', '龙港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211404', '211400', '南票区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211421', '211400', '绥中县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211422', '211400', '建昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('211481', '211400', '兴城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220000', '0', '吉林省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('220100', '220000', '长春市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220102', '220100', '南关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220103', '220100', '宽城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220104', '220100', '朝阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220105', '220100', '二道区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220106', '220100', '绿园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220112', '220100', '双阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220113', '220100', '九台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220122', '220100', '农安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220182', '220100', '榆树市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220183', '220100', '德惠市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220200', '220000', '吉林市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220202', '220200', '昌邑区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220203', '220200', '龙潭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220204', '220200', '船营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220211', '220200', '丰满区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220221', '220200', '永吉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220281', '220200', '蛟河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220282', '220200', '桦甸市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220283', '220200', '舒兰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220284', '220200', '磐石市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220300', '220000', '四平市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220302', '220300', '铁西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220303', '220300', '铁东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220322', '220300', '梨树县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220323', '220300', '伊通满族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220381', '220300', '公主岭市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220382', '220300', '双辽市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220400', '220000', '辽源市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220402', '220400', '龙山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220403', '220400', '西安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220421', '220400', '东丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220422', '220400', '东辽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220500', '220000', '通化市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220502', '220500', '东昌区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220503', '220500', '二道江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220521', '220500', '通化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220523', '220500', '辉南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220524', '220500', '柳河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220581', '220500', '梅河口市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220582', '220500', '集安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220600', '220000', '白山市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220602', '220600', '浑江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220605', '220600', '江源区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220621', '220600', '抚松县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220622', '220600', '靖宇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220623', '220600', '长白朝鲜族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220681', '220600', '临江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220700', '220000', '松原市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220702', '220700', '宁江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220721', '220700', '前郭尔罗斯蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220722', '220700', '长岭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220723', '220700', '乾安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220781', '220700', '扶余市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220800', '220000', '白城市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('220802', '220800', '洮北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220821', '220800', '镇赉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220822', '220800', '通榆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220881', '220800', '洮南市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('220882', '220800', '大安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222400', '220000', '延边朝鲜族自治州', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('222401', '222400', '延吉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222402', '222400', '图们市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222403', '222400', '敦化市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222404', '222400', '珲春市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222405', '222400', '龙井市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222406', '222400', '和龙市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222424', '222400', '汪清县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('222426', '222400', '安图县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230000', '0', '黑龙江省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('230100', '230000', '哈尔滨市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230102', '230100', '道里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230103', '230100', '南岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230104', '230100', '道外区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230108', '230100', '平房区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230109', '230100', '松北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230110', '230100', '香坊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230111', '230100', '呼兰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230112', '230100', '阿城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230113', '230100', '双城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230123', '230100', '依兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230124', '230100', '方正县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230125', '230100', '宾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230126', '230100', '巴彦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230127', '230100', '木兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230128', '230100', '通河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230129', '230100', '延寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230183', '230100', '尚志市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230184', '230100', '五常市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230200', '230000', '齐齐哈尔市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230202', '230200', '龙沙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230203', '230200', '建华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230204', '230200', '铁锋区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230205', '230200', '昂昂溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230206', '230200', '富拉尔基区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230207', '230200', '碾子山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230208', '230200', '梅里斯达斡尔族区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230221', '230200', '龙江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230223', '230200', '依安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230224', '230200', '泰来县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230225', '230200', '甘南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230227', '230200', '富裕县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230229', '230200', '克山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230230', '230200', '克东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230231', '230200', '拜泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230281', '230200', '讷河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230300', '230000', '鸡西市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230302', '230300', '鸡冠区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230303', '230300', '恒山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230304', '230300', '滴道区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230305', '230300', '梨树区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230306', '230300', '城子河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230307', '230300', '麻山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230321', '230300', '鸡东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230381', '230300', '虎林市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230382', '230300', '密山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230400', '230000', '鹤岗市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230402', '230400', '向阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230403', '230400', '工农区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230404', '230400', '南山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230405', '230400', '兴安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230406', '230400', '东山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230407', '230400', '兴山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230421', '230400', '萝北县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230422', '230400', '绥滨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230500', '230000', '双鸭山市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230502', '230500', '尖山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230503', '230500', '岭东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230505', '230500', '四方台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230506', '230500', '宝山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230521', '230500', '集贤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230522', '230500', '友谊县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230523', '230500', '宝清县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230524', '230500', '饶河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230600', '230000', '大庆市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230602', '230600', '萨尔图区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230603', '230600', '龙凤区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230604', '230600', '让胡路区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230605', '230600', '红岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230606', '230600', '大同区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230621', '230600', '肇州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230622', '230600', '肇源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230623', '230600', '林甸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230624', '230600', '杜尔伯特蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230700', '230000', '伊春市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230702', '230700', '伊春区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230703', '230700', '南岔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230704', '230700', '友好区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230705', '230700', '西林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230706', '230700', '翠峦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230707', '230700', '新青区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230708', '230700', '美溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230709', '230700', '金山屯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230710', '230700', '五营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230711', '230700', '乌马河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230712', '230700', '汤旺河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230713', '230700', '带岭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230714', '230700', '乌伊岭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230715', '230700', '红星区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230716', '230700', '上甘岭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230722', '230700', '嘉荫县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230781', '230700', '铁力市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230800', '230000', '佳木斯市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230803', '230800', '向阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230804', '230800', '前进区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230805', '230800', '东风区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230811', '230800', '郊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230822', '230800', '桦南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230826', '230800', '桦川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230828', '230800', '汤原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230833', '230800', '抚远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230881', '230800', '同江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230882', '230800', '富锦市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230900', '230000', '七台河市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('230902', '230900', '新兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230903', '230900', '桃山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230904', '230900', '茄子河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('230921', '230900', '勃利县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231000', '230000', '牡丹江市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('231002', '231000', '东安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231003', '231000', '阳明区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231004', '231000', '爱民区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231005', '231000', '西安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231024', '231000', '东宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231025', '231000', '林口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231081', '231000', '绥芬河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231083', '231000', '海林市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231084', '231000', '宁安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231085', '231000', '穆棱市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231100', '230000', '黑河市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('231102', '231100', '爱辉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231121', '231100', '嫩江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231123', '231100', '逊克县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231124', '231100', '孙吴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231181', '231100', '北安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231182', '231100', '五大连池市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231200', '230000', '绥化市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('231202', '231200', '北林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231221', '231200', '望奎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231222', '231200', '兰西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231223', '231200', '青冈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231224', '231200', '庆安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231225', '231200', '明水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231226', '231200', '绥棱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231281', '231200', '安达市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231282', '231200', '肇东市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('231283', '231200', '海伦市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('232700', '230000', '大兴安岭地区', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('232721', '232700', '呼玛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('232722', '232700', '塔河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('232723', '232700', '漠河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310000', '0', '上海市', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('310101', '310100', '黄浦区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310104', '310100', '徐汇区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310105', '310100', '长宁区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310106', '310100', '静安区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310107', '310100', '普陀区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310108', '310100', '闸北区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310109', '310100', '虹口区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310110', '310100', '杨浦区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310112', '310100', '闵行区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310113', '310100', '宝山区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310114', '310100', '嘉定区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310115', '310100', '浦东新区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310116', '310100', '金山区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310117', '310100', '松江区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310118', '310100', '青浦区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310120', '310100', '奉贤区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('310230', '310200', '崇明县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320000', '0', '江苏省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('320100', '320000', '南京市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320102', '320100', '玄武区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320104', '320100', '秦淮区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320105', '320100', '建邺区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320106', '320100', '鼓楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320111', '320100', '浦口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320113', '320100', '栖霞区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320114', '320100', '雨花台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320115', '320100', '江宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320116', '320100', '六合区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320117', '320100', '溧水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320118', '320100', '高淳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320200', '320000', '无锡市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320202', '320200', '崇安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320203', '320200', '南长区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320204', '320200', '北塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320205', '320200', '锡山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320206', '320200', '惠山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320211', '320200', '滨湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320281', '320200', '江阴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320282', '320200', '宜兴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320300', '320000', '徐州市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320302', '320300', '鼓楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320303', '320300', '云龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320305', '320300', '贾汪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320311', '320300', '泉山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320312', '320300', '铜山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320321', '320300', '丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320322', '320300', '沛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320324', '320300', '睢宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320381', '320300', '新沂市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320382', '320300', '邳州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320400', '320000', '常州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320402', '320400', '天宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320404', '320400', '钟楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320405', '320400', '戚墅堰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320411', '320400', '新北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320412', '320400', '武进区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320481', '320400', '溧阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320482', '320400', '金坛市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320500', '320000', '苏州市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320505', '320500', '虎丘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320506', '320500', '吴中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320507', '320500', '相城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320508', '320500', '姑苏区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320509', '320500', '吴江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320581', '320500', '常熟市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320582', '320500', '张家港市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320583', '320500', '昆山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320585', '320500', '太仓市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320600', '320000', '南通市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320602', '320600', '崇川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320611', '320600', '港闸区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320612', '320600', '通州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320621', '320600', '海安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320623', '320600', '如东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320681', '320600', '启东市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320682', '320600', '如皋市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320684', '320600', '海门市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320700', '320000', '连云港市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320703', '320700', '连云区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320706', '320700', '海州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320707', '320700', '赣榆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320722', '320700', '东海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320723', '320700', '灌云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320724', '320700', '灌南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320800', '320000', '淮安市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320802', '320800', '清河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320803', '320800', '淮安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320804', '320800', '淮阴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320811', '320800', '清浦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320826', '320800', '涟水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320829', '320800', '洪泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320830', '320800', '盱眙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320831', '320800', '金湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320900', '320000', '盐城市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('320902', '320900', '亭湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320903', '320900', '盐都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320921', '320900', '响水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320922', '320900', '滨海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320923', '320900', '阜宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320924', '320900', '射阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320925', '320900', '建湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320981', '320900', '东台市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('320982', '320900', '大丰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321000', '320000', '扬州市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('321002', '321000', '广陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321003', '321000', '邗江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321012', '321000', '江都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321023', '321000', '宝应县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321081', '321000', '仪征市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321084', '321000', '高邮市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321100', '320000', '镇江市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('321102', '321100', '京口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321111', '321100', '润州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321112', '321100', '丹徒区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321181', '321100', '丹阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321182', '321100', '扬中市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321183', '321100', '句容市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321200', '320000', '泰州市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('321202', '321200', '海陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321203', '321200', '高港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321204', '321200', '姜堰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321281', '321200', '兴化市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321282', '321200', '靖江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321283', '321200', '泰兴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321300', '320000', '宿迁市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('321302', '321300', '宿城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321311', '321300', '宿豫区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321322', '321300', '沭阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321323', '321300', '泗阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('321324', '321300', '泗洪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330000', '0', '浙江省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('330100', '330000', '杭州市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330102', '330100', '上城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330103', '330100', '下城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330104', '330100', '江干区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330105', '330100', '拱墅区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330106', '330100', '西湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330108', '330100', '滨江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330109', '330100', '萧山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330110', '330100', '余杭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330111', '330100', '富阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330122', '330100', '桐庐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330127', '330100', '淳安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330182', '330100', '建德市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330185', '330100', '临安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330200', '330000', '宁波市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330203', '330200', '海曙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330204', '330200', '江东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330205', '330200', '江北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330206', '330200', '北仑区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330211', '330200', '镇海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330212', '330200', '鄞州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330225', '330200', '象山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330226', '330200', '宁海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330281', '330200', '余姚市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330282', '330200', '慈溪市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330283', '330200', '奉化市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330300', '330000', '温州市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330302', '330300', '鹿城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330303', '330300', '龙湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330304', '330300', '瓯海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330322', '330300', '洞头县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330324', '330300', '永嘉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330326', '330300', '平阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330327', '330300', '苍南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330328', '330300', '文成县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330329', '330300', '泰顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330381', '330300', '瑞安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330382', '330300', '乐清市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330400', '330000', '嘉兴市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330402', '330400', '南湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330411', '330400', '秀洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330421', '330400', '嘉善县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330424', '330400', '海盐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330481', '330400', '海宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330482', '330400', '平湖市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330483', '330400', '桐乡市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330500', '330000', '湖州市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330502', '330500', '吴兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330503', '330500', '南浔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330521', '330500', '德清县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330522', '330500', '长兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330523', '330500', '安吉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330600', '330000', '绍兴市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330602', '330600', '越城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330603', '330600', '柯桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330604', '330600', '上虞区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330624', '330600', '新昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330681', '330600', '诸暨市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330683', '330600', '嵊州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330700', '330000', '金华市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330702', '330700', '婺城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330703', '330700', '金东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330723', '330700', '武义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330726', '330700', '浦江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330727', '330700', '磐安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330781', '330700', '兰溪市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330782', '330700', '义乌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330783', '330700', '东阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330784', '330700', '永康市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330800', '330000', '衢州市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330802', '330800', '柯城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330803', '330800', '衢江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330822', '330800', '常山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330824', '330800', '开化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330825', '330800', '龙游县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330881', '330800', '江山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330900', '330000', '舟山市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('330902', '330900', '定海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330903', '330900', '普陀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330921', '330900', '岱山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('330922', '330900', '嵊泗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331000', '330000', '台州市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('331002', '331000', '椒江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331003', '331000', '黄岩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331004', '331000', '路桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331021', '331000', '玉环县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331022', '331000', '三门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331023', '331000', '天台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331024', '331000', '仙居县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331081', '331000', '温岭市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331082', '331000', '临海市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331100', '330000', '丽水市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('331102', '331100', '莲都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331121', '331100', '青田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331122', '331100', '缙云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331123', '331100', '遂昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331124', '331100', '松阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331125', '331100', '云和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331126', '331100', '庆元县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331127', '331100', '景宁畲族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('331181', '331100', '龙泉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340000', '0', '安徽省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('340100', '340000', '合肥市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340102', '340100', '瑶海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340103', '340100', '庐阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340104', '340100', '蜀山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340111', '340100', '包河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340121', '340100', '长丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340122', '340100', '肥东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340123', '340100', '肥西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340124', '340100', '庐江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340181', '340100', '巢湖市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340200', '340000', '芜湖市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340202', '340200', '镜湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340203', '340200', '弋江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340207', '340200', '鸠江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340208', '340200', '三山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340221', '340200', '芜湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340222', '340200', '繁昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340223', '340200', '南陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340225', '340200', '无为县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340300', '340000', '蚌埠市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340302', '340300', '龙子湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340303', '340300', '蚌山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340304', '340300', '禹会区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340311', '340300', '淮上区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340321', '340300', '怀远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340322', '340300', '五河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340323', '340300', '固镇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340400', '340000', '淮南市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340402', '340400', '大通区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340403', '340400', '田家庵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340404', '340400', '谢家集区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340405', '340400', '八公山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340406', '340400', '潘集区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340421', '340400', '凤台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340500', '340000', '马鞍山市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340503', '340500', '花山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340504', '340500', '雨山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340506', '340500', '博望区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340521', '340500', '当涂县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340522', '340500', '含山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340523', '340500', '和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340600', '340000', '淮北市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340602', '340600', '杜集区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340603', '340600', '相山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340604', '340600', '烈山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340621', '340600', '濉溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340700', '340000', '铜陵市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340702', '340700', '铜官山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340703', '340700', '狮子山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340711', '340700', '郊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340721', '340700', '铜陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340800', '340000', '安庆市', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('340802', '340800', '迎江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340803', '340800', '大观区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340811', '340800', '宜秀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340822', '340800', '怀宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340823', '340800', '枞阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340824', '340800', '潜山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340825', '340800', '太湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340826', '340800', '宿松县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340827', '340800', '望江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340828', '340800', '岳西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('340881', '340800', '桐城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341000', '340000', '黄山市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341002', '341000', '屯溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341003', '341000', '黄山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341004', '341000', '徽州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341021', '341000', '歙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341022', '341000', '休宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341023', '341000', '黟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341024', '341000', '祁门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341100', '340000', '滁州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341102', '341100', '琅琊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341103', '341100', '南谯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341122', '341100', '来安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341124', '341100', '全椒县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341125', '341100', '定远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341126', '341100', '凤阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341181', '341100', '天长市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341182', '341100', '明光市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341200', '340000', '阜阳市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341202', '341200', '颍州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341203', '341200', '颍东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341204', '341200', '颍泉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341221', '341200', '临泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341222', '341200', '太和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341225', '341200', '阜南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341226', '341200', '颍上县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341282', '341200', '界首市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341300', '340000', '宿州市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341302', '341300', '埇桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341321', '341300', '砀山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341322', '341300', '萧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341323', '341300', '灵璧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341324', '341300', '泗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341500', '340000', '六安市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341502', '341500', '金安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341503', '341500', '裕安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341521', '341500', '寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341522', '341500', '霍邱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341523', '341500', '舒城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341524', '341500', '金寨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341525', '341500', '霍山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341600', '340000', '亳州市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341602', '341600', '谯城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341621', '341600', '涡阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341622', '341600', '蒙城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341623', '341600', '利辛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341700', '340000', '池州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341702', '341700', '贵池区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341721', '341700', '东至县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341722', '341700', '石台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341723', '341700', '青阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341800', '340000', '宣城市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('341802', '341800', '宣州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341821', '341800', '郎溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341822', '341800', '广德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341823', '341800', '泾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341824', '341800', '绩溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341825', '341800', '旌德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('341881', '341800', '宁国市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350000', '0', '福建省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('350100', '350000', '福州市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350102', '350100', '鼓楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350103', '350100', '台江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350104', '350100', '仓山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350105', '350100', '马尾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350111', '350100', '晋安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350121', '350100', '闽侯县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350122', '350100', '连江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350123', '350100', '罗源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350124', '350100', '闽清县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350125', '350100', '永泰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350128', '350100', '平潭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350181', '350100', '福清市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350182', '350100', '长乐市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350200', '350000', '厦门市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350203', '350200', '思明区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350205', '350200', '海沧区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350206', '350200', '湖里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350211', '350200', '集美区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350212', '350200', '同安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350213', '350200', '翔安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350300', '350000', '莆田市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350302', '350300', '城厢区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350303', '350300', '涵江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350304', '350300', '荔城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350305', '350300', '秀屿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350322', '350300', '仙游县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350400', '350000', '三明市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350402', '350400', '梅列区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350403', '350400', '三元区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350421', '350400', '明溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350423', '350400', '清流县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350424', '350400', '宁化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350425', '350400', '大田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350426', '350400', '尤溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350427', '350400', '沙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350428', '350400', '将乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350429', '350400', '泰宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350430', '350400', '建宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350481', '350400', '永安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350500', '350000', '泉州市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350502', '350500', '鲤城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350503', '350500', '丰泽区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350504', '350500', '洛江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350505', '350500', '泉港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350521', '350500', '惠安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350524', '350500', '安溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350525', '350500', '永春县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350526', '350500', '德化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350527', '350500', '金门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350581', '350500', '石狮市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350582', '350500', '晋江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350583', '350500', '南安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350600', '350000', '漳州市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350602', '350600', '芗城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350603', '350600', '龙文区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350622', '350600', '云霄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350623', '350600', '漳浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350624', '350600', '诏安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350625', '350600', '长泰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350626', '350600', '东山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350627', '350600', '南靖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350628', '350600', '平和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350629', '350600', '华安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350681', '350600', '龙海市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350700', '350000', '南平市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350702', '350700', '延平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350703', '350700', '建阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350721', '350700', '顺昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350722', '350700', '浦城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350723', '350700', '光泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350724', '350700', '松溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350725', '350700', '政和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350781', '350700', '邵武市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350782', '350700', '武夷山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350783', '350700', '建瓯市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350800', '350000', '龙岩市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350802', '350800', '新罗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350803', '350800', '永定区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350821', '350800', '长汀县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350823', '350800', '上杭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350824', '350800', '武平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350825', '350800', '连城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350881', '350800', '漳平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350900', '350000', '宁德市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('350902', '350900', '蕉城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350921', '350900', '霞浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350922', '350900', '古田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350923', '350900', '屏南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350924', '350900', '寿宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350925', '350900', '周宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350926', '350900', '柘荣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350981', '350900', '福安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('350982', '350900', '福鼎市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360000', '0', '江西省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('360100', '360000', '南昌市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360102', '360100', '东湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360103', '360100', '西湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360104', '360100', '青云谱区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360105', '360100', '湾里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360111', '360100', '青山湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360121', '360100', '南昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360122', '360100', '新建县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360123', '360100', '安义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360124', '360100', '进贤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360200', '360000', '景德镇市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360202', '360200', '昌江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360203', '360200', '珠山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360222', '360200', '浮梁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360281', '360200', '乐平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360300', '360000', '萍乡市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360302', '360300', '安源区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360313', '360300', '湘东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360321', '360300', '莲花县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360322', '360300', '上栗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360323', '360300', '芦溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360400', '360000', '九江市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360402', '360400', '庐山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360403', '360400', '浔阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360421', '360400', '九江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360423', '360400', '武宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360424', '360400', '修水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360425', '360400', '永修县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360426', '360400', '德安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360427', '360400', '星子县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360428', '360400', '都昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360429', '360400', '湖口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360430', '360400', '彭泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360481', '360400', '瑞昌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360482', '360400', '共青城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360500', '360000', '新余市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360502', '360500', '渝水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360521', '360500', '分宜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360600', '360000', '鹰潭市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360602', '360600', '月湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360622', '360600', '余江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360681', '360600', '贵溪市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360700', '360000', '赣州市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360702', '360700', '章贡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360703', '360700', '南康区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360721', '360700', '赣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360722', '360700', '信丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360723', '360700', '大余县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360724', '360700', '上犹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360725', '360700', '崇义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360726', '360700', '安远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360727', '360700', '龙南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360728', '360700', '定南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360729', '360700', '全南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360730', '360700', '宁都县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360731', '360700', '于都县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360732', '360700', '兴国县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360733', '360700', '会昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360734', '360700', '寻乌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360735', '360700', '石城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360781', '360700', '瑞金市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360800', '360000', '吉安市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360802', '360800', '吉州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360803', '360800', '青原区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360821', '360800', '吉安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360822', '360800', '吉水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360823', '360800', '峡江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360824', '360800', '新干县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360825', '360800', '永丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360826', '360800', '泰和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360827', '360800', '遂川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360828', '360800', '万安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360829', '360800', '安福县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360830', '360800', '永新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360881', '360800', '井冈山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360900', '360000', '宜春市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('360902', '360900', '袁州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360921', '360900', '奉新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360922', '360900', '万载县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360923', '360900', '上高县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360924', '360900', '宜丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360925', '360900', '靖安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360926', '360900', '铜鼓县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360981', '360900', '丰城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360982', '360900', '樟树市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('360983', '360900', '高安市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361000', '360000', '抚州市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('361002', '361000', '临川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361021', '361000', '南城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361022', '361000', '黎川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361023', '361000', '南丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361024', '361000', '崇仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361025', '361000', '乐安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361026', '361000', '宜黄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361027', '361000', '金溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361028', '361000', '资溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361029', '361000', '东乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361030', '361000', '广昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361100', '360000', '上饶市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('361102', '361100', '信州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361103', '361100', '广丰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361121', '361100', '上饶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361123', '361100', '玉山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361124', '361100', '铅山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361125', '361100', '横峰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361126', '361100', '弋阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361127', '361100', '余干县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361128', '361100', '鄱阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361129', '361100', '万年县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361130', '361100', '婺源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('361181', '361100', '德兴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370000', '0', '山东省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('370100', '370000', '济南市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370102', '370100', '历下区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370103', '370100', '市中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370104', '370100', '槐荫区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370105', '370100', '天桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370112', '370100', '历城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370113', '370100', '长清区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370124', '370100', '平阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370125', '370100', '济阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370126', '370100', '商河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370181', '370100', '章丘市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370200', '370000', '青岛市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370202', '370200', '市南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370203', '370200', '市北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370211', '370200', '黄岛区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370212', '370200', '崂山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370213', '370200', '李沧区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370214', '370200', '城阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370281', '370200', '胶州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370282', '370200', '即墨市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370283', '370200', '平度市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370285', '370200', '莱西市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370300', '370000', '淄博市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370302', '370300', '淄川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370303', '370300', '张店区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370304', '370300', '博山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370305', '370300', '临淄区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370306', '370300', '周村区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370321', '370300', '桓台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370322', '370300', '高青县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370323', '370300', '沂源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370400', '370000', '枣庄市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370402', '370400', '市中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370403', '370400', '薛城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370404', '370400', '峄城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370405', '370400', '台儿庄区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370406', '370400', '山亭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370481', '370400', '滕州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370500', '370000', '东营市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370502', '370500', '东营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370503', '370500', '河口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370521', '370500', '垦利县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370522', '370500', '利津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370523', '370500', '广饶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370600', '370000', '烟台市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370602', '370600', '芝罘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370611', '370600', '福山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370612', '370600', '牟平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370613', '370600', '莱山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370634', '370600', '长岛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370681', '370600', '龙口市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370682', '370600', '莱阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370683', '370600', '莱州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370684', '370600', '蓬莱市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370685', '370600', '招远市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370686', '370600', '栖霞市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370687', '370600', '海阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370700', '370000', '潍坊市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370702', '370700', '潍城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370703', '370700', '寒亭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370704', '370700', '坊子区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370705', '370700', '奎文区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370724', '370700', '临朐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370725', '370700', '昌乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370781', '370700', '青州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370782', '370700', '诸城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370783', '370700', '寿光市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370784', '370700', '安丘市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370785', '370700', '高密市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370786', '370700', '昌邑市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370800', '370000', '济宁市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370811', '370800', '任城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370812', '370800', '兖州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370826', '370800', '微山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370827', '370800', '鱼台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370828', '370800', '金乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370829', '370800', '嘉祥县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370830', '370800', '汶上县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370831', '370800', '泗水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370832', '370800', '梁山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370881', '370800', '曲阜市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370883', '370800', '邹城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370900', '370000', '泰安市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('370902', '370900', '泰山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370911', '370900', '岱岳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370921', '370900', '宁阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370923', '370900', '东平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370982', '370900', '新泰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('370983', '370900', '肥城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371000', '370000', '威海市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371002', '371000', '环翠区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371081', '371000', '文登市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371082', '371000', '荣成市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371083', '371000', '乳山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371100', '370000', '日照市', '1', '0', 'R', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371102', '371100', '东港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371103', '371100', '岚山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371121', '371100', '五莲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371122', '371100', '莒县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371200', '370000', '莱芜市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371202', '371200', '莱城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371203', '371200', '钢城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371300', '370000', '临沂市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371302', '371300', '兰山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371311', '371300', '罗庄区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371312', '371300', '河东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371321', '371300', '沂南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371322', '371300', '郯城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371323', '371300', '沂水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371324', '371300', '兰陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371325', '371300', '费县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371326', '371300', '平邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371327', '371300', '莒南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371328', '371300', '蒙阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371329', '371300', '临沭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371400', '370000', '德州市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371402', '371400', '德城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371403', '371400', '陵城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371422', '371400', '宁津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371423', '371400', '庆云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371424', '371400', '临邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371425', '371400', '齐河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371426', '371400', '平原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371427', '371400', '夏津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371428', '371400', '武城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371481', '371400', '乐陵市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371482', '371400', '禹城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371500', '370000', '聊城市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371502', '371500', '东昌府区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371521', '371500', '阳谷县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371522', '371500', '莘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371523', '371500', '茌平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371524', '371500', '东阿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371525', '371500', '冠县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371526', '371500', '高唐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371581', '371500', '临清市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371600', '370000', '滨州市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371602', '371600', '滨城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371603', '371600', '沾化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371621', '371600', '惠民县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371622', '371600', '阳信县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371623', '371600', '无棣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371625', '371600', '博兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371626', '371600', '邹平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371700', '370000', '菏泽市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('371702', '371700', '牡丹区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371721', '371700', '曹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371722', '371700', '单县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371723', '371700', '成武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371724', '371700', '巨野县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371725', '371700', '郓城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371726', '371700', '鄄城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371727', '371700', '定陶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('371728', '371700', '东明县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410000', '0', '河南省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('410100', '410000', '郑州市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410102', '410100', '中原区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410103', '410100', '二七区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410104', '410100', '管城回族区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410105', '410100', '金水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410106', '410100', '上街区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410108', '410100', '惠济区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410122', '410100', '中牟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410181', '410100', '巩义市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410182', '410100', '荥阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410183', '410100', '新密市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410184', '410100', '新郑市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410185', '410100', '登封市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410200', '410000', '开封市', '1', '0', 'K', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410202', '410200', '龙亭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410203', '410200', '顺河回族区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410204', '410200', '鼓楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410205', '410200', '禹王台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410212', '410200', '祥符区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410221', '410200', '杞县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410222', '410200', '通许县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410223', '410200', '尉氏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410225', '410200', '兰考县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410300', '410000', '洛阳市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410302', '410300', '老城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410303', '410300', '西工区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410304', '410300', '瀍河回族区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410305', '410300', '涧西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410306', '410300', '吉利区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410311', '410300', '洛龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410322', '410300', '孟津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410323', '410300', '新安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410324', '410300', '栾川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410325', '410300', '嵩县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410326', '410300', '汝阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410327', '410300', '宜阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410328', '410300', '洛宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410329', '410300', '伊川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410381', '410300', '偃师市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410400', '410000', '平顶山市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410402', '410400', '新华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410403', '410400', '卫东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410404', '410400', '石龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410411', '410400', '湛河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410421', '410400', '宝丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410422', '410400', '叶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410423', '410400', '鲁山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410425', '410400', '郏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410481', '410400', '舞钢市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410482', '410400', '汝州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410500', '410000', '安阳市', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410502', '410500', '文峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410503', '410500', '北关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410505', '410500', '殷都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410506', '410500', '龙安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410522', '410500', '安阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410523', '410500', '汤阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410526', '410500', '滑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410527', '410500', '内黄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410581', '410500', '林州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410600', '410000', '鹤壁市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410602', '410600', '鹤山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410603', '410600', '山城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410611', '410600', '淇滨区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410621', '410600', '浚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410622', '410600', '淇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410700', '410000', '新乡市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410702', '410700', '红旗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410703', '410700', '卫滨区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410704', '410700', '凤泉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410711', '410700', '牧野区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410721', '410700', '新乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410724', '410700', '获嘉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410725', '410700', '原阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410726', '410700', '延津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410727', '410700', '封丘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410728', '410700', '长垣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410781', '410700', '卫辉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410782', '410700', '辉县市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410800', '410000', '焦作市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410802', '410800', '解放区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410803', '410800', '中站区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410804', '410800', '马村区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410811', '410800', '山阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410821', '410800', '修武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410822', '410800', '博爱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410823', '410800', '武陟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410825', '410800', '温县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410882', '410800', '沁阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410883', '410800', '孟州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410900', '410000', '濮阳市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('410902', '410900', '华龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410922', '410900', '清丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410923', '410900', '南乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410926', '410900', '范县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410927', '410900', '台前县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('410928', '410900', '濮阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411000', '410000', '许昌市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411002', '411000', '魏都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411023', '411000', '许昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411024', '411000', '鄢陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411025', '411000', '襄城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411081', '411000', '禹州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411082', '411000', '长葛市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411100', '410000', '漯河市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411102', '411100', '源汇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411103', '411100', '郾城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411104', '411100', '召陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411121', '411100', '舞阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411122', '411100', '临颍县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411200', '410000', '三门峡市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411202', '411200', '湖滨区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411203', '411200', '陕州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411221', '411200', '渑池县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411224', '411200', '卢氏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411281', '411200', '义马市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411282', '411200', '灵宝市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411300', '410000', '南阳市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411302', '411300', '宛城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411303', '411300', '卧龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411321', '411300', '南召县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411322', '411300', '方城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411323', '411300', '西峡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411324', '411300', '镇平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411325', '411300', '内乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411326', '411300', '淅川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411327', '411300', '社旗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411328', '411300', '唐河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411329', '411300', '新野县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411330', '411300', '桐柏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411381', '411300', '邓州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411400', '410000', '商丘市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411402', '411400', '梁园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411403', '411400', '睢阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411421', '411400', '民权县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411422', '411400', '睢县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411423', '411400', '宁陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411424', '411400', '柘城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411425', '411400', '虞城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411426', '411400', '夏邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411481', '411400', '永城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411500', '410000', '信阳市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411502', '411500', '浉河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411503', '411500', '平桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411521', '411500', '罗山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411522', '411500', '光山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411523', '411500', '新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411524', '411500', '商城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411525', '411500', '固始县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411526', '411500', '潢川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411527', '411500', '淮滨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411528', '411500', '息县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411600', '410000', '周口市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411602', '411600', '川汇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411621', '411600', '扶沟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411622', '411600', '西华县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411623', '411600', '商水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411624', '411600', '沈丘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411625', '411600', '郸城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411626', '411600', '淮阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411627', '411600', '太康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411628', '411600', '鹿邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411681', '411600', '项城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411700', '410000', '驻马店市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('411702', '411700', '驿城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411721', '411700', '西平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411722', '411700', '上蔡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411723', '411700', '平舆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411724', '411700', '正阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411725', '411700', '确山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411726', '411700', '泌阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411727', '411700', '汝南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411728', '411700', '遂平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('411729', '411700', '新蔡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('419000', '410000', '省直辖县级行政区划', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('419001', '419000', '济源市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420000', '0', '湖北省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('420100', '420000', '武汉市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420102', '420100', '江岸区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420103', '420100', '江汉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420104', '420100', '硚口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420105', '420100', '汉阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420106', '420100', '武昌区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420107', '420100', '青山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420111', '420100', '洪山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420112', '420100', '东西湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420113', '420100', '汉南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420114', '420100', '蔡甸区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420115', '420100', '江夏区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420116', '420100', '黄陂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420117', '420100', '新洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420200', '420000', '黄石市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420202', '420200', '黄石港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420203', '420200', '西塞山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420204', '420200', '下陆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420205', '420200', '铁山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420222', '420200', '阳新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420281', '420200', '大冶市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420300', '420000', '十堰市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420302', '420300', '茅箭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420303', '420300', '张湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420304', '420300', '郧阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420322', '420300', '郧西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420323', '420300', '竹山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420324', '420300', '竹溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420325', '420300', '房县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420381', '420300', '丹江口市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420500', '420000', '宜昌市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420502', '420500', '西陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420503', '420500', '伍家岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420504', '420500', '点军区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420505', '420500', '猇亭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420506', '420500', '夷陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420525', '420500', '远安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420526', '420500', '兴山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420527', '420500', '秭归县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420528', '420500', '长阳土家族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420529', '420500', '五峰土家族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420581', '420500', '宜都市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420582', '420500', '当阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420583', '420500', '枝江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420600', '420000', '襄阳市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420602', '420600', '襄城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420606', '420600', '樊城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420607', '420600', '襄州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420624', '420600', '南漳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420625', '420600', '谷城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420626', '420600', '保康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420682', '420600', '老河口市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420683', '420600', '枣阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420684', '420600', '宜城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420700', '420000', '鄂州市', '1', '0', 'E', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420702', '420700', '梁子湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420703', '420700', '华容区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420704', '420700', '鄂城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420800', '420000', '荆门市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420802', '420800', '东宝区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420804', '420800', '掇刀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420821', '420800', '京山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420822', '420800', '沙洋县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420881', '420800', '钟祥市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420900', '420000', '孝感市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('420902', '420900', '孝南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420921', '420900', '孝昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420922', '420900', '大悟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420923', '420900', '云梦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420981', '420900', '应城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420982', '420900', '安陆市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('420984', '420900', '汉川市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421000', '420000', '荆州市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('421002', '421000', '沙市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421003', '421000', '荆州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421022', '421000', '公安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421023', '421000', '监利县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421024', '421000', '江陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421081', '421000', '石首市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421083', '421000', '洪湖市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421087', '421000', '松滋市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421100', '420000', '黄冈市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('421102', '421100', '黄州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421121', '421100', '团风县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421122', '421100', '红安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421123', '421100', '罗田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421124', '421100', '英山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421125', '421100', '浠水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421126', '421100', '蕲春县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421127', '421100', '黄梅县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421181', '421100', '麻城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421182', '421100', '武穴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421200', '420000', '咸宁市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('421202', '421200', '咸安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421221', '421200', '嘉鱼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421222', '421200', '通城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421223', '421200', '崇阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421224', '421200', '通山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421281', '421200', '赤壁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421300', '420000', '随州市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('421303', '421300', '曾都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421321', '421300', '随县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('421381', '421300', '广水市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422800', '420000', '恩施土家族苗族自治州', '1', '0', 'E', '1', '1');
INSERT INTO `cmf_areas` VALUES ('422801', '422800', '恩施市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422802', '422800', '利川市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422822', '422800', '建始县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422823', '422800', '巴东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422825', '422800', '宣恩县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422826', '422800', '咸丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422827', '422800', '来凤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('422828', '422800', '鹤峰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('429000', '420000', '省直辖县级行政区划', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('429004', '429000', '仙桃市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('429005', '429000', '潜江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('429006', '429000', '天门市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('429021', '429000', '神农架林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430000', '0', '湖南省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('430100', '430000', '长沙市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430102', '430100', '芙蓉区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430103', '430100', '天心区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430104', '430100', '岳麓区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430105', '430100', '开福区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430111', '430100', '雨花区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430112', '430100', '望城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430121', '430100', '长沙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430124', '430100', '宁乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430181', '430100', '浏阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430200', '430000', '株洲市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430202', '430200', '荷塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430203', '430200', '芦淞区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430204', '430200', '石峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430211', '430200', '天元区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430221', '430200', '株洲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430223', '430200', '攸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430224', '430200', '茶陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430225', '430200', '炎陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430281', '430200', '醴陵市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430300', '430000', '湘潭市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430302', '430300', '雨湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430304', '430300', '岳塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430321', '430300', '湘潭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430381', '430300', '湘乡市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430382', '430300', '韶山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430400', '430000', '衡阳市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430405', '430400', '珠晖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430406', '430400', '雁峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430407', '430400', '石鼓区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430408', '430400', '蒸湘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430412', '430400', '南岳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430421', '430400', '衡阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430422', '430400', '衡南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430423', '430400', '衡山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430424', '430400', '衡东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430426', '430400', '祁东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430481', '430400', '耒阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430482', '430400', '常宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430500', '430000', '邵阳市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430502', '430500', '双清区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430503', '430500', '大祥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430511', '430500', '北塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430521', '430500', '邵东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430522', '430500', '新邵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430523', '430500', '邵阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430524', '430500', '隆回县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430525', '430500', '洞口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430527', '430500', '绥宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430528', '430500', '新宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430529', '430500', '城步苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430581', '430500', '武冈市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430600', '430000', '岳阳市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430602', '430600', '岳阳楼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430603', '430600', '云溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430611', '430600', '君山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430621', '430600', '岳阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430623', '430600', '华容县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430624', '430600', '湘阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430626', '430600', '平江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430681', '430600', '汨罗市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430682', '430600', '临湘市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430700', '430000', '常德市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430702', '430700', '武陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430703', '430700', '鼎城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430721', '430700', '安乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430722', '430700', '汉寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430723', '430700', '澧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430724', '430700', '临澧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430725', '430700', '桃源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430726', '430700', '石门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430781', '430700', '津市市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430800', '430000', '张家界市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430802', '430800', '永定区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430811', '430800', '武陵源区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430821', '430800', '慈利县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430822', '430800', '桑植县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430900', '430000', '益阳市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('430902', '430900', '资阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430903', '430900', '赫山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430921', '430900', '南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430922', '430900', '桃江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430923', '430900', '安化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('430981', '430900', '沅江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431000', '430000', '郴州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('431002', '431000', '北湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431003', '431000', '苏仙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431021', '431000', '桂阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431022', '431000', '宜章县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431023', '431000', '永兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431024', '431000', '嘉禾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431025', '431000', '临武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431026', '431000', '汝城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431027', '431000', '桂东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431028', '431000', '安仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431081', '431000', '资兴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431100', '430000', '永州市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('431102', '431100', '零陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431103', '431100', '冷水滩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431121', '431100', '祁阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431122', '431100', '东安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431123', '431100', '双牌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431124', '431100', '道县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431125', '431100', '江永县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431126', '431100', '宁远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431127', '431100', '蓝山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431128', '431100', '新田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431129', '431100', '江华瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431200', '430000', '怀化市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('431202', '431200', '鹤城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431221', '431200', '中方县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431222', '431200', '沅陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431223', '431200', '辰溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431224', '431200', '溆浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431225', '431200', '会同县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431226', '431200', '麻阳苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431227', '431200', '新晃侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431228', '431200', '芷江侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431229', '431200', '靖州苗族侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431230', '431200', '通道侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431281', '431200', '洪江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431300', '430000', '娄底市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('431302', '431300', '娄星区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431321', '431300', '双峰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431322', '431300', '新化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431381', '431300', '冷水江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('431382', '431300', '涟源市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433100', '430000', '湘西土家族苗族自治州', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('433101', '433100', '吉首市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433122', '433100', '泸溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433123', '433100', '凤凰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433124', '433100', '花垣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433125', '433100', '保靖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433126', '433100', '古丈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433127', '433100', '永顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('433130', '433100', '龙山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440000', '0', '广东省', '1', '60', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('440100', '440000', '广州市', '1', '58', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440103', '440100', '荔湾区', '1', '1', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440104', '440100', '越秀区', '1', '2', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440105', '440100', '海珠区', '1', '3', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440106', '440100', '天河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440111', '440100', '白云区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440112', '440100', '黄埔区', '1', '4', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440113', '440100', '番禺区', '1', '5', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440114', '440100', '花都区', '1', '6', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440115', '440100', '南沙区', '1', '7', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440117', '440100', '从化区', '1', '8', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440118', '440100', '增城区', '1', '9', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440200', '440000', '韶关市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440203', '440200', '武江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440204', '440200', '浈江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440205', '440200', '曲江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440222', '440200', '始兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440224', '440200', '仁化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440229', '440200', '翁源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440232', '440200', '乳源瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440233', '440200', '新丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440281', '440200', '乐昌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440282', '440200', '南雄市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440300', '440000', '深圳市', '1', '59', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440303', '440300', '罗湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440304', '440300', '福田区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440305', '440300', '南山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440306', '440300', '宝安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440307', '440300', '龙岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440308', '440300', '盐田区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440400', '440000', '珠海市', '1', '54', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440402', '440400', '香洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440403', '440400', '斗门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440404', '440400', '金湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440500', '440000', '汕头市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440507', '440500', '龙湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440511', '440500', '金平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440512', '440500', '濠江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440513', '440500', '潮阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440514', '440500', '潮南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440515', '440500', '澄海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440523', '440500', '南澳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440600', '440000', '佛山市', '1', '57', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440604', '440600', '禅城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440605', '440600', '南海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440606', '440600', '顺德区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440607', '440600', '三水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440608', '440600', '高明区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440700', '440000', '江门市', '1', '53', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440703', '440700', '蓬江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440704', '440700', '江海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440705', '440700', '新会区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440781', '440700', '台山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440783', '440700', '开平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440784', '440700', '鹤山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440785', '440700', '恩平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440800', '440000', '湛江市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440802', '440800', '赤坎区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440803', '440800', '霞山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440804', '440800', '坡头区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440811', '440800', '麻章区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440823', '440800', '遂溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440825', '440800', '徐闻县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440881', '440800', '廉江市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440882', '440800', '雷州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440883', '440800', '吴川市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440900', '440000', '茂名市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('440902', '440900', '茂南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440904', '440900', '电白区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440981', '440900', '高州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440982', '440900', '化州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('440983', '440900', '信宜市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441200', '440000', '肇庆市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441202', '441200', '端州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441203', '441200', '鼎湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441223', '441200', '广宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441224', '441200', '怀集县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441225', '441200', '封开县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441226', '441200', '德庆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441283', '441200', '高要市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441284', '441200', '四会市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441300', '440000', '惠州市', '1', '55', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441302', '441300', '惠城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441303', '441300', '惠阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441322', '441300', '博罗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441323', '441300', '惠东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441324', '441300', '龙门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441400', '440000', '梅州市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441402', '441400', '梅江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441403', '441400', '梅县区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441422', '441400', '大埔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441423', '441400', '丰顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441424', '441400', '五华县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441426', '441400', '平远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441427', '441400', '蕉岭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441481', '441400', '兴宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441500', '440000', '汕尾市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441502', '441500', '城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441521', '441500', '海丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441523', '441500', '陆河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441581', '441500', '陆丰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441600', '440000', '河源市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441602', '441600', '源城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441621', '441600', '紫金县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441622', '441600', '龙川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441623', '441600', '连平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441624', '441600', '和平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441625', '441600', '东源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441700', '440000', '阳江市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441702', '441700', '江城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441704', '441700', '阳东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441721', '441700', '阳西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441781', '441700', '阳春市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441800', '440000', '清远市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('441802', '441800', '清城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441803', '441800', '清新区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441821', '441800', '佛冈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441823', '441800', '阳山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441825', '441800', '连山壮族瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441826', '441800', '连南瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441881', '441800', '英德市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441882', '441800', '连州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441900', '440000', '东莞市', '1', '60', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('442000', '440000', '中山市', '1', '56', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('445100', '440000', '潮州市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('445102', '445100', '湘桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445103', '445100', '潮安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445122', '445100', '饶平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445200', '440000', '揭阳市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('445202', '445200', '榕城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445203', '445200', '揭东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445222', '445200', '揭西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445224', '445200', '惠来县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445281', '445200', '普宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445300', '440000', '云浮市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('445302', '445300', '云城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445303', '445300', '云安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445321', '445300', '新兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445322', '445300', '郁南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('445381', '445300', '罗定市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450000', '0', '广西壮族自治区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('450100', '450000', '南宁市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450102', '450100', '兴宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450103', '450100', '青秀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450105', '450100', '江南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450107', '450100', '西乡塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450108', '450100', '良庆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450109', '450100', '邕宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450110', '450100', '武鸣区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450123', '450100', '隆安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450124', '450100', '马山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450125', '450100', '上林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450126', '450100', '宾阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450127', '450100', '横县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450200', '450000', '柳州市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450202', '450200', '城中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450203', '450200', '鱼峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450204', '450200', '柳南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450205', '450200', '柳北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450221', '450200', '柳江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450222', '450200', '柳城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450223', '450200', '鹿寨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450224', '450200', '融安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450225', '450200', '融水苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450226', '450200', '三江侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450300', '450000', '桂林市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450302', '450300', '秀峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450303', '450300', '叠彩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450304', '450300', '象山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450305', '450300', '七星区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450311', '450300', '雁山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450312', '450300', '临桂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450321', '450300', '阳朔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450323', '450300', '灵川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450324', '450300', '全州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450325', '450300', '兴安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450326', '450300', '永福县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450327', '450300', '灌阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450328', '450300', '龙胜各族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450329', '450300', '资源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450330', '450300', '平乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450331', '450300', '荔浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450332', '450300', '恭城瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450400', '450000', '梧州市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450403', '450400', '万秀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450405', '450400', '长洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450406', '450400', '龙圩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450421', '450400', '苍梧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450422', '450400', '藤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450423', '450400', '蒙山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450481', '450400', '岑溪市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450500', '450000', '北海市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450502', '450500', '海城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450503', '450500', '银海区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450512', '450500', '铁山港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450521', '450500', '合浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450600', '450000', '防城港市', '1', '0', 'F', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450602', '450600', '港口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450603', '450600', '防城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450621', '450600', '上思县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450681', '450600', '东兴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450700', '450000', '钦州市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450702', '450700', '钦南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450703', '450700', '钦北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450721', '450700', '灵山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450722', '450700', '浦北县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450800', '450000', '贵港市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450802', '450800', '港北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450803', '450800', '港南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450804', '450800', '覃塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450821', '450800', '平南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450881', '450800', '桂平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450900', '450000', '玉林市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('450902', '450900', '玉州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450903', '450900', '福绵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450921', '450900', '容县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450922', '450900', '陆川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450923', '450900', '博白县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450924', '450900', '兴业县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('450981', '450900', '北流市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451000', '450000', '百色市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('451002', '451000', '右江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451021', '451000', '田阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451022', '451000', '田东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451023', '451000', '平果县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451024', '451000', '德保县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451025', '451000', '靖西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451026', '451000', '那坡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451027', '451000', '凌云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451028', '451000', '乐业县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451029', '451000', '田林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451030', '451000', '西林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451031', '451000', '隆林各族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451100', '450000', '贺州市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('451102', '451100', '八步区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451119', '451100', '平桂管理区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451121', '451100', '昭平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451122', '451100', '钟山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451123', '451100', '富川瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451200', '450000', '河池市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('451202', '451200', '金城江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451221', '451200', '南丹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451222', '451200', '天峨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451223', '451200', '凤山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451224', '451200', '东兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451225', '451200', '罗城仫佬族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451226', '451200', '环江毛南族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451227', '451200', '巴马瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451228', '451200', '都安瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451229', '451200', '大化瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451281', '451200', '宜州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451300', '450000', '来宾市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('451302', '451300', '兴宾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451321', '451300', '忻城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451322', '451300', '象州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451323', '451300', '武宣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451324', '451300', '金秀瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451381', '451300', '合山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451400', '450000', '崇左市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('451402', '451400', '江州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451421', '451400', '扶绥县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451422', '451400', '宁明县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451423', '451400', '龙州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451424', '451400', '大新县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451425', '451400', '天等县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('451481', '451400', '凭祥市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460000', '0', '海南省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('460100', '460000', '海口市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('460105', '460100', '秀英区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460106', '460100', '龙华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460107', '460100', '琼山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460108', '460100', '美兰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460200', '460000', '三亚市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('460202', '460200', '海棠区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460203', '460200', '吉阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460204', '460200', '天涯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460205', '460200', '崖州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('460300', '460000', '三沙市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('460400', '460000', '儋州市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('469000', '460000', '省直辖县级行政区划', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('469001', '469000', '五指山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469002', '469000', '琼海市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469005', '469000', '文昌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469006', '469000', '万宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469007', '469000', '东方市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469021', '469000', '定安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469022', '469000', '屯昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469023', '469000', '澄迈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469024', '469000', '临高县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469025', '469000', '白沙黎族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469026', '469000', '昌江黎族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469027', '469000', '乐东黎族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469028', '469000', '陵水黎族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469029', '469000', '保亭黎族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('469030', '469000', '琼中黎族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500000', '0', '重庆市', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('500101', '500100', '万州区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500102', '500100', '涪陵区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500103', '500100', '渝中区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500104', '500100', '大渡口区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500105', '500100', '江北区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500106', '500100', '沙坪坝区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500107', '500100', '九龙坡区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500108', '500100', '南岸区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500109', '500100', '北碚区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500110', '500100', '綦江区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500111', '500100', '大足区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500112', '500100', '渝北区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500113', '500100', '巴南区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500114', '500100', '黔江区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500115', '500100', '长寿区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500116', '500100', '江津区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500117', '500100', '合川区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500118', '500100', '永川区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500119', '500100', '南川区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500120', '500100', '璧山区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500151', '500100', '铜梁区', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500223', '500200', '潼南县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500226', '500200', '荣昌县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500228', '500200', '梁平县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500229', '500200', '城口县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500230', '500200', '丰都县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500231', '500200', '垫江县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500232', '500200', '武隆县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500233', '500200', '忠县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500234', '500200', '开县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500235', '500200', '云阳县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500236', '500200', '奉节县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500237', '500200', '巫山县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500238', '500200', '巫溪县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500240', '500200', '石柱土家族自治县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500241', '500200', '秀山土家族苗族自治县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500242', '500200', '酉阳土家族苗族自治县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('500243', '500200', '彭水苗族土家族自治县', '-1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510000', '0', '四川省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('510100', '510000', '成都市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510104', '510100', '锦江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510105', '510100', '青羊区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510106', '510100', '金牛区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510107', '510100', '武侯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510108', '510100', '成华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510112', '510100', '龙泉驿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510113', '510100', '青白江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510114', '510100', '新都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510115', '510100', '温江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510121', '510100', '金堂县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510122', '510100', '双流县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510124', '510100', '郫县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510129', '510100', '大邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510131', '510100', '蒲江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510132', '510100', '新津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510181', '510100', '都江堰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510182', '510100', '彭州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510183', '510100', '邛崃市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510184', '510100', '崇州市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510300', '510000', '自贡市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510302', '510300', '自流井区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510303', '510300', '贡井区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510304', '510300', '大安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510311', '510300', '沿滩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510321', '510300', '荣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510322', '510300', '富顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510400', '510000', '攀枝花市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510402', '510400', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510403', '510400', '西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510411', '510400', '仁和区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510421', '510400', '米易县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510422', '510400', '盐边县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510500', '510000', '泸州市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510502', '510500', '江阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510503', '510500', '纳溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510504', '510500', '龙马潭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510521', '510500', '泸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510522', '510500', '合江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510524', '510500', '叙永县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510525', '510500', '古蔺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510600', '510000', '德阳市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510603', '510600', '旌阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510623', '510600', '中江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510626', '510600', '罗江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510681', '510600', '广汉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510682', '510600', '什邡市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510683', '510600', '绵竹市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510700', '510000', '绵阳市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510703', '510700', '涪城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510704', '510700', '游仙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510722', '510700', '三台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510723', '510700', '盐亭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510724', '510700', '安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510725', '510700', '梓潼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510726', '510700', '北川羌族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510727', '510700', '平武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510781', '510700', '江油市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510800', '510000', '广元市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510802', '510800', '利州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510811', '510800', '昭化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510812', '510800', '朝天区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510821', '510800', '旺苍县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510822', '510800', '青川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510823', '510800', '剑阁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510824', '510800', '苍溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510900', '510000', '遂宁市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('510903', '510900', '船山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510904', '510900', '安居区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510921', '510900', '蓬溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510922', '510900', '射洪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('510923', '510900', '大英县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511000', '510000', '内江市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511002', '511000', '市中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511011', '511000', '东兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511024', '511000', '威远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511025', '511000', '资中县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511028', '511000', '隆昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511100', '510000', '乐山市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511102', '511100', '市中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511111', '511100', '沙湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511112', '511100', '五通桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511113', '511100', '金口河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511123', '511100', '犍为县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511124', '511100', '井研县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511126', '511100', '夹江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511129', '511100', '沐川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511132', '511100', '峨边彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511133', '511100', '马边彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511181', '511100', '峨眉山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511300', '510000', '南充市', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511302', '511300', '顺庆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511303', '511300', '高坪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511304', '511300', '嘉陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511321', '511300', '南部县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511322', '511300', '营山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511323', '511300', '蓬安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511324', '511300', '仪陇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511325', '511300', '西充县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511381', '511300', '阆中市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511400', '510000', '眉山市', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511402', '511400', '东坡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511403', '511400', '彭山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511421', '511400', '仁寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511423', '511400', '洪雅县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511424', '511400', '丹棱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511425', '511400', '青神县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511500', '510000', '宜宾市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511502', '511500', '翠屏区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511503', '511500', '南溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511521', '511500', '宜宾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511523', '511500', '江安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511524', '511500', '长宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511525', '511500', '高县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511526', '511500', '珙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511527', '511500', '筠连县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511528', '511500', '兴文县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511529', '511500', '屏山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511600', '510000', '广安市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511602', '511600', '广安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511603', '511600', '前锋区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511621', '511600', '岳池县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511622', '511600', '武胜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511623', '511600', '邻水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511681', '511600', '华蓥市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511700', '510000', '达州市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511702', '511700', '通川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511703', '511700', '达川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511722', '511700', '宣汉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511723', '511700', '开江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511724', '511700', '大竹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511725', '511700', '渠县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511781', '511700', '万源市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511800', '510000', '雅安市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511802', '511800', '雨城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511803', '511800', '名山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511822', '511800', '荥经县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511823', '511800', '汉源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511824', '511800', '石棉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511825', '511800', '天全县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511826', '511800', '芦山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511827', '511800', '宝兴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511900', '510000', '巴中市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('511902', '511900', '巴州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511903', '511900', '恩阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511921', '511900', '通江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511922', '511900', '南江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('511923', '511900', '平昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('512000', '510000', '资阳市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('512002', '512000', '雁江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('512021', '512000', '安岳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('512022', '512000', '乐至县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('512081', '512000', '简阳市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513200', '510000', '阿坝藏族羌族自治州', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('513221', '513200', '汶川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513222', '513200', '理县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513223', '513200', '茂县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513224', '513200', '松潘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513225', '513200', '九寨沟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513226', '513200', '金川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513227', '513200', '小金县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513228', '513200', '黑水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513229', '513200', '马尔康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513230', '513200', '壤塘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513231', '513200', '阿坝县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513232', '513200', '若尔盖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513233', '513200', '红原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513300', '510000', '甘孜藏族自治州', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('513301', '513300', '康定市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513322', '513300', '泸定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513323', '513300', '丹巴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513324', '513300', '九龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513325', '513300', '雅江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513326', '513300', '道孚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513327', '513300', '炉霍县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513328', '513300', '甘孜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513329', '513300', '新龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513330', '513300', '德格县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513331', '513300', '白玉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513332', '513300', '石渠县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513333', '513300', '色达县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513334', '513300', '理塘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513335', '513300', '巴塘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513336', '513300', '乡城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513337', '513300', '稻城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513338', '513300', '得荣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513400', '510000', '凉山彝族自治州', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('513401', '513400', '西昌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513422', '513400', '木里藏族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513423', '513400', '盐源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513424', '513400', '德昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513425', '513400', '会理县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513426', '513400', '会东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513427', '513400', '宁南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513428', '513400', '普格县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513429', '513400', '布拖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513430', '513400', '金阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513431', '513400', '昭觉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513432', '513400', '喜德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513433', '513400', '冕宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513434', '513400', '越西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513435', '513400', '甘洛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513436', '513400', '美姑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('513437', '513400', '雷波县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520000', '0', '贵州省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('520100', '520000', '贵阳市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520102', '520100', '南明区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520103', '520100', '云岩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520111', '520100', '花溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520112', '520100', '乌当区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520113', '520100', '白云区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520115', '520100', '观山湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520121', '520100', '开阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520122', '520100', '息烽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520123', '520100', '修文县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520181', '520100', '清镇市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520200', '520000', '六盘水市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520201', '520200', '钟山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520203', '520200', '六枝特区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520221', '520200', '水城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520222', '520200', '盘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520300', '520000', '遵义市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520302', '520300', '红花岗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520303', '520300', '汇川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520321', '520300', '遵义县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520322', '520300', '桐梓县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520323', '520300', '绥阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520324', '520300', '正安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520325', '520300', '道真仡佬族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520326', '520300', '务川仡佬族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520327', '520300', '凤冈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520328', '520300', '湄潭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520329', '520300', '余庆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520330', '520300', '习水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520381', '520300', '赤水市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520382', '520300', '仁怀市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520400', '520000', '安顺市', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520402', '520400', '西秀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520403', '520400', '平坝区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520422', '520400', '普定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520423', '520400', '镇宁布依族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520424', '520400', '关岭布依族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520425', '520400', '紫云苗族布依族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520500', '520000', '毕节市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520502', '520500', '七星关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520521', '520500', '大方县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520522', '520500', '黔西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520523', '520500', '金沙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520524', '520500', '织金县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520525', '520500', '纳雍县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520526', '520500', '威宁彝族回族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520527', '520500', '赫章县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520600', '520000', '铜仁市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('520602', '520600', '碧江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520603', '520600', '万山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520621', '520600', '江口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520622', '520600', '玉屏侗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520623', '520600', '石阡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520624', '520600', '思南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520625', '520600', '印江土家族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520626', '520600', '德江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520627', '520600', '沿河土家族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('520628', '520600', '松桃苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522300', '520000', '黔西南布依族苗族自治州', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('522301', '522300', '兴义市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522322', '522300', '兴仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522323', '522300', '普安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522324', '522300', '晴隆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522325', '522300', '贞丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522326', '522300', '望谟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522327', '522300', '册亨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522328', '522300', '安龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522600', '520000', '黔东南苗族侗族自治州', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('522601', '522600', '凯里市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522622', '522600', '黄平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522623', '522600', '施秉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522624', '522600', '三穗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522625', '522600', '镇远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522626', '522600', '岑巩县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522627', '522600', '天柱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522628', '522600', '锦屏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522629', '522600', '剑河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522630', '522600', '台江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522631', '522600', '黎平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522632', '522600', '榕江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522633', '522600', '从江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522634', '522600', '雷山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522635', '522600', '麻江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522636', '522600', '丹寨县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522700', '520000', '黔南布依族苗族自治州', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('522701', '522700', '都匀市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522702', '522700', '福泉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522722', '522700', '荔波县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522723', '522700', '贵定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522725', '522700', '瓮安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522726', '522700', '独山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522727', '522700', '平塘县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522728', '522700', '罗甸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522729', '522700', '长顺县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522730', '522700', '龙里县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522731', '522700', '惠水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('522732', '522700', '三都水族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530000', '0', '云南省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('530100', '530000', '昆明市', '1', '0', 'K', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530102', '530100', '五华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530103', '530100', '盘龙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530111', '530100', '官渡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530112', '530100', '西山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530113', '530100', '东川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530114', '530100', '呈贡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530122', '530100', '晋宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530124', '530100', '富民县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530125', '530100', '宜良县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530126', '530100', '石林彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530127', '530100', '嵩明县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530128', '530100', '禄劝彝族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530129', '530100', '寻甸回族彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530181', '530100', '安宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530300', '530000', '曲靖市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530302', '530300', '麒麟区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530321', '530300', '马龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530322', '530300', '陆良县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530323', '530300', '师宗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530324', '530300', '罗平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530325', '530300', '富源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530326', '530300', '会泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530328', '530300', '沾益县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530381', '530300', '宣威市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530400', '530000', '玉溪市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530402', '530400', '红塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530421', '530400', '江川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530422', '530400', '澄江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530423', '530400', '通海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530424', '530400', '华宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530425', '530400', '易门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530426', '530400', '峨山彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530427', '530400', '新平彝族傣族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530428', '530400', '元江哈尼族彝族傣族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530500', '530000', '保山市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530502', '530500', '隆阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530521', '530500', '施甸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530522', '530500', '腾冲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530523', '530500', '龙陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530524', '530500', '昌宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530600', '530000', '昭通市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530602', '530600', '昭阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530621', '530600', '鲁甸县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530622', '530600', '巧家县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530623', '530600', '盐津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530624', '530600', '大关县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530625', '530600', '永善县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530626', '530600', '绥江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530627', '530600', '镇雄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530628', '530600', '彝良县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530629', '530600', '威信县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530630', '530600', '水富县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530700', '530000', '丽江市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530702', '530700', '古城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530721', '530700', '玉龙纳西族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530722', '530700', '永胜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530723', '530700', '华坪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530724', '530700', '宁蒗彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530800', '530000', '普洱市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530802', '530800', '思茅区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530821', '530800', '宁洱哈尼族彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530822', '530800', '墨江哈尼族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530823', '530800', '景东彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530824', '530800', '景谷傣族彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530825', '530800', '镇沅彝族哈尼族拉祜族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530826', '530800', '江城哈尼族彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530827', '530800', '孟连傣族拉祜族佤族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530828', '530800', '澜沧拉祜族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530829', '530800', '西盟佤族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530900', '530000', '临沧市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('530902', '530900', '临翔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530921', '530900', '凤庆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530922', '530900', '云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530923', '530900', '永德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530924', '530900', '镇康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530925', '530900', '双江拉祜族佤族布朗族傣族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530926', '530900', '耿马傣族佤族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('530927', '530900', '沧源佤族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532300', '530000', '楚雄彝族自治州', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('532301', '532300', '楚雄市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532322', '532300', '双柏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532323', '532300', '牟定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532324', '532300', '南华县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532325', '532300', '姚安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532326', '532300', '大姚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532327', '532300', '永仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532328', '532300', '元谋县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532329', '532300', '武定县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532331', '532300', '禄丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532500', '530000', '红河哈尼族彝族自治州', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('532501', '532500', '个旧市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532502', '532500', '开远市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532503', '532500', '蒙自市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532504', '532500', '弥勒市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532523', '532500', '屏边苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532524', '532500', '建水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532525', '532500', '石屏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532527', '532500', '泸西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532528', '532500', '元阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532529', '532500', '红河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532530', '532500', '金平苗族瑶族傣族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532531', '532500', '绿春县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532532', '532500', '河口瑶族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532600', '530000', '文山壮族苗族自治州', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('532601', '532600', '文山市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532622', '532600', '砚山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532623', '532600', '西畴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532624', '532600', '麻栗坡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532625', '532600', '马关县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532626', '532600', '丘北县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532627', '532600', '广南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532628', '532600', '富宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532800', '530000', '西双版纳傣族自治州', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('532801', '532800', '景洪市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532822', '532800', '勐海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532823', '532800', '勐腊县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532900', '530000', '大理白族自治州', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('532901', '532900', '大理市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532922', '532900', '漾濞彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532923', '532900', '祥云县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532924', '532900', '宾川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532925', '532900', '弥渡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532926', '532900', '南涧彝族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532927', '532900', '巍山彝族回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532928', '532900', '永平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532929', '532900', '云龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532930', '532900', '洱源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532931', '532900', '剑川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('532932', '532900', '鹤庆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533100', '530000', '德宏傣族景颇族自治州', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('533102', '533100', '瑞丽市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533103', '533100', '芒市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533122', '533100', '梁河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533123', '533100', '盈江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533124', '533100', '陇川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533300', '530000', '怒江傈僳族自治州', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('533321', '533300', '泸水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533323', '533300', '福贡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533324', '533300', '贡山独龙族怒族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533325', '533300', '兰坪白族普米族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533400', '530000', '迪庆藏族自治州', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('533401', '533400', '香格里拉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533422', '533400', '德钦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('533423', '533400', '维西傈僳族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540000', '0', '西藏自治区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('540100', '540000', '拉萨市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('540102', '540100', '城关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540121', '540100', '林周县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540122', '540100', '当雄县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540123', '540100', '尼木县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540124', '540100', '曲水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540125', '540100', '堆龙德庆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540126', '540100', '达孜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540127', '540100', '墨竹工卡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540200', '540000', '日喀则市', '1', '0', 'R', '1', '1');
INSERT INTO `cmf_areas` VALUES ('540202', '540200', '桑珠孜区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540221', '540200', '南木林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540222', '540200', '江孜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540223', '540200', '定日县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540224', '540200', '萨迦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540225', '540200', '拉孜县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540226', '540200', '昂仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540227', '540200', '谢通门县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540228', '540200', '白朗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540229', '540200', '仁布县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540230', '540200', '康马县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540231', '540200', '定结县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540232', '540200', '仲巴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540233', '540200', '亚东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540234', '540200', '吉隆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540235', '540200', '聂拉木县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540236', '540200', '萨嘎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540237', '540200', '岗巴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540300', '540000', '昌都市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('540302', '540300', '卡若区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540321', '540300', '江达县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540322', '540300', '贡觉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540323', '540300', '类乌齐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540324', '540300', '丁青县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540325', '540300', '察雅县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540326', '540300', '八宿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540327', '540300', '左贡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540328', '540300', '芒康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540329', '540300', '洛隆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540330', '540300', '边坝县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540400', '540000', '林芝市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('540402', '540400', '巴宜区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540421', '540400', '工布江达县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540422', '540400', '米林县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540423', '540400', '墨脱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540424', '540400', '波密县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540425', '540400', '察隅县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('540426', '540400', '朗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542200', '540000', '山南地区', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('542221', '542200', '乃东县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542222', '542200', '扎囊县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542223', '542200', '贡嘎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542224', '542200', '桑日县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542225', '542200', '琼结县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542226', '542200', '曲松县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542227', '542200', '措美县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542228', '542200', '洛扎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542229', '542200', '加查县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542231', '542200', '隆子县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542232', '542200', '错那县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542233', '542200', '浪卡子县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542400', '540000', '那曲地区', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('542421', '542400', '那曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542422', '542400', '嘉黎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542423', '542400', '比如县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542424', '542400', '聂荣县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542425', '542400', '安多县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542426', '542400', '申扎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542427', '542400', '索县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542428', '542400', '班戈县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542429', '542400', '巴青县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542430', '542400', '尼玛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542431', '542400', '双湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542500', '540000', '阿里地区', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('542521', '542500', '普兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542522', '542500', '札达县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542523', '542500', '噶尔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542524', '542500', '日土县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542525', '542500', '革吉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542526', '542500', '改则县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('542527', '542500', '措勤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610000', '0', '陕西省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('610100', '610000', '西安市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610102', '610100', '新城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610103', '610100', '碑林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610104', '610100', '莲湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610111', '610100', '灞桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610112', '610100', '未央区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610113', '610100', '雁塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610114', '610100', '阎良区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610115', '610100', '临潼区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610116', '610100', '长安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610117', '610100', '高陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610122', '610100', '蓝田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610124', '610100', '周至县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610125', '610100', '户县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610200', '610000', '铜川市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610202', '610200', '王益区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610203', '610200', '印台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610204', '610200', '耀州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610222', '610200', '宜君县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610300', '610000', '宝鸡市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610302', '610300', '渭滨区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610303', '610300', '金台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610304', '610300', '陈仓区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610322', '610300', '凤翔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610323', '610300', '岐山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610324', '610300', '扶风县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610326', '610300', '眉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610327', '610300', '陇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610328', '610300', '千阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610329', '610300', '麟游县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610330', '610300', '凤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610331', '610300', '太白县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610400', '610000', '咸阳市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610402', '610400', '秦都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610403', '610400', '杨陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610404', '610400', '渭城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610422', '610400', '三原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610423', '610400', '泾阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610424', '610400', '乾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610425', '610400', '礼泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610426', '610400', '永寿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610427', '610400', '彬县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610428', '610400', '长武县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610429', '610400', '旬邑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610430', '610400', '淳化县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610431', '610400', '武功县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610481', '610400', '兴平市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610500', '610000', '渭南市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610502', '610500', '临渭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610521', '610500', '华县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610522', '610500', '潼关县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610523', '610500', '大荔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610524', '610500', '合阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610525', '610500', '澄城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610526', '610500', '蒲城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610527', '610500', '白水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610528', '610500', '富平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610581', '610500', '韩城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610582', '610500', '华阴市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610600', '610000', '延安市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610602', '610600', '宝塔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610621', '610600', '延长县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610622', '610600', '延川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610623', '610600', '子长县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610624', '610600', '安塞县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610625', '610600', '志丹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610626', '610600', '吴起县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610627', '610600', '甘泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610628', '610600', '富县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610629', '610600', '洛川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610630', '610600', '宜川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610631', '610600', '黄龙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610632', '610600', '黄陵县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610700', '610000', '汉中市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610702', '610700', '汉台区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610721', '610700', '南郑县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610722', '610700', '城固县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610723', '610700', '洋县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610724', '610700', '西乡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610725', '610700', '勉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610726', '610700', '宁强县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610727', '610700', '略阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610728', '610700', '镇巴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610729', '610700', '留坝县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610730', '610700', '佛坪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610800', '610000', '榆林市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610802', '610800', '榆阳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610821', '610800', '神木县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610822', '610800', '府谷县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610823', '610800', '横山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610824', '610800', '靖边县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610825', '610800', '定边县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610826', '610800', '绥德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610827', '610800', '米脂县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610828', '610800', '佳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610829', '610800', '吴堡县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610830', '610800', '清涧县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610831', '610800', '子洲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610900', '610000', '安康市', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('610902', '610900', '汉滨区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610921', '610900', '汉阴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610922', '610900', '石泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610923', '610900', '宁陕县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610924', '610900', '紫阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610925', '610900', '岚皋县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610926', '610900', '平利县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610927', '610900', '镇坪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610928', '610900', '旬阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('610929', '610900', '白河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611000', '610000', '商洛市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('611002', '611000', '商州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611021', '611000', '洛南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611022', '611000', '丹凤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611023', '611000', '商南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611024', '611000', '山阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611025', '611000', '镇安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('611026', '611000', '柞水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620000', '0', '甘肃省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('620100', '620000', '兰州市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620102', '620100', '城关区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620103', '620100', '七里河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620104', '620100', '西固区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620105', '620100', '安宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620111', '620100', '红古区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620121', '620100', '永登县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620122', '620100', '皋兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620123', '620100', '榆中县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620200', '620000', '嘉峪关市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620300', '620000', '金昌市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620302', '620300', '金川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620321', '620300', '永昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620400', '620000', '白银市', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620402', '620400', '白银区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620403', '620400', '平川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620421', '620400', '靖远县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620422', '620400', '会宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620423', '620400', '景泰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620500', '620000', '天水市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620502', '620500', '秦州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620503', '620500', '麦积区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620521', '620500', '清水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620522', '620500', '秦安县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620523', '620500', '甘谷县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620524', '620500', '武山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620525', '620500', '张家川回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620600', '620000', '武威市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620602', '620600', '凉州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620621', '620600', '民勤县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620622', '620600', '古浪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620623', '620600', '天祝藏族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620700', '620000', '张掖市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620702', '620700', '甘州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620721', '620700', '肃南裕固族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620722', '620700', '民乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620723', '620700', '临泽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620724', '620700', '高台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620725', '620700', '山丹县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620800', '620000', '平凉市', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620802', '620800', '崆峒区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620821', '620800', '泾川县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620822', '620800', '灵台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620823', '620800', '崇信县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620824', '620800', '华亭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620825', '620800', '庄浪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620826', '620800', '静宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620900', '620000', '酒泉市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('620902', '620900', '肃州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620921', '620900', '金塔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620922', '620900', '瓜州县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620923', '620900', '肃北蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620924', '620900', '阿克塞哈萨克族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620981', '620900', '玉门市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('620982', '620900', '敦煌市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621000', '620000', '庆阳市', '1', '0', 'Q', '1', '1');
INSERT INTO `cmf_areas` VALUES ('621002', '621000', '西峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621021', '621000', '庆城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621022', '621000', '环县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621023', '621000', '华池县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621024', '621000', '合水县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621025', '621000', '正宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621026', '621000', '宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621027', '621000', '镇原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621100', '620000', '定西市', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('621102', '621100', '安定区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621121', '621100', '通渭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621122', '621100', '陇西县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621123', '621100', '渭源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621124', '621100', '临洮县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621125', '621100', '漳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621126', '621100', '岷县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621200', '620000', '陇南市', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('621202', '621200', '武都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621221', '621200', '成县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621222', '621200', '文县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621223', '621200', '宕昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621224', '621200', '康县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621225', '621200', '西和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621226', '621200', '礼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621227', '621200', '徽县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('621228', '621200', '两当县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622900', '620000', '临夏回族自治州', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('622901', '622900', '临夏市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622921', '622900', '临夏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622922', '622900', '康乐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622923', '622900', '永靖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622924', '622900', '广河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622925', '622900', '和政县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622926', '622900', '东乡族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('622927', '622900', '积石山保安族东乡族撒拉族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623000', '620000', '甘南藏族自治州', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('623001', '623000', '合作市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623021', '623000', '临潭县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623022', '623000', '卓尼县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623023', '623000', '舟曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623024', '623000', '迭部县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623025', '623000', '玛曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623026', '623000', '碌曲县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('623027', '623000', '夏河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630000', '0', '青海省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('630100', '630000', '西宁市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('630102', '630100', '城东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630103', '630100', '城中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630104', '630100', '城西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630105', '630100', '城北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630121', '630100', '大通回族土族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630122', '630100', '湟中县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630123', '630100', '湟源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630200', '630000', '海东市', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('630202', '630200', '乐都区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630203', '630200', '平安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630222', '630200', '民和回族土族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630223', '630200', '互助土族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630224', '630200', '化隆回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('630225', '630200', '循化撒拉族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632200', '630000', '海北藏族自治州', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632221', '632200', '门源回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632222', '632200', '祁连县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632223', '632200', '海晏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632224', '632200', '刚察县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632300', '630000', '黄南藏族自治州', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632321', '632300', '同仁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632322', '632300', '尖扎县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632323', '632300', '泽库县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632324', '632300', '河南蒙古族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632500', '630000', '海南藏族自治州', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632521', '632500', '共和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632522', '632500', '同德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632523', '632500', '贵德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632524', '632500', '兴海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632525', '632500', '贵南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632600', '630000', '果洛藏族自治州', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632621', '632600', '玛沁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632622', '632600', '班玛县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632623', '632600', '甘德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632624', '632600', '达日县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632625', '632600', '久治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632626', '632600', '玛多县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632700', '630000', '玉树藏族自治州', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632701', '632700', '玉树市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632722', '632700', '杂多县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632723', '632700', '称多县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632724', '632700', '治多县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632725', '632700', '囊谦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632726', '632700', '曲麻莱县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632800', '630000', '海西蒙古族藏族自治州', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('632801', '632800', '格尔木市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632802', '632800', '德令哈市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632821', '632800', '乌兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632822', '632800', '都兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('632823', '632800', '天峻县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640000', '0', '宁夏回族自治区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('640100', '640000', '银川市', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('640104', '640100', '兴庆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640105', '640100', '西夏区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640106', '640100', '金凤区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640121', '640100', '永宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640122', '640100', '贺兰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640181', '640100', '灵武市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640200', '640000', '石嘴山市', '1', '0', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('640202', '640200', '大武口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640205', '640200', '惠农区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640221', '640200', '平罗县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640300', '640000', '吴忠市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('640302', '640300', '利通区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640303', '640300', '红寺堡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640323', '640300', '盐池县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640324', '640300', '同心县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640381', '640300', '青铜峡市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640400', '640000', '固原市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('640402', '640400', '原州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640422', '640400', '西吉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640423', '640400', '隆德县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640424', '640400', '泾源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640425', '640400', '彭阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640500', '640000', '中卫市', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('640502', '640500', '沙坡头区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640521', '640500', '中宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('640522', '640500', '海原县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650000', '0', '新疆维吾尔自治区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('650100', '650000', '乌鲁木齐市', '1', '0', 'W', '1', '1');
INSERT INTO `cmf_areas` VALUES ('650102', '650100', '天山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650103', '650100', '沙依巴克区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650104', '650100', '新市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650105', '650100', '水磨沟区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650106', '650100', '头屯河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650107', '650100', '达坂城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650109', '650100', '米东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650121', '650100', '乌鲁木齐县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650200', '650000', '克拉玛依市', '1', '0', 'K', '1', '1');
INSERT INTO `cmf_areas` VALUES ('650202', '650200', '独山子区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650203', '650200', '克拉玛依区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650204', '650200', '白碱滩区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650205', '650200', '乌尔禾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650400', '650000', '吐鲁番市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('650402', '650400', '高昌区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650421', '650400', '鄯善县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('650422', '650400', '托克逊县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652200', '650000', '哈密地区', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('652201', '652200', '哈密市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652222', '652200', '巴里坤哈萨克自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652223', '652200', '伊吾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652300', '650000', '昌吉回族自治州', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('652301', '652300', '昌吉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652302', '652300', '阜康市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652323', '652300', '呼图壁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652324', '652300', '玛纳斯县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652325', '652300', '奇台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652327', '652300', '吉木萨尔县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652328', '652300', '木垒哈萨克自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652700', '650000', '博尔塔拉蒙古自治州', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('652701', '652700', '博乐市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652702', '652700', '阿拉山口市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652722', '652700', '精河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652723', '652700', '温泉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652800', '650000', '巴音郭楞蒙古自治州', '1', '0', 'B', '1', '1');
INSERT INTO `cmf_areas` VALUES ('652801', '652800', '库尔勒市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652822', '652800', '轮台县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652823', '652800', '尉犁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652824', '652800', '若羌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652825', '652800', '且末县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652826', '652800', '焉耆回族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652827', '652800', '和静县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652828', '652800', '和硕县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652829', '652800', '博湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652900', '650000', '阿克苏地区', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('652901', '652900', '阿克苏市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652922', '652900', '温宿县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652923', '652900', '库车县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652924', '652900', '沙雅县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652925', '652900', '新和县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652926', '652900', '拜城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652927', '652900', '乌什县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652928', '652900', '阿瓦提县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('652929', '652900', '柯坪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653000', '650000', '克孜勒苏柯尔克孜自治州', '1', '0', 'K', '1', '1');
INSERT INTO `cmf_areas` VALUES ('653001', '653000', '阿图什市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653022', '653000', '阿克陶县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653023', '653000', '阿合奇县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653024', '653000', '乌恰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653100', '650000', '喀什地区', '1', '0', 'K', '1', '1');
INSERT INTO `cmf_areas` VALUES ('653101', '653100', '喀什市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653121', '653100', '疏附县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653122', '653100', '疏勒县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653123', '653100', '英吉沙县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653124', '653100', '泽普县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653125', '653100', '莎车县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653126', '653100', '叶城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653127', '653100', '麦盖提县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653128', '653100', '岳普湖县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653129', '653100', '伽师县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653130', '653100', '巴楚县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653131', '653100', '塔什库尔干塔吉克自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653200', '650000', '和田地区', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('653201', '653200', '和田市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653221', '653200', '和田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653222', '653200', '墨玉县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653223', '653200', '皮山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653224', '653200', '洛浦县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653225', '653200', '策勒县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653226', '653200', '于田县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('653227', '653200', '民丰县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654000', '650000', '伊犁哈萨克自治州', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('654002', '654000', '伊宁市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654003', '654000', '奎屯市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654004', '654000', '霍尔果斯市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654005', '654000', '(新源市)', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654021', '654000', '伊宁县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654022', '654000', '察布查尔锡伯自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654023', '654000', '霍城县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654024', '654000', '巩留县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654025', '654000', '新源县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654026', '654000', '昭苏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654027', '654000', '特克斯县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654028', '654000', '尼勒克县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654200', '650000', '塔城地区', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('654201', '654200', '塔城市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654202', '654200', '乌苏市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654221', '654200', '额敏县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654223', '654200', '沙湾县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654224', '654200', '托里县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654225', '654200', '裕民县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654226', '654200', '和布克赛尔蒙古自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654300', '650000', '阿勒泰地区', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('654301', '654300', '阿勒泰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654321', '654300', '布尔津县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654322', '654300', '富蕴县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654323', '654300', '福海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654324', '654300', '哈巴河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654325', '654300', '青河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('654326', '654300', '吉木乃县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659000', '650000', '自治区直辖县级行政区划', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('659001', '659000', '石河子市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659002', '659000', '阿拉尔市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659003', '659000', '图木舒克市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659004', '659000', '五家渠市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659005', '659000', '北屯市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659006', '659000', '铁门关市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659007', '659000', '双河市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659008', '659000', '可克达拉市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('659009', '659000', '(胡杨河市)', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710000', '0', '台湾省', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('710100', '710000', '台北市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710101', '710100', '松山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710102', '710100', '信义区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710103', '710100', '大安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710104', '710100', '中山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710105', '710100', '中正区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710106', '710100', '大同区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710107', '710100', '万华区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710108', '710100', '文山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710109', '710100', '南港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710110', '710100', '内湖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710111', '710100', '士林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710112', '710100', '北投区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710200', '710000', '高雄市', '1', '0', 'G', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710201', '710200', '盐埕区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710202', '710200', '鼓山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710203', '710200', '左营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710204', '710200', '楠梓区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710205', '710200', '三民区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710206', '710200', '新兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710207', '710200', '前金区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710208', '710200', '苓雅区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710209', '710200', '前镇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710210', '710200', '旗津区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710211', '710200', '小港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710212', '710200', '凤山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710213', '710200', '林园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710214', '710200', '大寮区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710215', '710200', '大树区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710216', '710200', '大社区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710217', '710200', '仁武区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710218', '710200', '鸟松区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710219', '710200', '冈山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710220', '710200', '桥头区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710221', '710200', '燕巢区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710222', '710200', '田寮区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710223', '710200', '阿莲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710224', '710200', '路竹区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710225', '710200', '湖内区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710226', '710200', '茄萣区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710227', '710200', '永安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710228', '710200', '弥陀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710229', '710200', '梓官区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710230', '710200', '旗山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710231', '710200', '美浓区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710232', '710200', '六龟区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710233', '710200', '甲仙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710234', '710200', '杉林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710235', '710200', '内门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710236', '710200', '茂林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710237', '710200', '桃源区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710238', '710200', '那玛夏区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710300', '710000', '基隆市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710301', '710300', '中正区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710302', '710300', '七堵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710303', '710300', '暖暖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710304', '710300', '仁爱区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710305', '710300', '中山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710306', '710300', '安乐区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710307', '710300', '信义区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710400', '710000', '台中市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710401', '710400', '中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710402', '710400', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710403', '710400', '南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710404', '710400', '西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710405', '710400', '北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710406', '710400', '西屯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710407', '710400', '南屯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710408', '710400', '北屯区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710409', '710400', '丰原区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710410', '710400', '东势区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710411', '710400', '大甲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710412', '710400', '清水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710413', '710400', '沙鹿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710414', '710400', '梧栖区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710415', '710400', '后里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710416', '710400', '神冈区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710417', '710400', '潭子区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710418', '710400', '大雅区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710419', '710400', '新社区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710420', '710400', '石冈区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710421', '710400', '外埔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710422', '710400', '大安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710423', '710400', '乌日区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710424', '710400', '大肚区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710425', '710400', '龙井区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710426', '710400', '雾峰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710427', '710400', '太平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710428', '710400', '大里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710429', '710400', '和平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710500', '710000', '台南市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710501', '710500', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710502', '710500', '南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710504', '710500', '北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710506', '710500', '安南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710507', '710500', '安平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710508', '710500', '中西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710509', '710500', '新营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710510', '710500', '盐水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710511', '710500', '白河区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710512', '710500', '柳营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710513', '710500', '后壁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710514', '710500', '东山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710515', '710500', '麻豆区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710516', '710500', '下营区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710517', '710500', '六甲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710518', '710500', '官田区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710519', '710500', '大内区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710520', '710500', '佳里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710521', '710500', '学甲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710522', '710500', '西港区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710523', '710500', '七股区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710524', '710500', '将军区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710525', '710500', '北门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710526', '710500', '新化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710527', '710500', '善化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710528', '710500', '新市区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710529', '710500', '安定区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710530', '710500', '山上区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710531', '710500', '玉井区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710532', '710500', '楠西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710533', '710500', '南化区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710534', '710500', '左镇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710535', '710500', '仁德区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710536', '710500', '归仁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710537', '710500', '关庙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710538', '710500', '龙崎区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710539', '710500', '永康区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710600', '710000', '新竹市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710601', '710600', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710602', '710600', '北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710603', '710600', '香山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710700', '710000', '嘉义市', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710701', '710700', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710702', '710700', '西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710800', '710000', '新北市', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710801', '710800', '板桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710802', '710800', '三重区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710803', '710800', '中和区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710804', '710800', '永和区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710805', '710800', '新庄区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710806', '710800', '新店区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710807', '710800', '树林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710808', '710800', '莺歌区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710809', '710800', '三峡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710810', '710800', '淡水区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710811', '710800', '汐止区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710812', '710800', '瑞芳区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710813', '710800', '土城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710814', '710800', '芦洲区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710815', '710800', '五股区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710816', '710800', '泰山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710817', '710800', '林口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710818', '710800', '深坑区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710819', '710800', '石碇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710820', '710800', '坪林区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710821', '710800', '三芝区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710822', '710800', '石门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710823', '710800', '八里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710824', '710800', '平溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710825', '710800', '双溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710826', '710800', '贡寮区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710827', '710800', '金山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710828', '710800', '万里区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710829', '710800', '乌来区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710900', '710000', '桃园市', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('710901', '710900', '桃园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710902', '710900', '中坜区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710903', '710900', '平镇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710904', '710900', '八德区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710905', '710900', '杨梅区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710906', '710900', '大溪区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710907', '710900', '芦竹区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710908', '710900', '大园区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710909', '710900', '龟山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710910', '710900', '龙潭区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710911', '710900', '新屋区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710912', '710900', '观音区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('710913', '710900', '复兴区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712200', '710000', '宜兰县', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712201', '712200', '宜兰市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712221', '712200', '罗东镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712222', '712200', '苏澳镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712223', '712200', '头城镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712224', '712200', '礁溪乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712225', '712200', '壮围乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712226', '712200', '员山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712227', '712200', '冬山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712228', '712200', '五结乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712229', '712200', '三星乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712230', '712200', '大同乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712231', '712200', '南澳乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712400', '710000', '新竹县', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712401', '712400', '竹北市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712421', '712400', '竹东镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712422', '712400', '新埔镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712423', '712400', '关西镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712424', '712400', '湖口乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712425', '712400', '新丰乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712426', '712400', '芎林乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712427', '712400', '橫山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712428', '712400', '北埔乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712429', '712400', '宝山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712430', '712400', '峨眉乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712431', '712400', '尖石乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712432', '712400', '五峰乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712500', '710000', '苗栗县', '1', '0', 'M', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712501', '712500', '苗栗市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712521', '712500', '苑里镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712522', '712500', '通霄镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712523', '712500', '竹南镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712524', '712500', '头份镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712525', '712500', '后龙镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712526', '712500', '卓兰镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712527', '712500', '大湖乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712528', '712500', '公馆乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712529', '712500', '铜锣乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712530', '712500', '南庄乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712531', '712500', '头屋乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712532', '712500', '三义乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712533', '712500', '西湖乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712534', '712500', '造桥乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712535', '712500', '三湾乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712536', '712500', '狮潭乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712537', '712500', '泰安乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712700', '710000', '彰化县', '1', '0', 'Z', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712701', '712700', '彰化市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712721', '712700', '鹿港镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712722', '712700', '和美镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712723', '712700', '线西乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712724', '712700', '伸港乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712725', '712700', '福兴乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712726', '712700', '秀水乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712727', '712700', '花坛乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712728', '712700', '芬园乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712729', '712700', '员林镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712730', '712700', '溪湖镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712731', '712700', '田中镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712732', '712700', '大村乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712733', '712700', '埔盐乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712734', '712700', '埔心乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712735', '712700', '永靖乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712736', '712700', '社头乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712737', '712700', '二水乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712738', '712700', '北斗镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712739', '712700', '二林镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712740', '712700', '田尾乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712741', '712700', '埤头乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712742', '712700', '芳苑乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712743', '712700', '大城乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712744', '712700', '竹塘乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712745', '712700', '溪州乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712800', '710000', '南投县', '1', '0', 'N', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712801', '712800', '南投市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712821', '712800', '埔里镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712822', '712800', '草屯镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712823', '712800', '竹山镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712824', '712800', '集集镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712825', '712800', '名间乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712826', '712800', '鹿谷乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712827', '712800', '中寮乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712828', '712800', '鱼池乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712829', '712800', '国姓乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712830', '712800', '水里乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712831', '712800', '信义乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712832', '712800', '仁爱乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712900', '710000', '云林县', '1', '0', 'Y', '1', '1');
INSERT INTO `cmf_areas` VALUES ('712901', '712900', '斗六市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712921', '712900', '斗南镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712922', '712900', '虎尾镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712923', '712900', '西螺镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712924', '712900', '土库镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712925', '712900', '北港镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712926', '712900', '古坑乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712927', '712900', '大埤乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712928', '712900', '莿桐乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712929', '712900', '林内乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712930', '712900', '二仑乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712931', '712900', '仑背乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712932', '712900', '麦寮乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712933', '712900', '东势乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712934', '712900', '褒忠乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712935', '712900', '台西乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712936', '712900', '元长乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712937', '712900', '四湖乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712938', '712900', '口湖乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('712939', '712900', '水林乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713000', '710000', '嘉义县', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('713001', '713000', '太保市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713002', '713000', '朴子市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713023', '713000', '布袋镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713024', '713000', '大林镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713025', '713000', '民雄乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713026', '713000', '溪口乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713027', '713000', '新港乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713028', '713000', '六脚乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713029', '713000', '东石乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713030', '713000', '义竹乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713031', '713000', '鹿草乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713032', '713000', '水上乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713033', '713000', '中埔乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713034', '713000', '竹崎乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713035', '713000', '梅山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713036', '713000', '番路乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713037', '713000', '大埔乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713038', '713000', '阿里山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713300', '710000', '屏东县', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('713301', '713300', '屏东市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713321', '713300', '潮州镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713322', '713300', '东港镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713323', '713300', '恒春镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713324', '713300', '万丹乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713325', '713300', '长治乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713326', '713300', '麟洛乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713327', '713300', '九如乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713328', '713300', '里港乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713329', '713300', '盐埔乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713330', '713300', '高树乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713331', '713300', '万峦乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713332', '713300', '内埔乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713333', '713300', '竹田乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713334', '713300', '新埤乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713335', '713300', '枋寮乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713336', '713300', '新园乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713337', '713300', '崁顶乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713338', '713300', '林边乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713339', '713300', '南州乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713340', '713300', '佳冬乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713341', '713300', '琉球乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713342', '713300', '车城乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713343', '713300', '满州乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713344', '713300', '枋山乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713345', '713300', '三地门乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713346', '713300', '雾台乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713347', '713300', '玛家乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713348', '713300', '泰武乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713349', '713300', '来义乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713350', '713300', '春日乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713351', '713300', '狮子乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713352', '713300', '牡丹乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713400', '710000', '台东县', '1', '0', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('713401', '713400', '台东市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713421', '713400', '成功镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713422', '713400', '关山镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713423', '713400', '卑南乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713424', '713400', '鹿野乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713425', '713400', '池上乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713426', '713400', '东河乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713427', '713400', '长滨乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713428', '713400', '太麻里乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713429', '713400', '大武乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713430', '713400', '绿岛乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713431', '713400', '海端乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713432', '713400', '延平乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713433', '713400', '金峰乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713434', '713400', '达仁乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713435', '713400', '兰屿乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713500', '710000', '花莲县', '1', '0', 'H', '1', '1');
INSERT INTO `cmf_areas` VALUES ('713501', '713500', '花莲市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713521', '713500', '凤林镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713522', '713500', '玉里镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713523', '713500', '新城乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713524', '713500', '吉安乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713525', '713500', '寿丰乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713526', '713500', '光复乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713527', '713500', '丰滨乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713528', '713500', '瑞穗乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713529', '713500', '富里乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713530', '713500', '秀林乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713531', '713500', '万荣乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713532', '713500', '卓溪乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713600', '710000', '澎湖县', '1', '0', 'P', '1', '1');
INSERT INTO `cmf_areas` VALUES ('713601', '713600', '马公市', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713621', '713600', '湖西乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713622', '713600', '白沙乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713623', '713600', '西屿乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713624', '713600', '望安乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('713625', '713600', '七美乡', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810000', '0', '香港特别行政区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('810100', '810000', '香港岛', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('810101', '810100', '中西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810102', '810100', '湾仔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810103', '810100', '东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810104', '810100', '南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810200', '810000', '九龙', '1', '0', 'J', '1', '1');
INSERT INTO `cmf_areas` VALUES ('810201', '810200', '油尖旺区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810202', '810200', '深水埗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810203', '810200', '九龙城区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810204', '810200', '黄大仙区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810205', '810200', '观塘区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810300', '810000', '新界', '1', '0', 'X', '1', '1');
INSERT INTO `cmf_areas` VALUES ('810301', '810300', '荃湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810302', '810300', '屯门区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810303', '810300', '元朗区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810304', '810300', '北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810305', '810300', '大埔区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810306', '810300', '西贡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810307', '810300', '沙田区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810308', '810300', '葵青区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('810309', '810300', '离岛区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820000', '0', '澳门特别行政区', '1', '0', '', '0', '1');
INSERT INTO `cmf_areas` VALUES ('820100', '820000', '澳门半岛', '1', '0', 'A', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820101', '820100', '花地玛堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820102', '820100', '圣安多尼堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820103', '820100', '大堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820104', '820100', '望德堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820105', '820100', '风顺堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820200', '820000', '氹仔岛', '1', '0', 'D', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820201', '820200', '嘉模堂区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820300', '820000', '路环岛', '1', '0', 'L', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820301', '820300', '圣方济各堂区 ', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820304', '441900', '莞城区', '1', '1', '', '2', '-1');
INSERT INTO `cmf_areas` VALUES ('820305', '441900', '莞城区', '1', '1', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820306', '441900', '南城区', '1', '2', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820307', '441900', '东城区', '1', '3', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820308', '441900', '茶山镇', '1', '4', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820309', '441900', '寮步镇', '1', '5', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820310', '441900', '大岭山镇', '1', '6', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820311', '441900', '大朗镇', '1', '7', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820312', '441900', '松山湖', '1', '8', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820313', '441900', '常平镇', '1', '9', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820314', '441900', '横沥镇', '1', '10', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820315', '441900', '东坑镇', '1', '11', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820316', '441900', '石排镇', '1', '12', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820317', '441900', '企石镇', '1', '13', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820318', '441900', '桥头镇', '1', '14', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820319', '441900', '谢岗镇', '1', '15', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820320', '441900', '塘厦镇', '1', '16', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820321', '441900', '樟木头镇', '1', '17', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820322', '441900', '清溪镇', '1', '18', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820323', '441900', '黄江镇', '1', '19', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820324', '441900', '凤岗镇', '1', '20', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820325', '441900', '万江区', '1', '21', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820326', '441900', '高埗镇', '1', '22', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820327', '441900', '石碣镇', '1', '23', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820328', '441900', '石龙镇', '1', '24', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820329', '441900', '麻涌镇', '1', '25', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820330', '441900', '中堂镇', '1', '26', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820331', '441900', '望牛墩镇', '1', '27', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820332', '441900', '洪梅镇', '1', '28', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820333', '441900', '道滘镇', '1', '29', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820334', '441900', '虎门镇', '1', '30', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820335', '441900', '厚街镇', '1', '31', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820336', '441900', '长安镇（东莞长安新区）', '1', '32', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820337', '441900', '沙田镇（虎门港）', '1', '33', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820338', '120000', '和平区', '1', '0', 'H', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820339', '120000', '河东区', '1', '0', 'H', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820340', '120000', '河西区', '1', '0', 'H', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820341', '120000', '南开区', '1', '0', 'N', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820342', '120000', '河北区', '1', '0', 'H', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820343', '120000', '红桥区', '1', '0', 'H', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820344', '120000', '东丽区', '1', '0', 'D', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820345', '120000', '津南区', '1', '0', 'J', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820346', '120000', '西青区', '1', '0', 'X', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820347', '120000', '北辰区', '1', '0', 'B', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820348', '120000', '滨海新区', '1', '0', 'B', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820349', '120000', '武清区', '1', '0', 'W', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820350', '120000', '宝坻区', '1', '0', 'B', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820351', '500000', '渝中区', '1', '0', 'Y', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820352', '120000', '蓟县', '1', '0', 'J', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820353', '500000', '沙坪坝区', '1', '0', 'S', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820354', '120000', '静海县', '1', '0', 'J', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820355', '500000', '江北区', '1', '0', 'J', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820356', '120000', '宁河县', '1', '0', 'N', '1', '-1');
INSERT INTO `cmf_areas` VALUES ('820357', '120000', '天津市', '1', '50', 'T', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820358', '820357', '和平区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820359', '820357', '河东区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820360', '820357', '河西区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820361', '820357', '南开区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820362', '820357', '河北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820363', '820357', '红桥区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820364', '820357', '东丽区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820365', '820357', '津南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820366', '820357', '西青区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820367', '820357', '北辰区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820368', '820357', '滨海新区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820369', '820357', '武清区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820370', '820357', '宝坻区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820371', '820357', '蓟县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820372', '820357', '静海县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820373', '820357', '宁河县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820374', '500000', '重庆市', '1', '0', 'C', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820375', '820374', '万州区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820376', '820374', '黔江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820377', '820374', '涪陵区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820378', '820374', '渝中区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820379', '820374', '大渡口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820380', '820374', '江北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820381', '820374', '沙坪坝区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820382', '820374', '九龙坡区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820383', '820374', '南岸区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820384', '820374', '北碚区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820385', '820374', '渝北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820386', '820374', '巴南区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820387', '820374', '长寿区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820388', '820374', '江津区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820389', '820374', '合川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820390', '820374', '永川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820391', '820374', '南川区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820392', '820374', '綦江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820393', '820374', '大足区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820394', '820374', '铜梁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820395', '820374', '璧山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820396', '820374', '潼南县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820397', '820374', '荣昌县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820398', '820374', '梁平县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820399', '820374', '城口县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820400', '820374', '丰都县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820401', '820374', '垫江县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820402', '820374', '武隆县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820403', '820374', '忠县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820404', '820374', '开县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820405', '820374', '云阳县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820406', '820374', '奉节县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820407', '820374', '巫山县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820408', '820374', '巫溪县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820409', '820374', '石柱土家族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820410', '820374', '秀山土家族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820411', '820374', '酉阳土家族苗族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820412', '820374', '彭水苗族土家族自治县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820413', '310000', '上海市', '1', '50', 'S', '1', '1');
INSERT INTO `cmf_areas` VALUES ('820414', '820413', '黄浦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820415', '820413', '卢湾区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820416', '820413', '徐汇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820417', '820413', '长宁区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820418', '820413', '静安区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820419', '820413', '普陀区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820420', '820413', '闸北区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820421', '820413', '虹口区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820422', '820413', '杨浦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820423', '820413', '闵行区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820424', '820413', '宝山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820425', '820413', '嘉定区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820426', '820413', '浦东新区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820427', '820413', '金山区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820428', '820413', '松江区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820429', '820413', '青浦区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820430', '820413', '南汇区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820431', '820413', '奉贤区', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820432', '820413', '崇明县', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820433', '442000', '古镇镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820434', '442000', '小榄镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820435', '442000', '沙溪镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820436', '442000', '大涌镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820437', '442000', '横栏镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820438', '442000', '东凤镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820439', '442000', '南头镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820440', '442000', '三角镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820441', '442000', '三乡镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820442', '442000', '民众镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820443', '442000', '南良镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820444', '442000', '板芙镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820445', '442000', '神湾镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820446', '442000', '坦州镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820447', '442000', '黄布镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820448', '442000', '浮沙镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820449', '442000', '东升镇', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820450', '442000', '东区街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820451', '442000', '石岐街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820452', '442000', '西区街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820453', '442000', '南区街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820454', '442000', '五桂山街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('820455', '442000', '中山港街道', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441325', '441300', '大亚湾', '1', '0', '', '2', '1');
INSERT INTO `cmf_areas` VALUES ('441326', '441300', '仲恺区', '1', '0', '', '2', '1');

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