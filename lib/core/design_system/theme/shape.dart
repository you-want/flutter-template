import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext get context => Get.context!;

//==================== 圆角 ====================
/// 小圆角，用于小型组件、标签等
double get radiusSmall => 4.0;

/// 默认圆角，用于按钮、卡片等常规组件
double get radiusDefault => 8.0;

/// 中等圆角，兼容历史命名，等价于默认圆角
double get radiusMedium => radiusDefault;

/// 大圆角，用于大型组件、对话框等
double get radiusLarge => 12.0;

/// 特大圆角，用于需要明显圆角的设计元素
double get radiusExtraLarge => 16.0;

/// 胶囊形圆角，数值设置较大，适用于胶囊按钮、药丸形状标签等
double get radiusRound => 24.0;

/// 圆形圆角，等同于胶囊形圆角，当宽高相等时呈现为圆形
double get radiusCircle => 999.0;

//==================== 常用形状 ====================
/// 小圆角形状，适用于小型组件
RoundedRectangleBorder get smallRoundedShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSmall));

/// 默认圆角形状，适用于按钮、卡片等常规组件
RoundedRectangleBorder get defaultRoundedShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusDefault));

/// 大圆角形状，适用于大型组件、对话框等
RoundedRectangleBorder get largeRoundedShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLarge));

/// 特大圆角形状，适用于需要明显圆角的设计元素
RoundedRectangleBorder get extraLargeRoundedShape => RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(radiusExtraLarge),
);

/// 胶囊形形状，适用于胶囊按钮、药丸形状标签等
RoundedRectangleBorder get roundShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusRound));

/// 圆形形状，当宽高相等时呈现为圆形
RoundedRectangleBorder get circleShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusCircle));
