class TripModel {
  final String image;
  final String title;
  final String date;
  final int cityCount;

  TripModel({
    required this.image,
    required this.title,
    required this.date,
    required this.cityCount,
  });
}

class PopularDestinationModel {
  final String image;
  final String city;
  final String country;

  PopularDestinationModel({
    required this.image,
    required this.city,
    required this.country,
  });
}
