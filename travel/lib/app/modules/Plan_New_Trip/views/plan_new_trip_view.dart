import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/theme/appcolors.dart';
import '../controllers/plan_new_trip_controller.dart';

class PlanNewTripView extends GetView<PlanNewTripController> {
  const PlanNewTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Create New Trip',
          style: TextStyle(color: AppColors.textColor),
        ),
       
      ),

      body: GetBuilder<PlanNewTripController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Trip Name
                const Text('Select Places',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                const SizedBox(height: 6),
                _inputField(
                  controller: controller.tripNameController,
                  hint: 'e.g. Paris Summer Trip',
                ),

                const SizedBox(height: 16),

                /// Dates
                Row(
                  children: [
                    Expanded(
                      child: _dateField(
                        context,
                        label: 'Start Date',
                        value: controller.startDate,
                        onTap: () => controller.pickDate(context, true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _dateField(
                        context,
                        label: 'End Date',
                        value: controller.endDate,
                        onTap: () => controller.pickDate(context, false),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Description
                const Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                const SizedBox(height: 6),
                _inputField(
                  controller: controller.descriptionController,
                  hint: 'Add notes about your trip...',
                  maxLines: 4,
                ),

                const SizedBox(height: 20),

             

              
                /// Suggestions Grid
                const Text(
                  'Suggestions for places to visit / activities',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                const SizedBox(height: 12),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.suggestions.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.suggestions[index];
                    final selected =
                        controller.selectedSuggestions.contains(item);

                    return GestureDetector(
                      onTap: () => controller.toggleSuggestion(item['name']!),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.primary40
                              : AppColors.primary10,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primary20,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            controller.suggestions[index]['name']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selected
                                  ? AppColors.textColor
                                  : AppColors.primary40,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),
                  Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isFormValid
                          ? AppColors.accent100
                          : AppColors.primary20,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: controller.saveTrip,
                    child: const Text('Save',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary100),),
                  ),
                ),
              ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Reusable Input
  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.primary10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Date Field
  Widget _dateField(
    BuildContext context, {
    required String label,
    required DateTime? value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today,
                    size: 18, color: AppColors.primary40),
                const SizedBox(width: 8),
                Text(
                  value == null
                      ? 'Select date'
                      : '${value.day}/${value.month}/${value.year}',
                  style: const TextStyle(color: AppColors.primary40),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
