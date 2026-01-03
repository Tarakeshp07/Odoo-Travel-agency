import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel/app/theme/appcolors.dart';

import '../controllers/itenaryscreen_controller.dart';

class ItenaryscreenView extends GetView<ItenaryscreenController> {
  const ItenaryscreenView({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Build Itenary',
          style: TextStyle(color: AppColors.textColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<ItenaryscreenController>(
        builder: (_) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ...List.generate(
                controller.sections.length,
                (index) => _sectionCard(
                  context,
                  controller.sections[index],
                  index + 1,
                ),
              ),
              const SizedBox(height: 16),
              _addSectionButton(),
            ],
          );
        },
      ),
    );
  }

  /// SECTION CARD
  Widget _sectionCard(
    BuildContext context,
    ItinerarySectionModel section,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section title
          Text(
            'Section $index',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 8),

          /// Description text
          _inputField(
            controller: section.descriptionController,
            hint:
                'Information about this section.',
            maxLines: 3,
          ),
          const SizedBox(height: 12),

          /// Date & Budget
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () =>
                      controller.pickDateRange(context, section),
                  child: _infoBox(
                    text: section.startDate == null
                        ? 'Date Range:xxx to yyy'
                        : 'Date Range : ${section.startDate!.day}/${section.startDate!.month} to ${section.endDate!.day}/${section.endDate!.month}',
                    style: const TextStyle(color: AppColors.textColor),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _inputField(
                  controller: section.budgetController,
                  hint: 'Budget',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ADD SECTION BUTTON
  Widget _addSectionButton() {
    return OutlinedButton.icon(
      onPressed: controller.addSection,
      icon: const Icon(Icons.add, color: AppColors.textColor),
      label: const Text(
        'Add another Section',
        style: TextStyle(color: AppColors.textColor),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: AppColors.primary20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
  /// INFO BOX (Date Range)
  Widget _infoBox({required String text, TextStyle? style}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: style ?? const TextStyle(color: AppColors.primary40),
      ),
    );
  }
  }
