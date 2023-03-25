import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/pages.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/location_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class EventsController extends GetxController {
  ///
  /// DEPENDENCIES
  ///
  final logger = Get.find<LoggerService>();
  final data = Get.find<DriverAssistanceService>();
  final locationService = Get.find<LocationService>();

  ///
  /// VARIABLES
  ///

  final _events = <Event>[].obs;
  final _showProgressIndicator = true.obs;
  final _selectedIndex = 0.obs;
  final _address = ''.obs;
  final _latitude = 45.0.obs;
  final _longitude = 18.0.obs;

  ///
  /// GETTERS
  ///

  List<Event> get events => _events;
  bool get showProgressIndicator => _showProgressIndicator.value;
  int get selectedIndex => _selectedIndex.value;
  String get address => _address.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  ///
  /// SETTERS
  ///

  set events(List<Event> value) => _events.assignAll(value);
  set showProgressIndicator(bool value) => _showProgressIndicator.value = value;
  set selectedIndex(int value) => _selectedIndex.value = value;
  set address(String value) => _address.value = value;
  set latitude(double value) => _latitude.value = value;
  set longitude(double value) => _longitude.value = value;

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    events = await data.getEvents(latitude, longitude) ?? <Event>[];
    showProgressIndicator = false;
  }

  ///
  /// METHODS
  ///

  Future<void> goToEventDetails() async =>
      await Get.toNamed(DARoutes.eventDetailsScreen);

  Future<void> setLocation(PickedData pickedData) async {
    address = pickedData.address;
    latitude = pickedData.latLong.latitude;
    longitude = pickedData.latLong.longitude;

    events = await data.getEvents(latitude, longitude) ?? <Event>[];

    Get.back();
  }

  Future<LatLng> getCurrentLocation() async {
    final location = await locationService.getLocationWithGeolocatorPackage();
    final latitude = location?.latitude;
    final longitude = location?.longitude;

    if (latitude != null && longitude != null) {
      return LatLng(latitude, longitude);
    }

    return LatLng(45.2862381, 18.4067281);
  }
}
