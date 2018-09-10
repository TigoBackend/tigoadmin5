<?php
/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2018/5/22
 * Time: 9:31
 */

namespace app\common\model;


use think\Model;
use think\RedisCache;
use think\cache\driver\Redis;

abstract class BaseRedisModel extends Model
{

    /*--------------------------------------缓存key start------------------------------------------*/


    /*--------------------------------------string start------------------------------------------*/


    /*--------------------------------------string end------------------------------------------*/


    /*--------------------------------------hash对象 start------------------------------------------*/




    /*--------------------------------------hash对象 end------------------------------------------*/


    /*--------------------------------------有序集合 start------------------------------------------*/

    /*--------------------------------------有序集合 end------------------------------------------*/




    /*--------------------------------------缓存key end------------------------------------------*/


    /**
     * redis是否可用
     * @var bool
     */
        protected $can_redis = false;

    /**
     * 是否使用redis
     * @var bool
     */
        protected $use_redis = true;

    /**
     * 记录实体对应的redis KEY前缀
     * @var string
     */
        protected $record_key_prefix = '';

    /**
     * 各字段默认值
     * @var array
     */
        protected $fields_default = [];

    /**
     * redis实例
     * @var null|Redis
     */
        static $redis = null;


    public function __construct($data = [])
    {
        parent::__construct($data);
        try{
            $class_name = basename(str_replace('\\','/',get_class()));
            $class_name  = $class_name ? $class_name : get_class();
            $this->record_key_prefix = "{$class_name}:";
            if (empty(self::$redis)) self::$redis = RedisCache::connect();
            if (self::$redis->ping()) $this->can_redis = true;
        }catch (\Exception $e){
            $this->can_redis = false;
        }
    }


    /**
     * 是否允许使用redis
     * @return bool
     */
    private function can_redis(){
        return $this->use_redis && $this->can_redis;
    }


    /**
     * 刷新缓存额外操作
     * @param array $record
     * @return mixed
     */
    abstract protected function refresh_cache_record_callback($record = []);


    /**
     * 移除缓存额外操作
     * @param int $id
     * @return mixed
     */
    abstract protected function drop_cache_record_callback($id = 0);


    /**
     * 刷新缓存实体
     * @param array $record
     * @return bool
     */
    public function refresh_cache_record($record = []){
        if (!$this->can_redis() || !isset($record[$this->getPk()]) || empty($record[$this->getPk()])) return false;
        /*刷新缓存*/
        self::$redis->hMset($this->record_key_prefix.$record[$this->getPk()],$record);
        /*自定义额外业务*/
        if (method_exists($this,'refresh_cache_record_callback')) $this->refresh_cache_record_callback($record);
        return true;
    }


    /**
     * 移除缓存实体
     * @param int $id
     * @return bool
     * @throws \RedisException
     */
    public function drop_cache_record($id = 0){
        if (!$this->can_redis() || empty($id)) return false;
        /*移除缓存*/
        self::$redis->del($this->record_key_prefix.$id);
        /*自定义额外业务*/
        if (method_exists($this,'drop_cache_record_callback')) $this->drop_cache_record_callback($id);
        return true;
    }


    /**
     * 根据字段类型描述返回指定类型
     * @param $type
     * @return int
     */
    protected function get_field_type($type){
        if (preg_match('/(int|double|float|decimal|real|numeric|serial|bit)/is', $type)) {
            $bind = \PDO::PARAM_INT;
        } elseif (preg_match('/bool/is', $type)) {
            $bind = \PDO::PARAM_BOOL;
        } else {
            $bind = \PDO::PARAM_STR;
        }
        return $bind;
    }




    /**
     * 获取指定字段默认值
     * @param string $field
     * @return bool|int|mixed|string
     */
    public function get_field_default($field = ''){
        if (empty($field)) return '';
        /*软删除字段*/
        if (method_exists($this,'getDeleteTimeField')){
            $delete_time = $this->getDeleteTimeField();
            if ($field == $delete_time) return null;
        }
        /*返回预设默认值*/
        if (isset($this->fields_default[$field])) return $this->fields_default[$field];
        /*根据字段类型自动返回默认值*/
        $type_info = $this->getTableInfo('','type');
        if (!$type_info[$field]) return '';
        $type = $this->get_field_type($type_info[$field]);
        switch ($type){
            case \PDO::PARAM_INT:
                return 0;
            case \PDO::PARAM_BOOL:
                return true;
            case \PDO::PARAM_STR:
            default:
                return '';
        }
    }




    /**
     * 获取数据库中的记录
     * @param int $id
     * @return array|mixed
     * @throws \think\exception\DbException
     */
    public function get_record_data($id = 0){
        $record = self::get($id);
        return $record ? $record->getData() : [];
    }


    /**
     * 结合缓存获取记录
     * @param int $id
     * @param array $fields
     * @return array|mixed
     * @throws \think\exception\DbException
     */
    public function get_record($id = 0,$fields = []){
        if ($this->can_redis()){
            $record = self::$redis->hGetAll($this->record_key_prefix.$id);
            if (empty($record)){
                $record = $this->get_record_data($id);
                if ($record) $this->refresh_cache_record($record);
            }
        }else{
            $record = $this->get_record_data($id);
        }
        if ($record && $fields) $record = extract_data_by_keys($record,$fields);
        return $record;
    }


    /**
     * 根据id列表获取指定记录列表
     * @param array $ids
     * @param array $fields
     * @return array
     * @throws \think\exception\DbException
     */
    public function get_record_by_ids($ids = [],$fields = []){
        $record_list = [];
        foreach ($ids as $id){
            $record = $this->get_record($id,$fields);
            if ($record) $record_list[] = $record;
        }
        return $record_list;
    }


    /**
     * 结合缓存创建记录
     * @param array $data
     * @return array|bool
     */
    public function create_record($data = []){
        $table_fields = $this->getTableFields();
        if (empty($table_fields)) return false;
        $record = [];
        foreach ($table_fields as $field){
            $record[$field] = isset($data[$field]) ? $data[$field] : $this->get_field_default($field);
        }
        if (empty($record)) return false;
        $rs = $this->isUpdate(false)->allowField(true)->save($record);
        if (empty($rs)) return false;
        $record[$this->getPk()] = $this->getLastInsID();
        if (empty($record[$this->getPk()])) return false;
        /*刷新缓存*/
        $this->refresh_cache_record($record);
        return $record;
    }


    /**
     * 结合缓存移除数据
     * @param int $id
     * @return bool
     * @throws \RedisException
     * @throws \think\exception\DbException
     */
    public function drop_record($id = 0){
        $record = $this->get_record($id);
        if (empty($record)) return true;
        $this->where([$this->getPk()=>$id])->delete();
        /*刷新缓存*/
        $this->drop_cache_record($id);
        return true;
    }




}