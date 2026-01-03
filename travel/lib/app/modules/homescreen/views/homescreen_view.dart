import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/theme/appcolors.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomescreenController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.settings, color: AppColors.textColor),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: AppColors.textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Greeting
            const Text(
              "Hello, Traveler",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Where to next?",
              style: TextStyle(color: AppColors.primary40),
            ),

            const SizedBox(height: 20),

            /// Action Buttons
            Row(
              children: [
                Expanded(
                  child: _ActionCard(
                    color: AppColors.primary40,
                    icon: Icons.add,
                    title: "Plan New Trip",
                    textColor: AppColors.textColor,
                    onTap: () {
                      Get.toNamed('/plan-new-trip');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionCard(
                    color: AppColors.white,
                    icon: Icons.calendar_today,
                    title: "My Trips",
                    textColor: AppColors.textColor,
                    border: true,
                    onTap: () {
                      Get.toNamed('/my-trips');
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Upcoming Trips Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Upcoming Trips",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: AppColors.accent100),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Upcoming Trips List
            ListView.builder(
              itemCount: controller.upcomingTrips.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final trip = controller.upcomingTrips[index];
                return _TripCard(trip: trip);
              },
            ),

            const SizedBox(height: 24),

            /// Popular Destinations Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Popular Destinations",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Icon(Icons.trending_up, color: AppColors.primary40),
              ],
            ),

            const SizedBox(height: 12),

            /// Popular Destinations Horizontal List
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularDestinations.length,
                itemBuilder: (context, index) {
                  final destination =
                      controller.popularDestinations[index];
                  return _PopularDestinationCard(destination: destination);
                },
              ),
            ),

            const SizedBox(height: 24),

            /// Budget Tracker
            _BudgetTrackerCard(),
          ],
        ),
      ),
    );
  }
}
class _ActionCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final Color textColor;
  final bool border;
  final VoidCallback onTap;

  const _ActionCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.textColor,
    this.border = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: border
              ? Border.all(color: AppColors.primary20)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: textColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _TripCard extends StatelessWidget {
  final dynamic trip;

  const _TripCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primary20,
            backgroundImage: AssetImage(trip.image),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  trip.date,
                  style: const TextStyle(
                    color: AppColors.primary40,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${trip.cityCount} cities",
            style: const TextStyle(color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
class _PopularDestinationCard extends StatelessWidget {
  final dynamic destination;

  const _PopularDestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primary10,
            backgroundImage: AssetImage(destination.image),
          ),
          const SizedBox(height: 8),
          Text(
            destination.city,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            destination.country,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primary40,
            ),
          ),
        ],
      ),
    );
  }
}
class _BudgetTrackerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accent100,
            child: const Icon(Icons.attach_money, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Budget Tracker",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Keep your trips on budget with smart expense tracking",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primary40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
