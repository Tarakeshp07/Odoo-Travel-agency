import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel/app/theme/appcolors.dart';

import '../controllers/my_trips_controller.dart';

class MyTripsView extends GetView<MyTripsController> {
  const MyTripsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary10,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _searchAndActions(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _section(
                      title: 'Ongoing',
                      trips: controller.ongoingTrips,
                    ),
                    _section(
                      title: 'Up-coming',
                      trips: controller.upcomingTrips,
                    ),
                    _section(
                      title: 'Completed',
                      trips: controller.completedTrips,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'User Trip Listing',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'GlobalTrotter',
                  style: TextStyle(
                    color: AppColors.primary100,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary40,
            child: const Text(
              'AK',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  // ---------------- SEARCH + ACTIONS ----------------
  Widget _searchAndActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            onChanged: controller.onSearchChanged,
            style: const TextStyle(color: AppColors.textColor),
            decoration: InputDecoration(
              hintText: 'Search trip...',
              hintStyle: TextStyle(color: AppColors.primary100.withOpacity(0.6)),
              filled: true,
              fillColor: AppColors.primary10,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary40),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _actionButton('Group by', controller.onGroupBy),
              const SizedBox(width: 8),
              _actionButton('Filter', controller.onFilter),
              const SizedBox(width: 8),
              _actionButton('Sort by', controller.onSort),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- SECTION ----------------
  Widget _section({
    required String title,
    required List<String> trips,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...trips.map(_tripCard).toList(),
      ],
    );
  }

  // ---------------- TRIP CARD ----------------
  Widget _tripCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
        ),
      ),
    );
  }

  // ---------------- ACTION BUTTON ----------------
  Widget _actionButton(String text, VoidCallback onTap) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.primary10,
          foregroundColor: AppColors.textColor,
          side: const BorderSide(color: AppColors.primary20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
      ),
    );

  }
}

  
