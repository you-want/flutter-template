import 'package:flutter/material.dart';

import '../base/base_view.dart';
import 'base_tab_logic.dart';

abstract class BaseTabView<T extends BaseTabLogic> extends BaseView<T> {
  const BaseTabView({super.key});

  /// tab颜色
  final Color tabColor = const Color(0xff171A1D);

  @override
  double get navHeight => 92;

  @override
  Widget? get navBottomWidget => tabsWidget();

  /// tabsWidget
  Widget tabsWidget() {
    return TabBar(
      tabs: controller.tabList.map((title) => Tab(text: title)).toList(),
      indicatorColor: tabColor,
      labelColor: tabColor,
      controller: controller.tabState.tabController,
      onTap: (int index) => controller.tabChange(index),
    );
  }

  /// 主视图 如果不想使用pageView 子类重写body即可
  @override
  Widget body() {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: controller.tabState.pageController,
      children: pageViewChildren(),
      onPageChanged: (int index) => controller.pageViewChange(index),
    );
  }

  /// 抽象方法，子类可选实现，返回 PageView 的子页面列表
  List<Widget> pageViewChildren() {
    return [];
  }
}
