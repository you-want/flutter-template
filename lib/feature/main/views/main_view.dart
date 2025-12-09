import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/core/base/base/base_view.dart';

import '../../../core/design_system/theme/color.dart';
import '../logics/main_logic.dart';
import '../../../routes/app_pages.dart';

class MainView extends BaseView<MainLogic> {
  const MainView({super.key});

  @override
  bool get isHiddenNav => true;

  @override
  Widget body() {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: controller.mainState.pageController,
      children: controller.pageList,
      onPageChanged: (int index) => controller.pageViewChange(index),
    );
  }

  @override
  Widget? bottom() {
    return Obx(() => NavigationBar(
          selectedIndex: controller.mainState.pageIndex.value,
          onDestinationSelected: (index) => controller.tabBarClick(index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.layers_outlined), selectedIcon: Icon(Icons.layers), label: '基类'),
            NavigationDestination(icon: Icon(Icons.language_outlined), selectedIcon: Icon(Icons.language), label: '网络'),
            NavigationDestination(icon: Icon(Icons.build_outlined), selectedIcon: Icon(Icons.build), label: '工具'),
            NavigationDestination(icon: Icon(Icons.palette_outlined), selectedIcon: Icon(Icons.palette), label: '主题'),
            NavigationDestination(icon: Icon(Icons.apps_outlined), selectedIcon: Icon(Icons.apps), label: 'Demo'),
          ],
        ));
  }

}
