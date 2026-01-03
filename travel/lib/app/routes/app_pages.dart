import 'package:get/get.dart';

import '../modules/My_trips/bindings/my_trips_binding.dart';
import '../modules/My_trips/views/my_trips_view.dart';
import '../modules/Plan_New_Trip/bindings/plan_new_trip_binding.dart';
import '../modules/Plan_New_Trip/views/plan_new_trip_view.dart';
import '../modules/homescreen/bindings/homescreen_binding.dart';
import '../modules/homescreen/views/homescreen_view.dart';
import '../modules/itenaryscreen/bindings/itenaryscreen_binding.dart';
import '../modules/itenaryscreen/views/itenaryscreen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOMESCREEN,
      page: () => const HomescreenView(),
      binding: HomescreenBinding(),
    ),
    GetPage(
      name: _Paths.PLAN_NEW_TRIP,
      page: () => const PlanNewTripView(),
      binding: PlanNewTripBinding(),
    ),
    GetPage(
      name: _Paths.MY_TRIPS,
      page: () => const MyTripsView(),
      binding: MyTripsBinding(),
    ),
    GetPage(
      name: _Paths.ITENARYSCREEN,
      page: () => const ItenaryscreenView(),
      binding: ItenaryscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
