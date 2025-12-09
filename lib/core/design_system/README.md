# 设计系统 (Design System)

应用的设计系统，提供统一的设计规范、主题系统和组件库，确保整个应用的视觉一致性和用户体验。基于 Flutter Material 3 的 `ColorScheme` 与 Styled Widget 构建。

## 📋 目录

- [概述](#概述)
- [颜色系统](#颜色系统)
- [文字排版](#文字排版)
- [尺寸间距](#尺寸间距)
- [圆角规范](#圆角规范)
- [阴影效果](#阴影效果)
- [布局组件](#布局组件)
  - [Column 组件](#column-组件)
  - [Row 组件](#row-组件)
  - [Space 组件](#space-组件)
- [使用示例](#使用示例)

## 🎯 概述

本设计系统基于 Flutter 的主题系统与 Styled Widget 构建，提供：
- 📐 **统一的设计规范**：颜色、字体、间距、圆角等
- 🎨 **深浅主题支持**：遵循 Material 3 的 `ColorScheme`
- 🧩 **组件化设计**：预设常用布局组件
- 🔧 **易于使用**：简化的 API 设计

## 🎨 颜色系统

颜色系统基于 Material 3 的 `ColorScheme`，定义在 `color.dart` 中，提供了一系列语义化的颜色变量。

### 主色调
```dart
// 品牌主色，用于主要按钮、主要图标、重点文字等
Color get primary => Theme.of(Get.context!).colorScheme.primary;

// 品牌浅色，用于主色浅色背景、hover 状态等
Color get primaryLight => Theme.of(Get.context!).colorScheme.primaryContainer;

// 品牌深色，用于主色深色背景、点击状态等
Color get primaryDark => Theme.of(Get.context!).colorScheme.primary;
```

### 功能色
```dart
// 成功色，用于成功状态、完成状态的按钮、图标和文字
Color get success => Theme.of(Get.context!).colorScheme.secondary;

// 警告色，用于警告状态、需要注意的按钮、图标和文字
Color get warning => Theme.of(Get.context!).colorScheme.tertiary;

// 错误色，用于错误状态、失败状态的按钮、图标和文字
Color get error => Theme.of(Get.context!).colorScheme.error;
```

### 文字颜色
```dart
// 主要文本颜色，用于重要级文字信息、标题
Color get textPrimary => Theme.of(Get.context!).colorScheme.onSurface;

// 次要文本颜色，用于次级文字信息
Color get textSecondary => Theme.of(Get.context!).colorScheme.onSurfaceVariant;

// 占位文本颜色，用于占位符、输入框提示等
Color get textPlaceholder => Theme.of(Get.context!).colorScheme.onSurfaceVariant;
```

### 背景色
```dart
// 页面整体背景色
Color get backgroundPage => Theme.of(Get.context!).colorScheme.background;

// 一级容器背景色，用于卡片、弹窗等容器背景
Color get backgroundContainer => Theme.of(Get.context!).colorScheme.surface;

// 组件背景色，用于默认状态的组件背景
Color get backgroundComponent => Theme.of(Get.context!).colorScheme.surfaceVariant;
```

### 使用方式
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/color.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/size.dart';

// 使用颜色与字体
Text(
  "标题文本",
  style: (fontTitleLarge ?? const TextStyle()).copyWith(color: textPrimary),
)
  .padding(all: spacePaddingMedium)
  .backgroundColor(backgroundContainer)
```

## ✏️ 文字排版

文字排版系统定义在`type.dart`中，提供了各种预设的字体样式。

### 字体规格

| 样式 | 用途 |
|-----|------|
| fontDisplayLarge | 超大号显示文字 (64/72)，用于特别重要的页面标题，活动页大标题 |
| fontTitleLarge | 大号标题 (18/26)，用于对话框标题，列表标题 |
| fontBodyMedium | 中号正文 (14/22)，用于常规内容文本，列表内容，表单内容 |
| fontMarkSmall | 小号标记文字 (12/20)，用于小型标签，辅助提示 |

### 字重

```dart
// 常规字重，用于普通文本内容，正文文本
FontWeight get fontWeightRegular => FontWeight.normal;

// 中等字重，用于需要轻微强调的文本，如副标题
FontWeight get fontWeightMedium => FontWeight.w500;

// 加粗字重，用于标题、重点强调文本
FontWeight get fontWeightBold => FontWeight.w600;
```

### 使用示例
```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/color.dart';

// 使用 Text + 设计系统字体
Text(
  "标题文本",
  style: (fontTitleLarge ?? const TextStyle()).copyWith(
    fontWeight: fontWeightBold,
    color: textPrimary,
  ),
)
```

## 📏 尺寸间距

尺寸间距系统定义在`size.dart`中，提供了一系列预设的间距值和语义化的间距命名。

### 基础间距
```dart
// 4dp间距，最小间隔，如紧凑排列的元素间距
double get spacer4 => TDTheme.of(_context).spacer4;

// 8dp间距，小间距，如图标与文字之间、紧凑布局的元素间距
double get spacer8 => TDTheme.of(_context).spacer8;

// 16dp间距，常规间距，如卡片内边距、按钮内边距
double get spacer16 => TDTheme.of(_context).spacer16;
```

### 垂直间距
```dart
// 超小垂直间距(4dp)，用于最小的垂直间隔，如紧凑排列的元素间距
double get spaceVerticalXSmall => spacer4;

// 中等垂直间距(12dp)，用于内容区域的常规间距，如列表项之间的间距
double get spaceVerticalMedium => spacer12;

// 大垂直间距(16dp)，用于卡片内部主要内容块之间的间距
double get spaceVerticalLarge => spacer16;
```

### 水平间距
```dart
// 超小水平间距(4dp)，用于最小的水平间隔，如紧凑排列的元素间距
double get spaceHorizontalXSmall => spacer4;

// 中等水平间距(12dp)，用于中等容器的水平间距，如列表项的左右间距
double get spaceHorizontalMedium => spacer12;

// 大水平间距(16dp)，用于常规容器的左右边距，如卡片的内边距
double get spaceHorizontalLarge => spacer16;
```

### 内边距
```dart
// 小内边距(8dp)，用于紧凑型组件的内边距，如小型按钮
double get spacePaddingSmall => spacer8;

// 中等内边距(12dp)，用于按钮、输入框等中型组件的内边距
double get spacePaddingMedium => spacer12;

// 大内边距(16dp)，用于卡片、对话框等容器的内边距
double get spacePaddingLarge => spacer16;
```

### 边距对象
```dart
// 页面标准边距(水平16dp、垂直16dp)
EdgeInsets get pagePadding => EdgeInsets.symmetric(
  horizontal: spaceHorizontalLarge,
  vertical: spaceVerticalLarge,
);

// 卡片标准内边距(16dp)
EdgeInsets get cardPadding => EdgeInsets.all(spacePaddingLarge);

// 列表项标准内边距(水平16dp、垂直12dp)
EdgeInsets get listItemPadding => EdgeInsets.symmetric(
  horizontal: spaceHorizontalLarge,
  vertical: spaceVerticalMedium,
);
```

### 使用方式
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/size.dart';

// 使用间距 - 使用 styled_widget
const Text("内容")
  .padding(all: spacePaddingLarge)
  .padding(
    vertical: spaceVerticalMedium,
    horizontal: spaceHorizontalLarge,
  )

// 使用分隔间距 - 使用 column.dart
[
  const Text("第一行"),
  const Text("第二行"),
].toColumnStart(spacing: spaceVerticalMedium)
```

## 🔘 圆角规范

圆角规范定义在`shape.dart`中，提供了一系列预设的圆角值和形状。

### 圆角值
```dart
// 小圆角，用于小型组件、标签等
double get radiusSmall => TDTheme.of(_context).radiusSmall;

// 默认圆角，用于按钮、卡片等常规组件
double get radiusDefault => TDTheme.of(_context).radiusDefault;

// 大圆角，用于大型组件、对话框等
double get radiusLarge => TDTheme.of(_context).radiusLarge;

// 胶囊形圆角，数值设置较大，适用于胶囊按钮、药丸形状标签等
double get radiusRound => TDTheme.of(_context).radiusRound;
```

### 形状对象
```dart
// 小圆角形状，适用于小型组件
RoundedRectangleBorder get smallRoundedShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSmall));

// 默认圆角形状，适用于按钮、卡片等常规组件
RoundedRectangleBorder get defaultRoundedShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusDefault));

// 圆形形状，当宽高相等时呈现为圆形
RoundedRectangleBorder get circleShape =>
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusCircle));
```

### 使用方式
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/color.dart';
import 'package:your_app/core/design_system/theme/shape.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/theme/type.dart';

// 使用圆角值 - 使用 styled_widget
Text("圆角容器", style: fontBodyLarge)
  .padding(all: spacePaddingMedium)
  .backgroundColor(backgroundContainer)
  .clipRRect(all: radiusDefault);

// 使用形状对象 - 使用 styled_widget 的 card 方法
Text("圆角卡片", style: fontBodyLarge)
  .padding(all: spacePaddingMedium)
  .card(
    elevation: 2,
    shape: defaultRoundedShape,
    color: backgroundContainer,
  );
```

## 🌥️ 阴影效果

阴影效果定义在`shadows.dart`中，提供了一系列预设的阴影样式（基于 Material 3 的色板与阴影约定）。

### 基础阴影
```dart
// 基础投影，适用于卡片、按钮等基础元素
List<BoxShadow> get shadowBase;

// 中层投影，适用于对话框、弹出菜单等中层元素
List<BoxShadow> get shadowMiddle;

// 上层投影，适用于抽屉、模态框等上层元素
List<BoxShadow> get shadowTop;
```

### 阴影装饰
```dart
// 卡片阴影，用于卡片、面板等元素
BoxDecoration get cardShadow;

// 弹出层阴影，用于弹出菜单、下拉菜单等元素
BoxDecoration get popupShadow;
```

### 使用方式
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/color.dart';
import 'package:your_app/core/design_system/theme/shape.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/shadows.dart';

// 使用阴影效果 - 使用 styled_widget
Text("带阴影的卡片", style: fontBodyLarge)
  .padding(all: spacePaddingMedium)
  .backgroundColor(backgroundContainer)
  .clipRRect(all: radiusDefault)
  .boxShadow(shadowBase);

// 使用 styled_widget 的 elevation 方法
Text("带海拔的卡片", style: fontBodyLarge)
  .padding(all: spacePaddingMedium)
  .backgroundColor(backgroundContainer)
  .clipRRect(all: radiusDefault)
  .elevation(
    2,
    borderRadius: BorderRadius.circular(radiusDefault),
  );
```

## 📊 布局组件

布局组件基于`styled_widget`库封装，提供了更便捷的布局方式。

### Column 组件

`column.dart`提供了基于`styled_widget`的Column扩展，可以更方便地创建各种对齐方式的垂直布局。

#### 基础用法
```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/widgets/column.dart';

// 创建居中对齐的Column
[
  Text("第一行", style: fontBodyLarge),
  Text("第二行", style: fontBodyLarge),
  Text("第三行", style: fontBodyLarge),
].toColumnCenter(spacing: spaceVerticalSmall);

// 创建靠左对齐的Column
[
  Text("左对齐第一行", style: fontBodyLarge),
  Text("左对齐第二行", style: fontBodyLarge),
].toColumnStart(spacing: spaceVerticalMedium);
```

#### 对齐方式
```dart
// 靠右对齐
[
  Text("右对齐文本1", style: fontBodyLarge),
  Text("右对齐文本2", style: fontBodyLarge),
].toColumnEnd();

// 两端对齐
[
  Text("顶部文本", style: fontBodyLarge),
  Text("底部文本", style: fontBodyLarge),
].toColumnBetween();

// 均匀分布
[
  Text("文本1", style: fontBodyLarge),
  Text("文本2", style: fontBodyLarge),
  Text("文本3", style: fontBodyLarge),
].toColumnEvenly();

// 拉伸填充
[
  Text("拉伸内容1", style: fontBodyLarge)
    .backgroundColor(Colors.blue)
    .padding(all: spacePaddingMedium),
    
  Text("拉伸内容2", style: fontBodyLarge)
    .backgroundColor(Colors.green)
    .padding(all: spacePaddingMedium),
].toColumnStretch();
```

#### 间距设置
```dart
// 使用固定间距
[
  Text("带间距的文本1", style: fontBodyLarge),
  Text("带间距的文本2", style: fontBodyLarge),
  Text("带间距的文本3", style: fontBodyLarge),
].toColumnCenter(spacing: spaceVerticalLarge);

// 使用自定义分隔Widget
[
  Text("带分隔线的文本1", style: fontBodyLarge),
  Text("带分隔线的文本2", style: fontBodyLarge),
].toColumnCenter(
  separator: Divider(height: 1, color: Colors.grey),
);
```

### Row 组件

`row.dart`提供了基于`styled_widget`的Row扩展，可以更方便地创建各种对齐方式的水平布局。

#### 基础用法
```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/widgets/row.dart';

// 创建居中对齐的Row
[
  Icon(Icons.star),
  Text("评分", style: fontBodyLarge),
].toRowCenter(spacing: spaceHorizontalSmall);

// 创建靠上对齐的Row
[
  Icon(Icons.person, size: 32.0),
  Text("用户名", style: fontBodyLarge),
].toRowTop(spacing: spaceHorizontalSmall);
```

#### 对齐方式
```dart
// 靠下对齐
[
  Text("底部对齐文本", style: fontBodyLarge),
  Icon(Icons.arrow_downward, size: 24.0),
].toRowBottom();

// 两端对齐
[
  Text("左侧文本", style: fontBodyLarge),
  Text("右侧文本", style: fontBodyLarge),
].toRowBetween();

// 均匀分布
[
  Icon(Icons.home),
  Icon(Icons.search),
  Icon(Icons.person),
].toRowEvenly();

// 拉伸填充
[
  Text("拉伸内容1", style: fontBodyLarge)
    .backgroundColor(Colors.red)
    .padding(all: spacePaddingMedium),
    
  Text("拉伸内容2", style: fontBodyLarge)
    .backgroundColor(Colors.yellow)
    .padding(all: spacePaddingMedium),
].toRowStretch();
```

#### 间距设置
```dart
// 使用固定间距
[
  Icon(Icons.star),
  Icon(Icons.star),
  Icon(Icons.star),
].toRowCenter(spacing: spaceHorizontalXSmall);

// 使用自定义分隔Widget
[
  Text("标签1", style: fontBodyLarge),
  Text("标签2", style: fontBodyLarge),
].toRowCenter(
  separator: Container(
    width: 1,
    height: 16,
    color: Colors.grey,
  ),
);
```

### Space 组件

`space.dart`提供了一系列预设的间距组件，避免重复使用`SizedBox`并手动设置高度或宽度，使布局代码更简洁、更易读。

#### 垂直间距组件

```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/widgets/space.dart';

// 方式一：使用预设垂直间距组件
[
  Text("第一行文本", style: fontBodyLarge),
  const SpaceVerticalMedium(), // 12dp的垂直间距
  Text("第二行文本", style: fontBodyLarge),
  const SpaceVerticalLarge(), // 16dp的垂直间距
  Text("第三行文本", style: fontBodyLarge),
].toColumnStart();

// 方式二：使用spacing参数（当所有间距相同时更方便）
[
  Text("第一行文本", style: fontBodyLarge),
  Text("第二行文本", style: fontBodyLarge),
  Text("第三行文本", style: fontBodyLarge),
].toColumnStart(spacing: spaceVerticalMedium); // 所有元素之间都是12dp的间距
```

#### 水平间距组件

```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/widgets/space.dart';

// 方式一：使用预设水平间距组件（不同间距混用）
[
  Icon(Icons.star),
  const SpaceHorizontalSmall(), // 8dp的水平间距
  Text("评分", style: fontBodyLarge),
  const SpaceHorizontalLarge(), // 16dp的水平间距
  Icon(Icons.favorite),
  const SpaceHorizontalSmall(), // 8dp的水平间距
  Text("收藏", style: fontBodyLarge),
].toRowCenter();

// 方式二：使用spacing参数（当所有间距相同时更方便）
[
  Icon(Icons.star),
  Text("评分", style: fontBodyLarge),
  Icon(Icons.favorite),
  Text("收藏", style: fontBodyLarge),
].toRowCenter(spacing: spaceHorizontalSmall); // 所有元素之间都是8dp的间距
```

## 🚀 使用示例

### 商品卡片示例
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/color.dart';
import 'package:your_app/core/design_system/theme/shape.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/widgets/column.dart';
import 'package:your_app/core/design_system/widgets/row.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final VoidCallback onTap;

  const ProductCard({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return [
      // 商品图片
      Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: 120,
      ).clipRRect(all: radiusSmall),
      
      const SpaceVerticalMedium(),
      
      // 商品标题
      Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: fontBodyLarge?.copyWith(color: textPrimary),
      ),
      
      const SpaceVerticalSmall(),
      
      // 价格和购买按钮
      [
        Text(
          "¥${price.toStringAsFixed(2)}",
          style: fontTitleMedium?.copyWith(color: error, fontWeight: fontWeightMedium),
        ),
        
        Icon(
          Icons.add_shopping_cart,
          color: primary,
          size: 24,
        ),
      ].toRowBetween(),
    ]
    .toColumnStart()
    .padding(all: spacePaddingMedium)
    .backgroundColor(backgroundContainer)
    .clipRRect(all: radiusDefault)
    .elevation(
      2,
      borderRadius: BorderRadius.circular(radiusDefault),
    )
    .gestures(onTap: onTap);
  }
}
```

### 用户信息卡片示例
```dart
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:your_app/core/design_system/theme/color.dart';
import 'package:your_app/core/design_system/theme/shape.dart';
import 'package:your_app/core/design_system/theme/size.dart';
import 'package:your_app/core/design_system/theme/type.dart';
import 'package:your_app/core/design_system/widgets/row.dart';

class UserInfoCard extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final int level;

  const UserInfoCard({
    required this.username,
    required this.avatarUrl,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return [
      // 头像
      CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        radius: 24,
      ),
      
      const SpaceHorizontalMedium(),
      
      // 用户信息
      [
        Text(
          username,
          style: fontTitleLarge?.copyWith(color: textPrimary, fontWeight: fontWeightBold),
        ),
        
        const SpaceVerticalXSmall(),
        
        Text(
          "等级 $level",
          style: fontBodySmall?.copyWith(color: textSecondary),
        ),
      ].toColumnStart().expanded(),
      
      // 右侧按钮（使用 Material 按钮）
      OutlinedButton(
        onPressed: () {},
        child: Text("查看", style: fontBodyMedium),
      ),
    ]
    .toRowCenter()
    .padding(all: spacePaddingLarge)
    .backgroundColor(backgroundContainer)
    .clipRRect(all: radiusLarge)
    .elevation(
      2,
      borderRadius: BorderRadius.circular(radiusLarge),
    );
  }
}
```

## 📚 最佳实践

### 1. 使用设计系统组件
```dart
// ✅ 推荐：使用设计系统组件
[
  Text("第一项", style: fontBodyLarge),
  Text("第二项", style: fontBodyLarge),
  Text("第三项", style: fontBodyLarge),
].toColumnCenter(spacing: spaceVerticalMedium);

// ❌ 不推荐：直接使用SizedBox而不是Space组件
[
  Text("第一项", style: fontBodyLarge),
  SizedBox(height: spaceVerticalMedium), // 应使用 const SpaceVerticalMedium()
  Text("第二项", style: fontBodyLarge),
  SizedBox(height: spaceVerticalMedium), // 应使用 const SpaceVerticalMedium()
  Text("第三项", style: fontBodyLarge),
].toColumnCenter();
```

### 2. 使用主题颜色
```dart
// ✅ 推荐：使用主题颜色
Text(
  "标题文本",
  style: fontTitleLarge?.copyWith(color: textPrimary),
)

// ❌ 不推荐：硬编码颜色
Text(
  "标题文本",
  style: fontTitleLarge?.copyWith(color: const Color(0xFF181818)),
)
```

### 3. 使用预设间距
```dart
// ✅ 推荐：使用预设间距
Styled.widget()
  .padding(all: spacePaddingMedium)

// ❌ 不推荐：硬编码间距
Styled.widget()
  .padding(all: 12.0)
```

### 4. 相同间距场景使用spacing参数
```dart
// ✅ 推荐：元素间相同间距时使用spacing参数
[
  Text("第一项", style: fontBodyLarge),
  Text("第二项", style: fontBodyLarge),
  Text("第三项", style: fontBodyLarge),
].toColumnCenter(spacing: spaceVerticalMedium);

// ❌ 不推荐：手动添加间距组件
[
  Text("第一项", style: fontBodyLarge),
  const SpaceVerticalMedium(),
  Text("第二项", style: fontBodyLarge),
  const SpaceVerticalMedium(),
  Text("第三项", style: fontBodyLarge),
].toColumnCenter();
```

### 5. 组合使用 Styled Widget 与设计系统
```dart
// ✅ 推荐：组合使用
Text(
  "文本内容",
  style: fontBodyLarge?.copyWith(color: textPrimary),
)
  .padding(all: spacePaddingMedium)
  .backgroundColor(backgroundContainer)
  .clipRRect(all: radiusDefault)
  .gestures(onTap: () => debugPrint("点击"));
```

## 📚 参考资源

- [Styled Widget 文档](https://github.com/ReinBentdal/styled_widget)
- [Flutter 官方文档](https://flutter.dev/docs)
