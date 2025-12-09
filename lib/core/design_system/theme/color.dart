import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext get _context => Get.context!;
ColorScheme get _scheme => Theme.of(_context).colorScheme;

//====================主色====================
/// 品牌主色，用于主要按钮、主要图标、重点文字等
Color get primary => _scheme.primary;

/// 品牌浅色，用于主色浅色背景、hover状态等
Color get primaryLight => _scheme.primaryContainer;

/// 品牌深色，用于主色深色背景、点击状态等
Color get primaryDark => _scheme.primary;

/// 品牌禁用色，用于禁用状态的主色按钮等元素
Color get primaryDisabled => Theme.of(_context).disabledColor;

/// 品牌聚焦色，用于聚焦状态交互
Color get primaryFocus => _scheme.primaryContainer;

/// 品牌激活色，用于点击状态
Color get primaryActive => _scheme.primary;

//====================成功色====================
/// 成功色，用于成功状态、完成状态的按钮、图标和文字
Color get success => _scheme.secondary;

/// 成功浅色，用于成功状态的背景色
Color get successLight => _scheme.secondaryContainer;

/// 成功禁用色，用于禁用状态的成功色按钮等元素
Color get successDisabled => Theme.of(_context).disabledColor;

/// 成功聚焦色，用于成功元素的聚焦状态
Color get successFocus => _scheme.secondaryContainer;

/// 成功激活色，用于成功元素的点击状态
Color get successActive => _scheme.secondary;

//====================警告色====================
/// 警告色，用于警告状态、需要注意的按钮、图标和文字
Color get warning => _scheme.tertiary;

/// 警告浅色，用于警告状态的背景色
Color get warningLight => _scheme.tertiaryContainer;

/// 警告禁用色，用于禁用状态的警告色按钮等元素
Color get warningDisabled => Theme.of(_context).disabledColor;

/// 警告聚焦色，用于警告元素的聚焦状态
Color get warningFocus => _scheme.tertiaryContainer;

/// 警告激活色，用于警告元素的点击状态
Color get warningActive => _scheme.tertiary;

//====================错误色====================
/// 错误色，用于错误状态、失败状态的按钮、图标和文字
Color get error => _scheme.error;

/// 错误浅色，用于错误状态的背景色
Color get errorLight => _scheme.errorContainer;

/// 错误禁用色，用于禁用状态的错误色按钮等元素
Color get errorDisabled => Theme.of(_context).disabledColor;

/// 错误聚焦色，用于错误元素的聚焦状态
Color get errorFocus => _scheme.errorContainer;

/// 错误激活色，用于错误元素的点击状态
Color get errorActive => _scheme.error;

//====================背景色====================
/// 页面整体背景色(白色)
Color get backgroundPage => _scheme.background;

/// 一级容器背景色，用于卡片、弹窗等容器背景
Color get backgroundContainer => _scheme.surface;

/// 一级容器激活态背景色
Color get backgroundContainerActive => _scheme.surfaceVariant;

/// 二级容器背景色，用于次级区域背景 (灰色) 配合卡片使用
Color get backgroundSecondaryContainer => _scheme.surface;

/// 二级容器激活态背景色
Color get backgroundSecondaryContainerActive => _scheme.surfaceVariant;

/// 组件背景色，用于默认状态的组件背景
Color get backgroundComponent => _scheme.surfaceVariant;

/// 组件激活态背景色，用于按钮等组件激活状态
Color get backgroundComponentActive => _scheme.secondaryContainer;

/// 组件禁用态背景色，用于禁用状态的组件背景
Color get backgroundComponentDisabled => Theme.of(_context).disabledColor;

//====================文本色====================
/// 主要文本颜色，用于重要级文字信息、标题
Color get textPrimary => _scheme.onSurface;

/// 次要文本颜色，用于次级文字信息
Color get textSecondary => _scheme.onSurfaceVariant;

/// 占位文本颜色，用于占位符、输入框提示等
Color get textPlaceholder => _scheme.onSurfaceVariant;

/// 禁用文本颜色，用于禁用状态的文字
Color get textDisabled => Theme.of(_context).disabledColor;

/// 反色文本，用于深色背景上的文字
Color get textAnti => _scheme.onPrimary;

/// 品牌色文本，用于链接、强调文字
Color get textBrand => _scheme.primary;

/// 链接文本颜色，用于链接文字
Color get textLink => _scheme.primary;

//====================边框色====================
/// 一级边框颜色，用于分割线、边框等
Color get borderLevel1 => Theme.of(_context).dividerColor;

/// 二级边框颜色，用于较深的分割线、边框等
Color get borderLevel2 => Theme.of(_context).dividerColor.withOpacity(0.7);
