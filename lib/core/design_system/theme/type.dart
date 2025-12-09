import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext get _context => Get.context!;
TextTheme get _textTheme => Theme.of(_context).textTheme;

/// 超大号显示文字 (64/72)，用于特别重要的页面标题，活动页大标题
TextStyle? get fontDisplayLarge => _textTheme.displayLarge;

/// 大号显示文字 (48/56)，用于重要页面的主标题，开屏页标题
TextStyle? get fontDisplayMedium => _textTheme.displayMedium;

/// 大型标题 (36/44)，用于重要信息的一级标题，产品名称
TextStyle? get fontHeadlineLarge => _textTheme.headlineLarge;

/// 中型标题 (28/36)，用于页面主要标题，重要内容区标题
TextStyle? get fontHeadlineMedium => _textTheme.headlineMedium;

/// 小型标题 (24/32)，用于次级页面标题，模块标题
TextStyle? get fontHeadlineSmall => _textTheme.headlineSmall;

/// 特大号标题 (20/28)，用于内容区域的主标题，卡片标题
TextStyle? get fontTitleExtraLarge => _textTheme.titleLarge;

/// 大号标题 (18/26)，用于对话框标题，列表标题
TextStyle? get fontTitleLarge => _textTheme.titleLarge;

/// 中号标题 (16/24)，用于表单标题，内容区小标题
TextStyle? get fontTitleMedium => _textTheme.titleMedium;

/// 小号标题 (14/22)，用于辅助性标题，小卡片标题
TextStyle? get fontTitleSmall => _textTheme.titleSmall;

/// 超大号正文 (18/26)，用于重要内容文本，突出显示的信息
TextStyle? get fontBodyExtraLarge => _textTheme.bodyLarge;

/// 大号正文 (16/24)，用于主要内容文本，对话框内容
TextStyle? get fontBodyLarge => _textTheme.bodyLarge;

/// 中号正文 (14/22)，用于常规内容文本，列表内容，表单内容
TextStyle? get fontBodyMedium => _textTheme.bodyMedium;

/// 小号正文 (12/20)，用于次要内容文本，辅助说明文字
TextStyle? get fontBodySmall => _textTheme.bodySmall;

/// 超小号正文 (10/16)，用于极小的辅助文字，版权信息，免责声明
TextStyle? get fontBodyExtraSmall => _textTheme.bodySmall;

/// 大号标记文字 (16/24)，用于重要提示信息，状态标签
TextStyle? get fontMarkLarge => _textTheme.labelLarge;

/// 中号标记文字 (14/22)，用于普通提示信息，标签文本
TextStyle? get fontMarkMedium => _textTheme.labelMedium;

/// 小号标记文字 (12/20)，用于小型标签，辅助提示
TextStyle? get fontMarkSmall => _textTheme.labelSmall;

/// 超小号标记文字 (10/16)，用于微型标签，角标文字
TextStyle? get fontMarkExtraSmall => _textTheme.labelSmall;

/// 大号链接文字 (16/24)，用于主要操作链接，强调性链接
TextStyle? get fontLinkLarge => _textTheme.bodyLarge;

/// 中号链接文字 (14/22)，用于常规链接文字，可点击文本
TextStyle? get fontLinkMedium => _textTheme.bodyMedium;

/// 小号链接文字 (12/20)，用于辅助链接，次要操作链接
TextStyle? get fontLinkSmall => _textTheme.bodySmall;

//==================== 字重 ====================
/// 常规字重，用于普通文本内容，正文文本
FontWeight get fontWeightRegular => FontWeight.normal;

/// 中等字重，用于需要轻微强调的文本，如副标题
FontWeight get fontWeightMedium => FontWeight.w500;

/// 加粗字重，用于标题、重点强调文本
FontWeight get fontWeightBold => FontWeight.w600;
