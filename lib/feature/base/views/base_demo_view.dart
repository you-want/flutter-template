import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/base/base/base_view.dart';
import '../../../core/design_system/theme/color.dart';
import '../../../core/design_system/theme/size.dart';
import '../logics/base_demo_logic.dart';

class BaseDemoView extends BaseView<BaseDemoLogic> {
  const BaseDemoView({super.key});

  @override
  double get navHeight => 88;

  @override
  String? get navTitle => 'Base 示例';

  @override
  List<Widget>? get rightBarItems => [
        Padding(
          padding: EdgeInsets.only(right: spaceHorizontalXLarge),
          child: IconButton(
            icon: const Icon(Icons.notifications, size: 20),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: spaceHorizontalLarge),
          child: IconButton(
            icon: const Icon(Icons.code, size: 20),
            onPressed: () {},
          ),
        ),
      ];

  @override
  Widget? get navBottomWidget => Container(
        padding: EdgeInsets.symmetric(horizontal: spaceHorizontalLarge),
        height: navHeight * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: 'all',
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(value: 'all', child: Text('全部产品')),
                DropdownMenuItem(value: 'new', child: Text('最新产品')),
                DropdownMenuItem(value: 'hot', child: Text('最火产品')),
              ],
              onChanged: (v) {},
            ),
            const SizedBox(width: 24),
            DropdownButton<String>(
              value: 'default',
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(value: 'default', child: Text('默认排序')),
                DropdownMenuItem(value: 'price', child: Text('价格从高到低')),
              ],
              onChanged: (v) {},
            ),
          ],
        ),
      );

  @override
  Widget body() => const Text(
        '页面主视图内容\n对 Scaffold 做了封装，减少样板代码',
        textAlign: TextAlign.center,
      )
          // 防止外层路由跳转导致的异常，保持页面稳定展示
          .center()
          .backgroundColor(backgroundSecondaryContainer);

  @override
  Widget? floatingAction() {
    return FloatingActionButton.extended(
      // Demo 路由暂未开启，避免触发无效导航
      onPressed: () {},
      label: const Text('Floating'),
      icon: const Icon(Icons.add),
    );
  }

  @override
  Widget? bottom() {
    return NavigationBar(
      height: 60,
      selectedIndex: 2,
      // Demo 路由暂未开启，避免触发无效导航
      onDestinationSelected: (index) {},
      destinations: const [
        NavigationDestination(
          icon: Badge(label: Text('3'), child: Icon(Icons.chat_bubble_outline)),
          selectedIcon: Badge(label: Text('3'), child: Icon(Icons.chat_bubble)),
          label: '消息',
        ),
        NavigationDestination(
          icon: Icon(Icons.insert_drive_file_outlined),
          selectedIcon: Icon(Icons.insert_drive_file),
          label: '待办',
        ),
        NavigationDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps),
          label: '工作台',
        ),
        NavigationDestination(
          icon: Icon(Icons.contact_page_outlined),
          selectedIcon: Icon(Icons.contact_page),
          label: '通讯录',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  }

  /// 底部导航栏item（已改为 Material NavigationBar，不再需要）
}
