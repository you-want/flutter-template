import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                _buildLabel('手机号'),
                const SizedBox(height: 8),
                _buildPhoneInput(),
                const SizedBox(height: 24),
                _buildLabel('图片验证码'),
                const SizedBox(height: 8),
                _buildCaptchaInput(context),
                const SizedBox(height: 24),
                _buildLabel('短信验证码'),
                const SizedBox(height: 8),
                _buildSmsCodeInput(context),
                const SizedBox(height: 48),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF2A2A2A),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7E7E7)),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller.phoneController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11),
        ],
        style: const TextStyle(fontSize: 20, color: Color(0xFF2A2A2A)),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildCaptchaInput(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE7E7E7)),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: controller.captchaController,
              keyboardType: TextInputType.text,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              style: const TextStyle(fontSize: 20, color: Color(0xFF2A2A2A)),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入验证码',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Obx(() => GestureDetector(
              onTap: controller.getCaptcha,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 120,
                  height: 48,
                  color: const Color(0xFFF2F3F5),
                  child: controller.captchaImage.value != null
                      ? Image.memory(
                          controller.captchaImage.value!,
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text('获取验证码', style: TextStyle(color: Colors.grey))),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSmsCodeInput(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE7E7E7)),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: controller.smsCodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              style: const TextStyle(fontSize: 20, color: Color(0xFF2A2A2A)),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入短信验证码',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Obx(() {
          final isCountingDown = controller.countdown.value > 0;
          final canSend = controller.canSendSms.value && !isCountingDown;
          return SizedBox(
            width: 120,
            height: 48,
            child: TextButton(
              onPressed: canSend ? controller.sendSmsCode : null,
              style: TextButton.styleFrom(
                foregroundColor: canSend ? const Color(0xFF3463F8) : Colors.grey,
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: isCountingDown
                  ? Text('已发送 ${controller.countdown.value}s')
                  : const Text('发送验证码'),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: controller.canLogin.value ? controller.login : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4463F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('登录 / 注册', style: TextStyle(color: Colors.white)),
          ),
        ));
  }
}
