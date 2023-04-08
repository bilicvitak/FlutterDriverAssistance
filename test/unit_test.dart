import 'package:flutter_driver_assistance/screens/create_event/create_event_controller.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/location_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import 'unit_test.mocks.dart';

InternalFinalCallback onStart({dynamic service}) =>
    InternalFinalCallback(callback: () => service);

@GenerateMocks([LoggerService, DriverAssistanceService, LocationService])
void main() {
  late CreateEventController controller;

  setUp(() {
    Get.testMode = true;

    Get.lazyPut(() => CreateEventController());
  });

  tearDown(() => Get.delete<CreateEventController>());

  test('Get current location', () {
    /// Arrange
    final mockLoggerService = MockLoggerService();
    final mockDriverAssistanceService = MockDriverAssistanceService();
    final mockLocationService = MockLocationService();

    Get.lazyPut(() => mockLoggerService as LoggerService);
    Get.lazyPut(() => mockDriverAssistanceService as DriverAssistanceService);
    Get.lazyPut(() => mockLocationService as LocationService);

    when(mockLoggerService.onStart).thenReturn(onStart(
      service: mockLoggerService,
    ));
    when(mockDriverAssistanceService.onStart).thenReturn(onStart(
      service: mockDriverAssistanceService,
    ));
    when(mockLocationService.onStart).thenReturn(onStart(
      service: mockLocationService,
    ));

    when(mockDriverAssistanceService.getEventTypes())
        .thenAnswer((_) async => []);

    controller = Get.find<CreateEventController>();

    final pickedData = PickedData(
      LatLong(45.2862381, 18.4067281),
      'Ul. Petra Preradovića 225, 31400 Đakovo',
    );

    /// Act
    controller.pickLocation(pickedData);

    /// Assert
    expect(controller.latitude, pickedData.latLong.latitude);
    expect(controller.longitude, pickedData.latLong.longitude);
    expect(
        controller.latField.value.text, pickedData.latLong.latitude.toString());
    expect(controller.longField.value.text,
        pickedData.latLong.longitude.toString());
  });
}
