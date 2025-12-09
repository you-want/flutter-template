import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bot_toast/bot_toast.dart';
import '../../../../routes/app_pages.dart';

class ExampleDemoView extends StatelessWidget {
  const ExampleDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    final demoList = [
      DemoItem(
        title: '登录页',
        description: '手机号+验证码登录示例',
        icon: Icons.login,
        route: Routes.LOGIN,
      ),
      DemoItem(
        title: '我的',
        description: '我的个人中心',
        icon: Icons.account_circle,
        route: Routes.PROFILE,
      ),
      DemoItem(
        title: '应用更新',
        description: '应用更新说明',
        icon: Icons.download,
        route: Routes.UPDATE,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo 示例中心'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: demoList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = demoList[index];
          return GestureDetector(
            onTap: () => _onTapItem(item.route),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  children: [
                    Icon(item.icon, size: 36, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(item.description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DemoItem {
  final String title;
  final String description;
  final IconData icon;
  final String route;

  DemoItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
  });
} 

void _onTapItem(String route) {
  // 使用本地安全跳转，避免未注册路由导致的异常
  safeToNamed(route);
}

void safeToNamed(String route) {
  try {
    Get.toNamed(route);
  } catch (e) {
    BotToast.showText(text: '演示路由未启用：$route');
  }
}
