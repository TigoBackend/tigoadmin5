<?php
/**
 * Created by PhpStorm.
 * User: Walter
 * Date: 2019/2/28
 * Time: 12:18
 */

namespace Waters\WeiXin\Api;

/**
 * 小程序接口
 * Class WeiXinMiniProgramApi
 * @package Waters\WebChatApi\Api
 */
class WeiXinMiniProgramApi extends WeiXinApi
{

    /*输入状态命令：对用户下发"正在输入"状态*/
    const TYPING_COMMAND_TYPING = 'Typing';
    /*输入状态命令：取消对用户的"正在输入"状态*/
    const TYPING_COMMAND_CANCEL_TYPING = 'CancelTyping';


    /*用户消息类型：文本*/
    const MESSAGE_TYPE_TEXT = 'text';
    /*用户消息类型：图片*/
    const MESSAGE_TYPE_IMAGE = 'image';
    /*用户消息类型：链接*/
    const MESSAGE_TYPE_LINK = 'link';
    /*用户消息类型：小程序卡片*/
    const MESSAGE_TYPE_MINI_PROGRAM_PAGE = 'miniprogrampage';

    /*上传媒体类型：图片*/
    const MEDIA_TYPE_IMAGE = 'image';


    /*小程序换取openid与绘画秘钥*/
    const API_CODE2SESSION = 'https://api.weixin.qq.com/sns/jscode2session?';

    /*小程序支付完成后获取用户union id*/
    const API_PAID_UNION_ID = 'https://api.weixin.qq.com/wxa/getpaidunionid?';

    /*获取小程序用户日留存*/
    const API_ANALYSIS_DAILY_RETAIN = 'https://api.weixin.qq.com/datacube/getweanalysisappiddailyretaininfo?';

    /*获取小程序月用户留存*/
    const API_ANALYSIS_MONTHLY_RETAIN = 'https://api.weixin.qq.com/datacube/getweanalysisappidmonthlyretaininfo?';

    /*获取小程序用户周留存*/
    const API_ANALYSIS_WEEKLY_RETAIN = 'https://api.weixin.qq.com/datacube/getweanalysisappidweeklyretaininfo?';

    /*获取小程序用户周留存*/
    const API_ANALYSIS_DAILY_SUMMARY = 'https://api.weixin.qq.com/datacube/getweanalysisappiddailysummarytrend?';


    /*获取用户访问小程序数据日趋势*/
    const API_ANALYSIS_DAILY_TREND = 'https://api.weixin.qq.com/datacube/getweanalysisappiddailyvisittrend?';


    /*获取用户访问小程序数据月趋势*/
    const API_ANALYSIS_MONTHLY_TREND = 'https://api.weixin.qq.com/datacube/getweanalysisappidmonthlyvisittrend?';

    /*获取用户访问小程序数据月趋势*/
    const API_ANALYSIS_WEEKLY_TREND = 'https://api.weixin.qq.com/datacube/getweanalysisappidweeklyvisittrend?';

    /*获取小程序新增或活跃用户的画像分布数据*/
    const API_ANALYSIS_USER_PORTRAIT = 'https://api.weixin.qq.com/datacube/getweanalysisappiduserportrait?';

    /*获取用户小程序访问分布数据*/
    const API_ANALYSIS_VISIT_DISTRIBUTION = 'https://api.weixin.qq.com/datacube/getweanalysisappidvisitdistribution?';

    /*访问页面统计*/
    const API_ANALYSIS_VISIT_PAGE = 'https://api.weixin.qq.com/datacube/getweanalysisappidvisitpage?';

    /*下发客服当前输入状态给用户*/
    const API_CUSTOMER_TYPING = 'https://api.weixin.qq.com/cgi-bin/message/custom/typing?';

    /*获取客服消息内的临时素材*/
    const API_MEDIA_GET = 'https://api.weixin.qq.com/cgi-bin/media/get?';

    /*发送客服消息给用户*/
    const API_CUSTOMER_MESSAGE = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?';

    /*把媒体文件上传到微信服务器*/
    const API_MEDIA_UPLOAD = 'https://api.weixin.qq.com/cgi-bin/media/upload?';



    /**
     * code换取
     * @param $code
     * @return bool|mixed
     */
    public function code2session($code){
        if (empty($code)){
            if ($this->business_interface) $this->business_interface->log('code2session code exception');
            return false;
        }
        $url = self::API_CODE2SESSION."appid={$this->config['app_id']}&secret={$this->config['app_secret']}&js_code={$code}&grant_type=authorization_code";
        return $this->curl($url);
    }


    /**
     * 支付订单换取用户union id
     * @param $openid
     * @param string $transaction_id
     * @param string $out_trade_no
     * @return mixed|null
     */
    public function paidUnionId($openid, $transaction_id = '',$out_trade_no = ''){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
            'openid'=>$openid,
        ];
        $data = [];
        if ($transaction_id){
            $data['transaction_id'] = $transaction_id;
        }elseif ($out_trade_no) {
            $data['out_trade_no'] = $out_trade_no;
            $data['mch_id'] = $this->config['mch_id'];
        }
        $url = self::API_PAID_UNION_ID.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 获取日留存
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisDailyRetain($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_DAILY_RETAIN.http_build_query($param);
        return $this->curl($url,$data);
    }



    /**
     * 获取月留存
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisMonthlyRetain($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_MONTHLY_RETAIN.http_build_query($param);
        return $this->curl($url,$data);
    }



    /**
     * 获取周留存
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisWeeklyRetain($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_WEEKLY_RETAIN.http_build_query($param);
        return $this->curl($url,$data);
    }




    /**
     * 获取用户访问小程序数据概况
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisDailySummary($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_DAILY_SUMMARY.http_build_query($param);
        return $this->curl($url,$data);
    }



    /**
     * 获取日趋势
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisDailyTrend($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_DAILY_TREND.http_build_query($param);
        return $this->curl($url,$data);
    }



    /**
     * 获取月趋势
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisMonthlyTrend($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_MONTHLY_TREND.http_build_query($param);
        return $this->curl($url,$data);
    }



    /**
     * 获取周趋势
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisWeeklyTrend($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_WEEKLY_TREND.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 获取小程序新增或活跃用户的画像分布数据
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisUserPortrait($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_USER_PORTRAIT.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 获取用户小程序访问分布数据
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisVisitDistribution($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_VISIT_DISTRIBUTION.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 访问页面统计数据
     * @param $begin_date
     * @param $end_date
     * @return mixed|null
     */
    public function analysisVisitPage($begin_date,$end_date){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('paidUnionId access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'begin_date'=>$begin_date,
            'end_date'=>$end_date,
        ];
        $url = self::API_ANALYSIS_VISIT_PAGE.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 下发客服当前输入状态给用户
     * @param $openid
     * @param string $command
     * @return mixed|null
     * @throws \Waters\WeiXin\Exception\WeiXinException
     */
    public function customerTyping($openid,$command = ''){
        if (!in_array($command,[self::TYPING_COMMAND_TYPING,self::TYPING_COMMAND_CANCEL_TYPING])) $this->throwException('command not found',['openid'=>$openid,'command'=>$command]);
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('customerTyping access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'touser'=>$openid,
            'command'=>$command
        ];
        $url = self::API_CUSTOMER_TYPING.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 获取客服消息内的临时素材
     * @param $media_id
     * @return mixed|null
     */
    public function mediaGet($media_id){
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('mediaGet access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
            'media_id'=>$media_id,
        ];
        $url = self::API_MEDIA_GET.http_build_query($param);
        return $this->curl($url);
    }


    /**
     * 客服消息发送
     * @param $openid
     * @param string $msg_type
     * @param array $context
     * @return mixed|null
     * @throws \Waters\WeiXin\Exception\WeiXinException
     */
    public function customerMessageSend($openid,$msg_type = 'text',$context = []){
        if (!in_array($msg_type,[self::MESSAGE_TYPE_TEXT,self::MESSAGE_TYPE_IMAGE,self::MESSAGE_TYPE_LINK,self::MESSAGE_TYPE_MINI_PROGRAM_PAGE])) $this->throwException('msg type not found',['openid'=>$openid,'msg_type'=>$msg_type,'context'=>$context]);
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('mediaGet access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
        ];
        $data = [
            'touser'=>$openid,
            'msgtype'=>$msg_type,
        ];
        switch ($msg_type){
            case self::MESSAGE_TYPE_LINK:
                $data['link'] = [
                    'title'=>$context['title'],
                    'description'=>$context['description'],
                    'url'=>$context['url'],
                    'thumb_url'=>$context['thumb_url'],
                ];
                break;
            case self::MESSAGE_TYPE_IMAGE:
                $data['image'] = [
                    'media_id'=>$context['media_id'],
                ];
                break;
            case self::MESSAGE_TYPE_MINI_PROGRAM_PAGE:
                $data['miniprogrampage'] = [
                    'title'=>$context['title'],
                    'pagepath'=>$context['pagepath'],
                    'thumb_media_id'=>$context['thumb_media_id'],
                ];
                break;
            case self::MESSAGE_TYPE_TEXT:
            default:
                $data['content'] = $context['content'];
                break;
        }
        $url = self::API_CUSTOMER_MESSAGE.http_build_query($param);
        return $this->curl($url,$data);
    }


    /**
     * 文件上次
     * @param string $media_path
     * @param string $type
     * @return mixed|null
     * @throws \Waters\WeiXin\Exception\WeiXinException
     */
    public function mediaUpload($media_path = '', $type = 'image'){
        if ($type !== self::MEDIA_TYPE_IMAGE) $this->throwException('media type error',['media_path'=>$media_path,'type'=>$type]);
        $access_token = $this->get_access_token();
        if (!$access_token){
            if ($this->business_interface) $this->business_interface->log('mediaGet access_token is null');
            return null;
        }
        $param = [
            'access_token'=>$access_token,
            'type'=>$type,
        ];
        $data = [
            'media'=>$this->makeCurlFile($media_path)
        ];
        $url = self::API_MEDIA_UPLOAD.http_build_query($param);
        return $this->curl($url,$data);
    }







}