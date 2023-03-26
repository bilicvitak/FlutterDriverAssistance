import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late DriverAssistanceService _service;

  setUp(() {
    _service = Get.put(DriverAssistanceService());
  });

  tearDown(() => Get.delete<DriverAssistanceService>());

  test('Get events', () => null);
}
