import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/theme/appcolors.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary10, // mint background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const SizedBox(height: 28),
              _formContainer(),
              const SizedBox(height: 32),
              _registerButton(),
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
          'Registration',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Create your account',
          style: TextStyle(
            color: AppColors.primary100,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ---------------- FORM ----------------
  Widget _formContainer() {
    return Column(
      children: [
        _rowField('First Name', controller.firstNameController),
        _rowField('Last Name', controller.lastNameController),
        _rowField(
          'Email Address',
          controller.emailController,
          keyboard: TextInputType.emailAddress,
        ),
        _rowField(
          'Phone Number',
          controller.phoneController,
          keyboard: TextInputType.phone,
        ),
        _rowField('City', controller.cityController),
        _rowField('Country', controller.countryController),
        _fullWidthField(
          'Additional Information...',
          controller.additionalInfoController,
          maxLines: 4,
        ),
      ],
    );
  }

  // ---------------- REGISTER BUTTON ----------------
  Widget _registerButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: controller.registerUser,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary40, // teal
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Register',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ---------------- FIELD HELPERS ----------------
  Widget _rowField(
    String hint,
    TextEditingController textController, {
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: textController,
        keyboardType: keyboard,
        style: const TextStyle(color: AppColors.textColor),
        decoration: _inputDecoration(hint),
      ),
    );
  }

  Widget _fullWidthField(
    String hint,
    TextEditingController textController, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: textController,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.textColor),
      decoration: _inputDecoration(hint),
    );
  }

  // ---------------- INPUT DECORATION ----------------
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.primary100),
      filled: true,
      fillColor: AppColors.white,
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
