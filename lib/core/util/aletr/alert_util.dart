import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtil {
  /// 默认的提示标题文本
  static const String defaultTitleText = '提示';

  /// 反馈类对话框
  static void showFeedbackDialog(
    String content, {
    String title = defaultTitleText,
  }) {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }

  /// 确认类对话框
  static void showConfirmDialog(
    String content, {
    String title = defaultTitleText,
    rightBtnAction,
  }) {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                if (rightBtnAction != null) rightBtnAction();
                Get.back();
              },
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }

  /// 输入类对话框
  /// 输入弹窗
  static Future<void> showInputDialog(
    String content, {
    String title = defaultTitleText,
    String hintText = '请输入内容',
    required Function(String value) onConfirm,
  }) async {
    final TextEditingController textController = TextEditingController();
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content),
              const SizedBox(height: 12),
              TextField(
                controller: textController,
                decoration: InputDecoration(hintText: hintText),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                final inputValue = textController.text;
                onConfirm(inputValue);
                Get.back();
              },
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }

  /// 带图片的对话框
  static void showImageDialog(
    String content, {
    required Image image,
    String title = defaultTitleText,
    DialogImagePosition imagePosition = DialogImagePosition.top,
  }) {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        final contentWidget = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePosition == DialogImagePosition.top) image,
            const SizedBox(height: 12),
            Text(content),
            const SizedBox(height: 12),
            if (imagePosition == DialogImagePosition.bottom) image,
          ],
        );

        return AlertDialog(
          title: Text(title),
          content: contentWidget,
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }
}

enum DialogImagePosition { top, bottom }
