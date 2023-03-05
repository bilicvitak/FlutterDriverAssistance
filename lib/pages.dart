import 'package:flutter_driver_assistance/screens/create_event/create_event_binding.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_screen.dart';
import 'package:flutter_driver_assistance/screens/event_details/event_details_binding.dart';
import 'package:flutter_driver_assistance/screens/event_details/event_details_screen.dart';
import 'package:flutter_driver_assistance/screens/events/events_binding.dart';
import 'package:flutter_driver_assistance/screens/events/events_screen.dart';
import 'package:flutter_driver_assistance/screens/home/home_binding.dart';
import 'package:flutter_driver_assistance/screens/home/home_screen.dart';
import 'package:flutter_driver_assistance/screens/main_screen.dart';
import 'package:flutter_driver_assistance/screens/splash/splash_biding.dart';
import 'package:flutter_driver_assistance/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

///
/// All pages used in the application
/// Also linked to the relevant bindings in order to
/// initialize / dispose proper controllers when neccesarry
///

final pages = [
  GetPage(
    name: MyRoutes.splashScreen,
    page: SplashScreen.new,
    binding: SplashBinding(),
  ),
  GetPage(
    name: MyRoutes.mainScreen,
    page: MainScreen.new,
  ),
  GetPage(
    name: MyRoutes.homeScreen,
    page: HomeScreen.new,
    binding: HomeBinding(),
  ),
  GetPage(
    name: MyRoutes.eventsScreen,
    page: EventsScreen.new,
    binding: EventsBinding(),
  ),
  GetPage(
    name: MyRoutes.eventDetailsScreen,
    page: EventDetailsScreen.new,
    binding: EventDetailsBinding(),
  ),
  GetPage(
    name: MyRoutes.createEventScreen,
    page: CreateEventScreen.new,
    binding: CreateEventBinding(),
  ),
];

/// All pages have their designated names which can be found here
class MyRoutes {
  static const splashScreen = '/splash_screen';
  static const mainScreen = '/main_screen';
  static const homeScreen = '/home_screen';
  static const eventsScreen = '/events_screen';
  static const eventDetailsScreen = '/event_details_screen';
  static const createEventScreen = '/create_event_screen';
}
