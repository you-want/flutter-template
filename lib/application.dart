import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_template/res/json_res.dart';
import 'dart:convert';

import 'core/util/storage/storage_util.dart';

class Application {
  /// 主题 - 使用响应式变量 (Material 3)
  static final Rx<ThemeData> themeData = _themeFromSeed(const Color(0xFF2f46ec)).obs;

  /// Alice 网络请求调试工具
  static late Alice alice;

  /// 页面初始化
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// 系统UI样式配置
    setSystemUIOverlayStyle();

    /// 初始化全局存储
    await StorageUtil.init();

    /// 仅在调试模式下初始化 Alice
    initAlice();

    /// 设置主题
    await setTheme();

    /// 通知需要更新
    return Future.value();
  }

  ///设置系统ui样式
  static setSystemUIOverlayStyle() {
    // 设置导航栏颜色
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // 导航栏背景色
        statusBarColor: Colors.transparent,
        // 导航栏颜色
        statusBarIconBrightness: Brightness.dark,
        // 适配安卓小横条
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  /// 设置主题样式
  static setTheme() async {
    final jsonString = await rootBundle.loadString(JsonRes.theme);
    final seed = _extractBrandColor7(jsonString, 'theme') ?? const Color(0xFF2f46ec);
    themeData.value = _themeFromSeed(seed);
  }

  /// 更新主题
  static void updateTheme(ThemeData newTheme) {
    themeData.value = newTheme;
  }

  /// 提供外部调用的种子主题构建
  static ThemeData themeFromSeed(Color seed) => _themeFromSeed(seed);

  /// 从 JSON 中提取 brandColor7 作为种子色
  static Color? _extractBrandColor7(String jsonString, String key) {
    try {
      final Map<String, dynamic> data = json.decode(jsonString) as Map<String, dynamic>;
      final Map<String, dynamic>? section = data[key] as Map<String, dynamic>?;
      if (section == null) return null;
      final Map<String, dynamic>? color = section['color'] as Map<String, dynamic>?;
      final String? hex = color?['brandColor7'] as String?;
      if (hex == null) return null;
      return _colorFromHex(hex);
    } catch (_) {
      return null;
    }
  }

  static ThemeData _themeFromSeed(Color seed) {
    final colorScheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        iconTheme: WidgetStateProperty.all(IconThemeData(color: colorScheme.onSurfaceVariant)),
        labelTextStyle: WidgetStateProperty.all(TextStyle(color: colorScheme.onSurfaceVariant)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
    );
  }

  static Color _colorFromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// 初始化 Alice
  static initAlice() {
    // 仅在调试模式下初始化 Alice
    if (kDebugMode) {
      alice = Alice();
      alice.setNavigatorKey(Get.key);
    }
  }
}
