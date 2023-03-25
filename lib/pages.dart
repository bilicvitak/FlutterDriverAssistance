import 'package:flutter_driver_assistance/screens/create_event/create_event_binding.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_screen.dart';
import 'package:flutter_driver_assistance/screens/create_event/screens/pick_location_screen.dart';
import 'package:flutter_driver_assistance/screens/events/screens/event_details_screen.dart';
import 'package:flutter_driver_assistance/screens/events/events_binding.dart';
import 'package:flutter_driver_assistance/screens/events/events_screen.dart';
import 'package:flutter_driver_assistance/screens/events/screens/events_location_screen.dart';
import 'package:flutter_driver_assistance/screens/main/main_binding.dart';
import 'package:flutter_driver_assistance/screens/main/main_screen.dart';
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
    name: DARoutes.splashScreen,
    page: SplashScreen.new,
    binding: SplashBinding(),
  ),
  GetPage(
    name: DARoutes.mainScreen,
    page: MainScreen.new,
    binding: MainBinding(),
    transition: Transition.upToDown,
    transitionDuration: const Duration(seconds: 1),
  ),
  GetPage(
    name: DARoutes.eventsScreen,
    page: EventsScreen.new,
    binding: EventsBinding(),
  ),
  GetPage(
    name: DARoutes.eventDetailsScreen,
    page: EventDetailsScreen.new,
  ),
  GetPage(
    name: DARoutes.createEventScreen,
    page: CreateEventScreen.new,
    binding: CreateEventBinding(),
  ),
  GetPage(
    name: DARoutes.pickLocationScreen,
    page: PickLocationScreen.new,
  ),
  GetPage(
    name: DARoutes.eventsLocationScreen,
    page: EventsLocationScreen.new,
  ),
];

/// All pages have their designated names which can be found here
class DARoutes {
  static const splashScreen = '/splash_screen';
  static const mainScreen = '/main_screen';
  static const eventsScreen = '/events_screen';
  static const eventDetailsScreen = '/event_details_screen';
  static const createEventScreen = '/create_event_screen';
  static const pickLocationScreen = '/pick_location_screen';
  static const eventsLocationScreen = '/events_location_screen';
}
