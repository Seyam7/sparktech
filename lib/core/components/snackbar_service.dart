import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService {
  // Default configurations
  static final _defaultConfig = SnackbarConfig(
    title: '',
    message: '',
    backgroundColor: Colors.grey.shade800,
    borderColor: Colors.transparent,
    textColor: Colors.white,
    icon: null,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(10),
    borderRadius: 8.0,
    isDismissible: true,
    showProgressIndicator: false,
  );

  // Presets for different use cases
  static final SnackbarConfig success = _defaultConfig.copyWith(
    backgroundColor: Colors.green.shade800,
    icon: const Icon(Icons.check_circle, color: Colors.white),
  );

  static final SnackbarConfig error = _defaultConfig.copyWith(
    backgroundColor: Colors.red.shade800,
    icon: const Icon(Icons.error, color: Colors.white),
  );

  static final SnackbarConfig warning = _defaultConfig.copyWith(
    backgroundColor: Colors.orange.shade800,
    icon: const Icon(Icons.warning, color: Colors.white),
  );

  static final SnackbarConfig info = _defaultConfig.copyWith(
    backgroundColor: Colors.blue.shade800,
    icon: const Icon(Icons.info, color: Colors.white),
  );

  // Show customized snackbar
  static void show({
    required String message,
    String? title,
    SnackbarConfig? config,
  }) {
    final effectiveConfig = (config ?? _defaultConfig).copyWith(
      title: title ?? config?.title ?? _defaultConfig.title,
      message: message,
    );

    Get.snackbar(
      effectiveConfig.title ?? '',
      effectiveConfig.message ?? '',
      backgroundColor: effectiveConfig.backgroundColor,
      colorText: effectiveConfig.textColor,
      margin: effectiveConfig.margin,
      borderRadius: effectiveConfig.borderRadius,
      duration: effectiveConfig.duration,
      isDismissible: effectiveConfig.isDismissible ?? true,
      icon: effectiveConfig.icon,
      borderColor: effectiveConfig.borderColor,
      borderWidth: effectiveConfig.borderColor != Colors.transparent ? 1 : 0,
      showProgressIndicator: effectiveConfig.showProgressIndicator ?? false,
      snackPosition: effectiveConfig.position ?? SnackPosition.TOP,
    );
  }

  // Utility methods for common cases
  static void showSuccess({required String message, String? title}) {
    show(message: message, title: title ?? 'Success', config: success);
  }

  static void showError({required String message, String? title}) {
    show(message: message, title: title ?? 'Error', config: error);
  }

  static void showWarning({required String message, String? title}) {
    show(message: message, title: title ?? 'Warning', config: warning);
  }

  static void showInfo({required String message, String? title}) {
    show(message: message, title: title ?? 'Info', config: info);
  }
}

class SnackbarConfig {
  final String? title;
  final String? message;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final Duration? duration;
  final EdgeInsets? margin;
  final double? borderRadius;
  final bool? isDismissible;
  final bool? showProgressIndicator;
  final SnackPosition? position;

  SnackbarConfig({
    this.title,
    this.message,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.duration,
    this.margin,
    this.borderRadius,
    this.isDismissible,
    this.showProgressIndicator,
    this.position,
  });

  SnackbarConfig copyWith({
    String? title,
    String? message,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Widget? icon,
    Duration? duration,
    EdgeInsets? margin,
    double? borderRadius,
    bool? isDismissible,
    bool? showProgressIndicator,
    SnackPosition? position,
  }) {
    return SnackbarConfig(
      title: title ?? this.title,
      message: message ?? this.message,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      textColor: textColor ?? this.textColor,
      icon: icon ?? this.icon,
      duration: duration ?? this.duration,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      isDismissible: isDismissible ?? this.isDismissible,
      showProgressIndicator:
          showProgressIndicator ?? this.showProgressIndicator,
      position: position ?? this.position,
    );
  }
}
