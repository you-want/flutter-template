import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/core/base/base/base_logic.dart';
import 'package:flutter_template/core/network/service/auth/auth_api.dart';
import 'package:flutter_template/core/model/request/send_sms_request.dart';
import 'package:flutter_template/core/model/request/sms_login_request.dart';

class LoginController extends BaseLogic {
  final AuthApi _authApi = Get.find<AuthApi>();

  final phoneController = TextEditingController();
  final captchaController = TextEditingController();
  final smsCodeController = TextEditingController();

  final captchaImage = Rx<Uint8List?>(null);
  String captchaId = '';

  final canSendSms = false.obs;
  final canLogin = false.obs;
  final countdown = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_onInputChanged);
    captchaController.addListener(_onInputChanged);
    smsCodeController.addListener(_onInputChanged);
    getCaptcha();
  }

  @override
  void onClose() {
    _timer?.cancel();
    phoneController.removeListener(_onInputChanged);
    captchaController.removeListener(_onInputChanged);
    smsCodeController.removeListener(_onInputChanged);
    phoneController.dispose();
    captchaController.dispose();
    smsCodeController.dispose();
    super.onClose();
  }

  void _onInputChanged() {
    canSendSms.value = phoneController.text.length == 11 && captchaController.text.length == 4;
    canLogin.value = phoneController.text.length == 11 &&
        captchaController.text.length == 4 &&
        smsCodeController.text.length == 6;
  }

  /// 获取图片验证码
  Future<void> getCaptcha() async {
    final result = await _authApi.getCaptcha();
    // 这里需要你根据实际返回结构解析图片和id
    // 假设 result.data 结构为 { "img": base64, "captchaId": "xxx" }
    if (result.data != null) {
      captchaImage.value = result.data!['imgBytes'];
      captchaId = result.data!['captchaId'];
    }
  }

  /// 发送短信验证码
  Future<void> sendSmsCode() async {
    if (!canSendSms.value || countdown.value > 0) return;

    final request = SendSmsRequest(
      phone: phoneController.text,
      captcha: captchaController.text,
      captchaId: captchaId,
    );

    final result = await _authApi.sendSmsCode(request);
    if (result.code == 1000) {
      // 发送成功
      // showToast('短信验证码已发送');
      _startCountdown();
    } else {
      // showToast(result.message ?? '发送失败');
      getCaptcha(); // 发送失败时，刷新图片验证码
    }
  }

  void _startCountdown() {
    countdown.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  /// 登录
  Future<void> login() async {
    if (!canLogin.value) return;

    final request = SmsLoginRequest(
      phone: phoneController.text,
      smsCode: smsCodeController.text,
    );

    final result = await _authApi.loginBySms(request);
    if (result.code == 1000) {
      // showToast('登录成功');
      // TODO: 跳转到主页
    } else {
      // showToast(result.message ?? '登录失败');
    }
  }
}
