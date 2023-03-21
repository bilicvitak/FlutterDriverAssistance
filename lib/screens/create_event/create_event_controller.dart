import 'package:flutter/widgets.dart';
import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  ///
  /// DEPENDENCIES
  ///

  final logger = Get.find<LoggerService>();
  final data = Get.find<DriverAssistanceService>();

  ///
  /// VARIABLES
  ///

  final latField = TextEditingController();
  final longField = TextEditingController();

  final _eventTypes = <EventType>[].obs;
  final _eventType = EventType(id: '').obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  ///
  /// GETTERS
  ///

  List<EventType> get eventTypes => _eventTypes;
  EventType get eventType => _eventType.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  ///
  /// SETTERS
  ///

  set eventTypes(List<EventType> value) => _eventTypes.assignAll(value);
  set eventType(EventType value) => _eventType.value = value;
  set latitude(double value) => _latitude.value = value;
  set longitude(double value) => _longitude.value = value;

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

    // todo: Add green/red snackbar

    latField.clear();
    longField.clear();
  }
}
