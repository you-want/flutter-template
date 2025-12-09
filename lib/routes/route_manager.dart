import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:bot_toast/bot_toast.dart';

import 'app_pages.dart';

/// 统一路由跳转管理
/// 使用 to[页面名]Page 的方式进行页面跳转
/// 可以添加参数验证和业务逻辑限制

/// 跳转到主页
Future<T?>? toMainPage<T>() => _safeToNamed<T>(Routes.MAIN);

/// 跳转到 Base 示例页面
Future<T?>? toBaseDemoPage<T>() => _safeToNamed<T>(Routes.BASE_DEMO);

/// 跳转到 BaseList 示例页面
Future<T?>? toBaseListDemoPage<T>() => _safeToNamed<T>(Routes.BASE_LIST_DEMO);

/// 跳转到 BaseNetwork 示例页面
Future<T?>? toBaseNetworkDemoPage<T>() => _safeToNamed<T>(Routes.BASE_NETWORK_DEMO);

/// 跳转到 BaseRefresh 示例页面
Future<T?>? toBaseRefreshDemoPage<T>() => _safeToNamed<T>(Routes.BASE_REFRESH_DEMO);

/// 跳转到 BaseTab 示例页面
Future<T?>? toBaseTabDemoPage<T>() => _safeToNamed<T>(Routes.BASE_TAB_DEMO);

/// 跳转到 BaseDialog 示例页面
Future<T?>? toBaseDialogDemoPage<T>() => _safeToNamed<T>(Routes.BASE_DIALOG_DEMO);

/// 安全路由跳转：若路由未注册则拦截并提示
Future<T?>? _safeToNamed<T>(String name) {
  if (!_isRouteRegistered(name)) {
    debugPrint('Navigation blocked: route "$name" is not registered');
    BotToast.showText(text: '演示路由未启用：$name');
    return null;
  }
  return Get.toNamed<T>(name);
}

bool _isRouteRegistered(String name) {
  try {
    return AppPages.routes.any((page) => page.name == name);
  } catch (_) {
    return false;
  }
}
