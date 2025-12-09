import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

/// 自定义遮罩加载动画
class LoadingDialog {
  static void show() {
    BotToast.showCustomLoading(
      backgroundColor: Colors.transparent,
      // 在 BotToast v4 中，toastBuilder 的参数是 CancelFunc；
      // 使用 Builder 包装以获取有效的 BuildContext
      toastBuilder: (cancelFunc) {
        return Builder(
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void hide() {
    BotToast.closeAllLoading();
  }
}
