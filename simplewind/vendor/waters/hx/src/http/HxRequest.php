<?php
/**
 * Created by PhpStorm.
 * User: ford
 * Date: 2018/3/22
 * Time: 11:58
 */

namespace Waters\hx\http;


use Waters\hx\Exception\HxException;

class HxRequest
{

    const HX_DOMAIN = 'https://a1.easemob.com/';

    const HX_REQUEST_GET = 'GET';
    const HX_REQUEST_POST = 'POST';
    const HX_REQUEST_PUT = 'PUT';
    const HX_REQUEST_DELETE = 'DELETE';

    private $client_id;
    private $client_secret;
    private $org_name;
    private $app_name;

    private static $instances = [];

    /**
     * 构造
     * HxRequest constructor.
     * @param $option
     * @throws \Waters\hx\Exception\HxException
     */
    private function __construct($option)
    {
        hx_check_params($option, ['client_id', 'client_secret', 'org_name', 'app_name']);
        $this->client_id = $option['client_id'];
        $this->client_secret = $option['client_secret'];
        $this->org_name = $option['org_name'];
        $this->app_name = $option['app_name'];
    }


    /**
     * 获取实例
     * @param $option
     * @return HxRequest
     * @throws \Waters\hx\Exception\HxException
     */
    public static function get_instance($option)
    {
        hx_check_params($option, ['client_id', 'client_secret', 'org_name', 'app_name']);
        $key = md5("{$option['client_id']}{$option['client_secret']}{$option['org_name']}{$option['app_name']}");
        if (isset(static::$instances[$key]) && static::$instances[$key]) return static::$instances;
        static::$instances[$key] = new static($option);
        return static::$instances[$key];
    }


    /**
     * 接口请求
     * @param string $api      环信接口
     * @param string $body      接口参数
     * @param array $header     请求头
     * @param string $query_type    请求类型
     * @return array
     */
    public function curl($api, $body = '', $header = [], $query_type = 'POST')
    {
        $url = HxRequest::HX_DOMAIN."{$this->org_name}/{$this->app_name}/{$api}";
        $ch = curl_init($url);
        $curl_options = [
            CURLOPT_HEADER => false,
            CURLOPT_TIMEOUT => 5,
            CURLOPT_CONNECTTIMEOUT => 5,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS => in_array($query_type,[self::HX_REQUEST_GET,self::HX_REQUEST_POST,self::HX_REQUEST_PUT,self::HX_REQUEST_DELETE]) && is_array($body) && $body ? json_encode($body) : $body,
            CURLOPT_HTTPHEADER => $header,
            CURLOPT_MAXREDIRS => 3,
            CURLOPT_SSL_VERIFYPEER=> false,
            CURLOPT_SSL_VERIFYHOST => 0,
            CURLOPT_ENCODING => 'gzip',
            CURLOPT_USERAGENT => 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)',
        ];
        /*根据当前php配置追加页面跟踪配置*/
        if (ini_get('open_basedir') == '' && ini_get('safe_mode') == 'off'){
            $curl_options[CURLOPT_FOLLOWLOCATION] = true;
        }
        switch (strtoupper($query_type)){
            case self::HX_REQUEST_GET:
                $curl_options[CURLOPT_HTTPGET] = true;
                break;
            case self::HX_REQUEST_POST:
                $curl_options[CURLOPT_POST] = true;
                break;
            case self::HX_REQUEST_PUT:
                $curl_options[CURLOPT_CUSTOMREQUEST] = 'PUT';
                break;
            case self::HX_REQUEST_DELETE:
                $curl_options[CURLOPT_CUSTOMREQUEST] = 'DELETE';
                break;
        }

        curl_setopt_array($ch, $curl_options);

        $result = curl_exec($ch);
        $errno = curl_errno($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);
        if ($errno) return ['status' => false, 'result' => [], 'error_info' => $info];
        $result = json_decode($result,true);
        if (isset($result['error'])) return ['status'=>false,'result'=>[],'error_info'=>$result];
        return ['status' => true, 'result' => $result, 'error_info' => []];
    }


}