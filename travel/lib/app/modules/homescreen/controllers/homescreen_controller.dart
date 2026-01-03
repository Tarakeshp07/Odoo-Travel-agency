import 'package:get/get.dart';
import 'package:travel/app/modules/homescreen/models/homescreen_models.dart';

class HomescreenController extends GetxController {


  List<TripModel> upcomingTrips = [
    TripModel(
      image: '',
      title: 'Summer in Paris',
      date: 'Jun 15 - Jun 22',
      cityCount: 3,
    ),
    TripModel(
      image: '',
      title: 'Tokyo Adventure',
      date: 'Aug 10 - Aug 20',
      cityCount: 2,
    ),
  ];

  /// ===============================
  /// NEW: Popular Destinations
  /// ===============================
  List<PopularDestinationModel> popularDestinations = [
    PopularDestinationModel(
      image: '',
      city: 'Barcelona',
      country: 'Spain',
    ),
    PopularDestinationModel(
      image: '',
      city: 'New York',
      country: 'USA',
    ),
    PopularDestinationModel(
      image: '',
      city: 'Dubai',
      country: 'UAE',
    ),
  ];

}

