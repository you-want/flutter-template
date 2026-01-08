import 'dart:async';
import 'package:fluwx/fluwx.dart';
import '../log/log_util.dart';
import '../toast/toast_util.dart';

/// 微信工具类
class WechatUtil {
  // TODO: 替换为真实的 App ID
  static const String _appId = "wx_placeholder_appid"; 
  // TODO: 替换为真实的 Universal Link
  static const String _universalLink = "https://your.universal.link/"; 

  static final Fluwx _fluwx = Fluwx();

  /// 初始化微信 SDK
  static Future<void> init() async {
    await _fluwx.registerApi(
      appId: _appId,
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: _universalLink,
    );
    LogUtil.d("WeChat SDK initialized");
  }

  /// 检查是否安装微信
  static Future<bool> isInstalled() async {
    return await _fluwx.isWeChatInstalled;
  }

  /// 发起微信登录
  /// 返回 code，如果失败则返回 null
  static Future<String?> login() async {
    bool installed = await isInstalled();
    if (!installed) {
      ToastUtil.show("请先安装微信");
      return null;
    }

    final Completer<String?> completer = Completer<String?>();
    
    // 监听响应
    final cancelable = _fluwx.addSubscriber((response) {
      if (response is WeChatAuthResponse) {
        if (response.errCode == 0) {
          LogUtil.d("WeChat login success, code: ${response.code}");
          if (!completer.isCompleted) {
            completer.complete(response.code);
          }
        } else {
          LogUtil.e("WeChat login failed: ${response.errCode} ${response.errStr}");
          if (!completer.isCompleted) {
            completer.complete(null);
          }
        }
      }
    });

    try {
      final result = await _fluwx.authBy(which: NormalAuth(
        scope: "snsapi_userinfo",
        state: "wechat_sdk_demo_test",
      ));

      if (!result) {
        ToastUtil.show("拉起微信失败");
        if (!completer.isCompleted) completer.complete(null);
      }
    } catch (e) {
      LogUtil.e("WeChat auth exception: $e");
      if (!completer.isCompleted) completer.complete(null);
    }

    // 设置超时
    return completer.future.timeout(const Duration(minutes: 2), onTimeout: () {
      LogUtil.w("WeChat login timeout");
      return null;
    }).whenComplete(() {
      cancelable.cancel();
    });
  }
}
