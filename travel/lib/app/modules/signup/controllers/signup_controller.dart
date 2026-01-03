import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
    final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final additionalInfoController = TextEditingController();

  void registerUser() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty
        || cityController.text.isEmpty ||
        countryController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all required fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: API integration
    Get.snackbar(
      'Success',
      'User registered successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.toNamed('/homescreen');
  }

 

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    countryController.dispose();
    additionalInfoController.dispose();
    super.onClose();
  }

}
