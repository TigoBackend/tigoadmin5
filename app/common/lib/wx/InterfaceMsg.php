<?php

/**
 * Created by PhpStorm.
 * User: walters
 * Date: 2017/6/9
 * Time: 11:18
 */
namespace app\common\lib\wx;

use think\Db;
use Waters\WebChatApi\Api\WeiXinApi;
use Waters\WebChatApi\Business\InterfaceMsgHandler;
use Waters\WebChatApi\Business\InterfaceWxApiForTP5;
use Waters\WebChatApi\Msg\WxMsgClick;
use Waters\WebChatApi\Msg\WxMsgLocation;
use Waters\WebChatApi\Msg\WxMsgScan;
use Waters\WebChatApi\Msg\WxMsgSubscribe;
use Waters\WebChatApi\Msg\WxMsgView;
use Waters\WebChatApi\Msg\WxRespTextMessage;

class InterfaceMsg implements InterfaceMsgHandler
{

    /**
     * 用户关注时、未关注用户扫码带参数二维码进行关注时事件推送
     * @param WxMsgSubscribe $msg
     * @return null|WxRespTextMessage
     * @throws \Waters\WebChatApi\Exception\WeiXinException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function subscribe(WxMsgSubscribe $msg)
    {
        $open_id = $msg -> get_from_user_name();
        check_params($open_id);
        /*注册用户信息或刷新用户关注标识*/
        $uw = Db::name('UserWx')
            ->where(['uw_open_id'=>$open_id])
            ->field(['uw_id'])
            ->find();
        if (empty($uw)){
            $interface = new InterfaceWxApiForTP5();
            $wx_config = config('wx_config');
            $api = new WeiXinApi($wx_config,$interface);
            $user_info = $api -> get_subscribe_user_info($open_id);
            if (isset($user_info['errcode'])) $interface->log('get_subscribe_user_info error result:'.json_encode($user_info));
            $user_wx = [
                'uw_nick_name'=>$user_info['nickname'],
                'uw_image_url'=>$user_info['headimgurl'],
                'uw_sex'=>$user_info['sex'],
                'uw_subscribe'=>$user_info['subscribe'],
                'uw_app_id'=>$wx_config['app_id'],
                'uw_open_id'=>$user_info['openid'],
                'uw_union_id'=>isset($user_info['unionid'])?$user_info['unionid']:'',
            ];
            $rs = Db::name('UserWx')->insert($user_wx);
        }else{
            /*刷新关注标识*/
            $rs = Db::name('UserWx')->where(['uw_id'=>$uw['uw_id']])->setField('uw_subscribe',1);
        }
        $resp_msg = new WxRespTextMessage();
        $resp_msg -> set_to_user_name($msg->get_from_user_name());
        $resp_msg -> set_from_user_name($msg->get_to_user_name());
        $resp_msg -> set_content('感谢关注庆鼎');
        return $resp_msg;
    }

    /**
     * 取消关注消息推送
     * @param WxMsgSubscribe $msg
     * @return mixed|null
     */
    public function un_subscribe(WxMsgSubscribe $msg)
    {
        $open_id = $msg->get_from_user_name();
        check_params($open_id);
        $rs = Db::name('UserWx')
            ->where(['uw_open_id'=>$open_id])
            ->setField('uw_subscribe',0);
        echo '';
        exit;
    }

    /**
     * 用户同意上报地理位置后，每次进入公众号会话时，都会在进入时上报地理位置，
     * 或在进入会话后每5秒上报一次地理位置，公众号可以在公众平台网站中修改以上设置。
     * 上报地理位置时，微信会将上报地理位置事件推送到开发者填写的URL
     * @param WxMsgLocation $msg
     * @return mixed|null
     */
    public function location(WxMsgLocation $msg)
    {
        // TODO: Implement location() method.
    }

    /**
     *已关注用户扫码带参数二维码时事件推送
     * @param WxMsgScan $msg
     * @return mixed|null
     */
    public function subscribe_scan(WxMsgScan $msg)
    {
        // TODO: Implement subscribe_scan() method.
    }

    /**
     * 自定义菜单事件,点击菜单跳转链接时的事件推送
     * @param WxMsgView $msg
     * @return mixed|null
     */
    public function view(WxMsgView $msg)
    {
        // TODO: Implement view() method.
    }

    /**
     * 自定义菜单事件,点击菜单拉取消息时的事件推送
     * @param WxMsgClick $msg
     * @return WxRespTextMessage|null
     */
    public function click(WxMsgClick $msg)
    {
        // TODO: Implement click() method.
    }
}