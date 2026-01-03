import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanNewTripController extends GetxController {
/// Text Controllers
  final tripNameController = TextEditingController();
  final descriptionController = TextEditingController();

  /// Dates
  DateTime? startDate;
  DateTime? endDate;

  /// Suggested cards (from requirement flow)
  final List<Map<String, String>> suggestions = [
    {
      'name': 'Beaches',
      'image': 'https://picsum.photos/200?1',
    },
    {
      'name': 'Mountains',
      'image': 'https://picsum.photos/200?2',
    },
    {
      'name': 'Food',
      'image': 'https://picsum.photos/200?3',
    },
    {
      'name': 'Adventure',
      'image': 'https://picsum.photos/200?4',
    },
    {
      'name': 'Culture',
      'image': 'https://picsum.photos/200?5',
    },
    {
      'name': 'Shopping',
      'image': 'https://picsum.photos/200?6',
    },
  ];

  /// Selected suggestions
  final List<String> selectedSuggestions = [];
  /// Pick Date
  Future<void> pickDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      if (isStart) {
        startDate = picked;
      } else {
        endDate = picked;
      }
      update();
    }
  }

  /// Toggle Suggestion
  void toggleSuggestion(String value) {
    if (selectedSuggestions.contains(value)) {
      selectedSuggestions.remove(value);
    } else {
      selectedSuggestions.add(value);
    }
    update();
  }

 /// Validation
  bool get isFormValid {
    return tripNameController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        startDate != null &&
        endDate != null; 

  }

  /// Save Trip
  void saveTrip() {
    if (!isFormValid) {
      Get.snackbar(
        'Error',
        'Please fill all the required fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// Backend integration later
    Get.toNamed('/itenaryscreen');
  }

  @override
  void onClose() {
    tripNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

}
