import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/app/theme/appcolors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary10,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              _title(),
              const SizedBox(height: 60),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              _forgotPassword(),
              const SizedBox(height: 32),
              _loginButton(),
              const SizedBox(height: 24),
              _divider(),
              const SizedBox(height: 24),
              Center(
                child: TextButton(onPressed: (){
                  Get.toNamed(Routes.SIGNUP);
                }, 
                child: Text("Sign up",style:TextStyle(
                  color: Colors.black
                ))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  // ---------------- TITLE ----------------
  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome Back',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign in to manage your travel plans',
          style: TextStyle(
            color: AppColors.primary100,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ---------------- EMAIL ----------------
  Widget _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: _inputDecoration(
            hint: 'your.email@example.com',
            icon: Icons.email_outlined,
          ),
        ),
      ],
    );
  }

  // ---------------- PASSWORD ----------------
  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => TextField(
            controller: controller.passwordController,
            obscureText: controller.isPasswordHidden.value,
            decoration: _inputDecoration(
              hint: '••••••••',
              icon: Icons.lock_outline,
              suffix: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.primary100,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- FORGOT ----------------
  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: controller.forgotPassword,
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: AppColors.accent100,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ---------------- LOGIN BUTTON ----------------
  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: controller.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ---------------- DIVIDER ----------------
  Widget _divider() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.primary20)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: TextStyle(color: AppColors.primary100),
          ),
        ),
        Expanded(child: Divider(color: AppColors.primary20)),
      ],
    );
  }

  // ---------------- INPUT DECORATION ----------------
  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: AppColors.primary100),
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.primary10,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary40),
      ),
    );

  }
}
