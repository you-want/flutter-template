import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('应用更新')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('当前应用版本信息'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => UpgradeAlert(
                    upgrader: Upgrader(
                      debugLogging: true,
                    ),
                    dialogStyle: UpgradeDialogStyle.cupertino,
                    showIgnore: false,
                    showLater: false,
                  ),
                );
              },
              child: const Text('检查更新'),
            ),
          ],
        ),
      ),
    );
  }
}
