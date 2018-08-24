<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2017/10/27
 * Time: 15:07
 */

namespace app\admin\model;


use think\Model;
use traits\model\SoftDelete;

class WxMenuModel extends Model
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    
    public function get_menus_trees(){
        $rs1 = $this->where(['parent_id'=>0])->order('list_order asc')->select()->jsonSerialize();
        if(count($rs1)>0){
            $ids = [];
            foreach ($rs1 as $key =>$v){
                $ids[] = $v['id'];
            }
            //获取第二级分类
            $rs2 = $this->where(['parent_id'=>array('IN',$ids)])->order('list_order asc')->select();
            $tmpArr = array();
            if(count($rs2)>0){
                $ids = array();
                foreach ($rs2 as $key =>$v){
                    $ids[] = $v['id'];
                }
                foreach ($rs2 as $key =>$v){
                    $tmpArr[$v['parent_id']][] = $v;
                }
            }
            //把二级归类到第一级下
            foreach ($rs1 as $key =>$v){
                $rs1[$key]['child'] = isset($tmpArr[$v['id']])?$tmpArr[$v['id']]:null;
                $rs1[$key]['childNum'] = isset($tmpArr[$v['id']])?count($tmpArr[$v['id']]):0;
            }
        }
        return $rs1;
    }

    public function clear_menu(){
        $this->where('1=1')->delete();
    }


}