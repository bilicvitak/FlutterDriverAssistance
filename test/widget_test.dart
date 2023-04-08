import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/keys.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/screens/create_event/create_event_controller.dart';
import 'package:flutter_driver_assistance/screens/main/main_controller.dart';
import 'package:flutter_driver_assistance/screens/main/main_screen.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/location_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

InternalFinalCallback onStart({dynamic service}) =>
    InternalFinalCallback(callback: () => service);

void main() {
  late Widget createEventScreen;

  setUp(() {
    Get.testMode = true;

    final mockLoggerService = MockLoggerService();
    final mockDriverAssistanceService = MockDriverAssistanceService();
    final mockLocationService = MockLocationService();

    Get.lazyPut(() => mockLoggerService as LoggerService);
    Get.lazyPut(() => mockDriverAssistanceService as DriverAssistanceService);
    Get.lazyPut(() => mockLocationService as LocationService);
    Get.lazyPut(() => MainController());

    when(mockLoggerService.onStart).thenReturn(onStart(
      service: mockLoggerService,
    ));
    when(mockDriverAssistanceService.onStart).thenReturn(onStart(
      service: mockDriverAssistanceService,
    ));
    when(mockLocationService.onStart).thenReturn(onStart(
      service: mockLocationService,
    ));

    when(mockDriverAssistanceService.getEventTypes()).thenAnswer((_) async => [
          EventType(id: 'FIRST'),
          EventType(id: 'SECOND'),
        ]);

    createEventScreen = ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp(
        home: MainScreen(),
      ),
    );
  });

  tearDown(() {
    Get.delete<LoggerService>();
    Get.delete<DriverAssistanceService>();
    Get.delete<LocationService>();
    Get.delete<CreateEventController>();
    Get.delete<MainController>();
  });

  testWidgets('Write latitude', (tester) async {
    /// Arrange
    final latitudeField = find.byKey(DAKeys.tfLatitude);

    /// Act
    Get.find<MainController>().selectedIndex = 1;
    await tester.pumpWidget(createEventScreen); // build widget

    await tester.tap(latitudeField);
    await tester.enterText(latitudeField, '41.256');
    await tester.pump();

    /// Assert
    final controller = Get.find<CreateEventController>();
    expect(controller.latField.value.text, '41.256');
  });
}
