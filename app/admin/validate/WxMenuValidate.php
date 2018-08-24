<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/8/23
 * Time: 15:20
 */

namespace app\admin\validate;


use think\Validate;

class WxMenuValidate extends Validate
{

    protected $rule = [
        'type'=>'require|integer|in:1,2',
        'parent_id'=>'require|integer|egt:0',
        'name'=>'require',
        'url'=>'url',
        'is_show'=>'require|integer|in:1,2'
    ];

    protected $message = [
        'parent_id.require'=>'上级菜单必须旋选择',
        'type.require'=>'菜单类型必须选择',
        'name.require'=>'菜单标题必须填写',
        'url.url'=>'外部链接不可用',
        'is_show.require'=>'未知显示类型',
    ];



    public function check($data, $rules = [], $scene = '')
    {
        if (!parent::check($data,$rules,$scene)) return false;
        switch ($data['type']){
            case 1:
                if (!isset($data['key']) || empty($data['key'])){
                    $this->error = '事件关键字必须填写';
                    return false;
                }
                break;
            case 2:
                if (!isset($data['url']) || empty($data['url'])){
                    $this->error = '外部链接必须填写';
                    return false;
                }
                break;
        }
        return true;
    }


}