import 'package:flutter_template/core/base/base/base_logic.dart';
import 'package:flutter/material.dart';

import '../../../routes/route_manager.dart';
import '../models/demo_item.dart';
import '../states/base_demo_state.dart';

class BaseDemoLogic extends BaseLogic {
  final BaseDemoState baseDemoState = BaseDemoState();

  @override
  void onInit() {
    super.onInit();
    _initDemoItems();
  }

  /// 初始化Demo项目数据
  void _initDemoItems() {
    baseDemoState.demoItems = [
      DemoItem(
        title: 'Base 示例',
        description: '展示基础页面组件的使用，包含导航栏、浮动按钮、底部栏等基础布局组件',
        icon: Icons.layers,
        onTap: _onBaseViewTap,
      ),
      DemoItem(
        title: 'BaseList 示例',
        description: '展示列表页面的使用，包含分页加载、下拉刷新、无数据、加载失败等列表状态',
        icon: Icons.list,
        onTap: _onBaseListViewTap,
      ),
      DemoItem(
        title: 'BaseNetwork 示例',
        description: '展示网络请求页面的使用，包含加载中、请求成功、请求失败等网络状态管理',
        icon: Icons.wifi,
        onTap: _onBaseNetworkViewTap,
      ),
      DemoItem(
        title: 'BaseRefresh 示例',
        description: '展示下拉刷新页面的使用，包含下拉刷新、上拉加载、刷新状态等功能',
        icon: Icons.refresh,
        onTap: _onBaseRefreshViewTap,
      ),
      DemoItem(
        title: 'BaseTab 示例',
        description: '展示标签页面的使用，包含标签切换、标签指示器、标签内容管理等功能',
        icon: Icons.view_week,
        onTap: _onBaseTabViewTap,
      ),
      DemoItem(
        title: 'BaseDialog 示例',
        description: '展示弹窗的使用，包含弹窗、弹窗标题、弹窗内容、弹窗按钮等状态',
        icon: Icons.chat_bubble_outline,
        onTap: _onBaseDialogTap,
      ),
    ];
  }

  /// BaseView 示例点击
  void _onBaseViewTap() {
    toBaseDemoPage();
  }

  /// BaseListView 示例点击
  void _onBaseListViewTap() {
    toBaseListDemoPage();
  }

  /// BaseNetworkView 示例点击
  void _onBaseNetworkViewTap() {
    toBaseNetworkDemoPage();
  }

  /// BaseRefreshView 示例点击
  void _onBaseRefreshViewTap() {
    toBaseRefreshDemoPage();
  }

  /// BaseTabView 示例点击
  void _onBaseTabViewTap() {
    toBaseTabDemoPage();
  }

  /// BaseDialog 示例点击
  void _onBaseDialogTap() {
    toBaseDialogDemoPage();
  }
}
