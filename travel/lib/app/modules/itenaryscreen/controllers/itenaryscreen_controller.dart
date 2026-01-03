import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItenaryscreenController extends GetxController {
 final List<ItinerarySectionModel> sections = [
    ItinerarySectionModel(),
  ];

  /// Add another section
  void addSection() {
    sections.add(ItinerarySectionModel());
    update();
  }

  /// Pick date range
  Future<void> pickDateRange(
    BuildContext context,
    ItinerarySectionModel section,
  ) async {
    final DateTimeRange? range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (range != null) {
      section.startDate = range.start;
      section.endDate = range.end;
      update();
    }
  }
}

/// SECTION MODEL (frontend-only)
class ItinerarySectionModel {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
}

