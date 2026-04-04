import 'package:coinbxc/app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brandColor = theme.primaryColor;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Image.asset('assets/images/logo.png', width: width * 0.5),

              const SizedBox(height: 12),

              Text(
                'Securely trade crypto with confidence',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: theme.colorScheme.onSurface.withOpacity(0.25),
                    width: 1.2,
                  ),
                ),
                child: Form(
                  key: controller.regiFormKey,
                  child: Column(
                    children: [
                      Text(
                        'Register',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),

                      _buildTextField(
                        context,
                        label: 'Name',
                        valueController: controller.controllerName,
                        validator: (val) =>
                            val!.isEmpty ? 'Name cannot be blank' : null,
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        context,
                        label: 'Email',
                        valueController: controller.controllerEmail,
                        validator: (val) => !emailValidator(val ?? '')
                            ? 'Enter valid email id'
                            : null,
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => _buildTextField(
                          context,
                          label: 'Password',
                          valueController: controller.controllerPassword,
                          obscureText: controller.showPass.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.showPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: brandColor,
                            ),
                            onPressed: () => controller.showPass.value =
                                !controller.showPass.value,
                          ),
                          validator: (val) => val!.length < 5
                              ? 'Password length must be greater than 5'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Obx(
                        () => _buildTextField(
                          context,
                          label: 'Confirm Password',
                          valueController: controller.controllercPassword,
                          obscureText: controller.showPass.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.showPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: brandColor,
                            ),
                            onPressed: () => controller.showPass.value =
                                !controller.showPass.value,
                          ),
                          validator: (val) {
                            if (val!.length < 5) {
                              return 'Confirm Password too short';
                            }
                            if (val != controller.controllerPassword.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        context,
                        label: 'Mpin',
                        valueController: controller.controllerMPin,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) =>
                            val!.length < 4 ? 'Mpin must be 4 digits' : null,
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        context,
                        label: 'Referral Code (Optional)',
                        valueController: controller.controllerReferral,
                      ),
                      const SizedBox(height: 10),

                      Obx(
                        () => CheckboxListTile(
                          onFocusChange: (value) {
                            controller.updateButtonState();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          value: controller.isCheckedTerms.value,
                          onChanged: (val) =>
                              controller.isCheckedTerms.value = val ?? true,
                          title: Text(controller.termsAndConditions),
                          checkColor: Colors.white,
                          activeColor: brandColor,
                          checkboxShape: const CircleBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              final FormState? form =
                                  controller.regiFormKey.currentState;
                              if (form?.validate() ?? false) {}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: controller.isButtonEnabled.value
                                  ? brandColor
                                  : brandColor.withOpacity(0.3),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        children: [
                          _policyLink(
                            'Privacy Policy',
                            'https://africacrypto.com/privacy.aspx',
                            brandColor,
                          ),
                          const Text(', '),
                          _policyLink(
                            'Terms of Use',
                            'https://africacrypto.com/TermsandConditions.aspx',
                            brandColor,
                          ),
                          const Text(', '),
                          _policyLink(
                            'AML/CFT Policy',
                            'https://africacrypto.com/AML_CFT_Policy.aspx',
                            brandColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I already have an account'),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Login',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: brandColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required TextEditingController valueController,
    String? Function(String?)? validator,
    bool obscureText = false,
    int? maxLength,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: valueController,
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: (_) => controller.updateButtonState(),
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Enter $label',

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),

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
      ),
    );
  }

  Widget _policyLink(String text, String url, Color color) {
    return InkWell(
      onTap: () => launchUrlString(url, mode: LaunchMode.externalApplication),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
