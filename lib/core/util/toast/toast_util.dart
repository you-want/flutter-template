import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../design_system/theme/shape.dart';
import '../../design_system/theme/size.dart';

class ToastUtil {
  static CancelFunc? _cancelFunc;

  // Material风格的通知类型
  static const _info = _ToastTheme.info;
  static const _success = _ToastTheme.success;
  static const _warning = _ToastTheme.warning;
  static const _error = _ToastTheme.error;

  static void _showBase(
    String message, {
    _ToastTheme theme = _ToastTheme.info,
  }) {
    _cancelFunc = BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        final context = Get.context!;
        final scheme = Theme.of(context).colorScheme;
        final colors = _mapThemeColors(scheme, theme);
        final icon = _mapThemeIcon(theme);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: spaceHorizontalLarge,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: colors.bg,
            borderRadius: BorderRadius.circular(radiusDefault),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: colors.fg),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(color: colors.fg),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: colors.fg),
                splashRadius: 18,
                onPressed: () {
                  hide();
                },
              )
            ],
          ),
        )
            .marginSymmetric(horizontal: spaceHorizontalLarge);
      },
    );
  }

  /// 普通通知
  static void show(String message) {
    _showBase(message, theme: _info);
  }

  /// 成功通知
  static void success(String message) {
    _showBase(message, theme: _success);
  }

  /// 警告通知
  static void warning(String message) {
    _showBase(message, theme: _warning);
  }

  /// 错误通知
  static void error(String message) {
    _showBase(message, theme: _error);
  }

  static void hide() {
    if (_cancelFunc != null) {
      _cancelFunc!();
      _cancelFunc = null;
    }
  }
}

enum _ToastTheme { info, success, warning, error }

class _ToastColors {
  final Color bg;
  final Color fg;
  const _ToastColors(this.bg, this.fg);
}

_ToastColors _mapThemeColors(ColorScheme scheme, _ToastTheme theme) {
  switch (theme) {
    case _ToastTheme.info:
      return _ToastColors(scheme.surfaceVariant, scheme.onSurfaceVariant);
    case _ToastTheme.success:
      return _ToastColors(scheme.secondaryContainer, scheme.onSecondaryContainer);
    case _ToastTheme.warning:
      return _ToastColors(scheme.tertiaryContainer, scheme.onTertiaryContainer);
    case _ToastTheme.error:
      return _ToastColors(scheme.errorContainer, scheme.onErrorContainer);
  }
}

IconData _mapThemeIcon(_ToastTheme theme) {
  switch (theme) {
    case _ToastTheme.info:
      return Icons.info;
    case _ToastTheme.success:
      return Icons.check_circle;
    case _ToastTheme.warning:
      return Icons.warning_amber_rounded;
    case _ToastTheme.error:
      return Icons.error;
  }
}
