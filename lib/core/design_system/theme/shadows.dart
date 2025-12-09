import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shape.dart';

BuildContext get _context => Get.context!;
ColorScheme get _scheme => Theme.of(_context).colorScheme;

//==================== 阴影 ====================
/// 基础投影，适用于卡片、按钮等基础元素
List<BoxShadow> get shadowBase => [
  BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
];

/// 中层投影，适用于对话框、弹出菜单等中层元素
List<BoxShadow> get shadowMiddle => [
  BoxShadow(
    color: Colors.black.withOpacity(0.12),
    blurRadius: 16,
    offset: const Offset(0, 4),
  ),
];

/// 上层投影，适用于抽屉、模态框等上层元素
List<BoxShadow> get shadowTop => [
  BoxShadow(
    color: Colors.black.withOpacity(0.18),
    blurRadius: 24,
    offset: const Offset(0, 8),
  ),
];

//==================== 常用阴影样式 ====================
/// 卡片阴影，用于卡片、面板等元素
BoxDecoration get cardShadow => BoxDecoration(
  color: _scheme.surface,
  borderRadius: BorderRadius.circular(radiusDefault),
  boxShadow: shadowBase,
);

/// 弹出层阴影，用于弹出菜单、下拉菜单等元素
BoxDecoration get popupShadow => BoxDecoration(
  color: _scheme.surface,
  borderRadius: BorderRadius.circular(radiusLarge),
  boxShadow: shadowMiddle,
);

/// 浮层阴影，用于抽屉、模态框等覆盖元素
BoxDecoration get overlayShadow =>
    BoxDecoration(color: _scheme.surface, boxShadow: shadowTop);

/// 按钮阴影，用于悬浮按钮等需要强调的交互元素
BoxDecoration get buttonShadow => BoxDecoration(
  color: _scheme.surface,
  borderRadius: BorderRadius.circular(radiusDefault),
  boxShadow: shadowBase,
);
