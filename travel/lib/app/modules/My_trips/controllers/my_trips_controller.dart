import 'package:get/get.dart';

class MyTripsController extends GetxController {
  //TODO: Implement MyTripsController
final searchText = ''.obs;

  final ongoingTrips = [
    'Short Overview of the Trip',
  ].obs;

  final upcomingTrips = [
    'Short Overview of the Trip',
  ].obs;

  final completedTrips = [
    'Short Overview of the Trip',
    'Short Overview of the Trip',
  ].obs;

  void onSearchChanged(String value) {
    searchText.value = value;
  }

  void onGroupBy() {
    // TODO: implement group logic
  }

  void onFilter() {
    // TODO: implement filter logic
  }

  void onSort() {
    // TODO: implement sort logic
  }
}
