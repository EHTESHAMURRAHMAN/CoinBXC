import 'package:coinbxc/app/routes/app_pages.dart';
import 'package:coinbxc/app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final brandColor = theme.primaryColor;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Form(
        key: controller.loginFormKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Image.asset('assets/images/logo.png', height: height * 0.14),

                const SizedBox(height: 12),

                Text(
                  'Coin BXC',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 6),

                Text(
                  'Securely trade crypto with confidence',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.hintColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                _loginCard(context),

                const SizedBox(height: 24),

                _registerSection(theme, brandColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.12),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back",

            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Login to continue trading and managing your assets",
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),

          const SizedBox(height: 28),

          TextFormField(
            onChanged: (value) {
              controller.updateButtonState();
            },
            controller: controller.controllerEmail,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            decoration: _inputDecoration("Email", context),
            validator: (value) =>
                !passwordValidator(value ?? '') ? 'Enter valid email id' : null,
          ),

          const SizedBox(height: 15),

          Obx(
            () => TextFormField(
              onChanged: (value) {
                controller.updateButtonState();
              },
              controller: controller.controllerPassword,
              obscureText: controller.showPass.value,
              autofillHints: const [AutofillHints.password],
              decoration: _inputDecoration("Password", context).copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showPass.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () => controller.showPass.toggle(),
                ),
              ),
              // validator:
              //     (value) =>
              //         !emailValidator(value ?? '')
              //             ? 'Enter valid Password'
              //             : null,
            ),
          ),

          const SizedBox(height: 28),

          Obx(
            () => Center(
              child: SizedBox(
                width: Get.width / 2,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    final form = controller.loginFormKey.currentState;
                    if (form?.validate() ?? false) {}
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    backgroundColor: controller.isButtonEnabled.value
                        ? Get.theme.primaryColor
                        : Get.theme.primaryColor.withOpacity(0.5),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerSection(ThemeData theme, Color brandColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(color: theme.hintColor.withValues(alpha: 0.8)),
        ),
        TextButton(
          onPressed: () => Get.toNamed(Routes.REGISTER),
          child: Text(
            "Register Now",
            style: TextStyle(color: brandColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label, BuildContext context) {
    return InputDecoration(
      labelText: label,
      hintText: "Enter your $label",

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Get.theme.hintColor.withOpacity(0.25)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xff00BC89), width: 1.4),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red, width: 1.4),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red, width: 1.8),
      ),

      hintStyle: TextStyle(
        color: Get.theme.hintColor.withValues(alpha: 0.6),
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: Get.theme.hintColor.withOpacity(0.6),
        fontWeight: FontWeight.w400,
      ),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
      suffixIconColor: const Color(0xff00BC89),
      prefixIconColor: const Color(0xff00BC89),
    );
  }
}
