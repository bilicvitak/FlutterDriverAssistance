import 'package:flutter/widgets.dart';
import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/location_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:latlong2/latlong.dart';

class CreateEventController extends GetxController {
  ///
  /// DEPENDENCIES
  ///

  final logger = Get.find<LoggerService>();
  final data = Get.find<DriverAssistanceService>();
  final locationService = Get.find<LocationService>();

  ///
  /// VARIABLES
  ///

  final latField = TextEditingController();
  final longField = TextEditingController();

  final _eventTypes = <EventType>[].obs;
  final _eventType = EventType(id: '').obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  final _errorEventType = false.obs;
  final _errorLatitude = false.obs;
  final _errorLongitude = false.obs;
  final _validated = false.obs;

  ///
  /// GETTERS
  ///

  List<EventType> get eventTypes => _eventTypes;
  EventType get eventType => _eventType.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  bool get errorEventType => _errorEventType.value;
  bool get errorLatitude => _errorLatitude.value;
  bool get errorLongitude => _errorLongitude.value;
  bool get validated => _validated.value;

  ///
  /// SETTERS
  ///

  set eventTypes(List<EventType> value) => _eventTypes.assignAll(value);
  set eventType(EventType value) => _eventType.value = value;
  set latitude(double value) => _latitude.value = value;
  set longitude(double value) => _longitude.value = value;

  set errorEventType(bool value) => _errorEventType.value = value;
  set errorLatitude(bool value) => _errorLatitude.value = value;
  set errorLongitude(bool value) => _errorLongitude.value = value;
  set validated(bool value) => _validated.value = value;

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    eventTypes = await data.getEventTypes() ?? <EventType>[];
  }

  ///
  /// METHODS
  ///

  Future<void> createEvent() async {
    final event = Event(
      eventType: eventType.id,
      latitude: latitude,
      longitude: longitude,
      created: DateTime.now(),
      active: true,
    );

    await data.createEvent(event);

    latField.clear();
    longField.clear();
  }

  void validateFields() {
    errorEventType = eventType.id == '';
    errorLatitude = latitude <= 0;
    errorLongitude = longitude <= 0;

    validated = !(errorEventType || errorLatitude || errorLongitude);
  }

  void pickLocation(PickedData pickedData) {
    latField.value =
        latField.value.copyWith(text: pickedData.latLong.latitude.toString());
    longField.value =
        longField.value.copyWith(text: pickedData.latLong.longitude.toString());

    latitude = pickedData.latLong.latitude;
    longitude = pickedData.latLong.longitude;

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
