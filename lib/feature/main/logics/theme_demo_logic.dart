import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_template/application.dart';
import 'package:flutter_template/core/base/base/base_logic.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../res/json_res.dart';
import '../models/demo_item.dart';
import '../states/theme_demo_state.dart';

class ThemeDemoLogic extends BaseLogic {
  final ThemeDemoState themeDemoState = ThemeDemoState();

  @override
  void onInit() {
    super.onInit();
    _initThemeDemoItems();
  }

  /// 初始化主题Demo项目数据
  void _initThemeDemoItems() {
    themeDemoState.themeDemoItems = [
      DemoItem(
        title: '绿色主题',
        description: '切换应用为绿色主题风格',
        icon: Icons.palette,
        onTap: () => _switchTheme(JsonRes.green, 'green'),
      ),
      DemoItem(
        title: '红色主题',
        description: '切换应用为红色主题风格',
        icon: Icons.palette,
        onTap: () => _switchTheme(JsonRes.red, 'red'),
      ),
      DemoItem(
        title: '蓝色主题',
        description: '切换应用为蓝色主题风格',
        icon: Icons.palette,
        onTap: () => _switchTheme(JsonRes.blue, 'blue'),
      ),
      DemoItem(
        title: '默认主题',
        description: '恢复应用默认主题风格',
        icon: Icons.palette,
        onTap: () => _switchTheme(JsonRes.theme, 'theme'),
      ),
    ];
  }

  /// 通用主题切换方法
  /// [assetPath] 主题配置文件路径
  /// [themeKey] 主题JSON中的key
  Future<void> _switchTheme(String assetPath, String themeKey) async {
    final jsonString = await rootBundle.loadString(assetPath);
    final seed = _extractBrandColor7(jsonString, themeKey);
    final theme = Application.themeFromSeed(seed ?? const Color(0xFF2f46ec));
    Application.updateTheme(theme);
    await Future.delayed(const Duration(milliseconds: 50));
    Get.forceAppUpdate();
  }

  Color? _extractBrandColor7(String jsonString, String key) {
    try {
      final Map<String, dynamic> data = json.decode(jsonString) as Map<String, dynamic>;
      final Map<String, dynamic>? section = data[key] as Map<String, dynamic>?;
      final Map<String, dynamic>? color = section?['color'] as Map<String, dynamic>?;
      final String? hex = color?['brandColor7'] as String?;
      if (hex == null) return null;
      return _colorFromHex(hex);
    } catch (_) {
      return null;
    }
  }

  Color _colorFromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
