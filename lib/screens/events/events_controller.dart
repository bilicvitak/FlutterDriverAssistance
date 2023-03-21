import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/services/driver_assistance_service.dart';
import 'package:flutter_driver_assistance/services/logger_service.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  ///
  /// DEPENDENCIES
  ///
  final logger = Get.find<LoggerService>();
  final data = Get.find<DriverAssistanceService>();

  ///
  /// VARIABLES
  ///

  final _events = <Event>[].obs;
  final _showProgressIndicator = true.obs;

  ///
  /// GETTERS
  ///

  List<Event> get events => _events;
  bool get showProgressIndicator => _showProgressIndicator.value;

  ///
  /// SETTERS
  ///

  set events(List<Event> value) => _events.assignAll(value);
  set showProgressIndicator(bool value) => _showProgressIndicator.value = value;

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    events = await data.getEvents(45, 18) ?? <Event>[];
    showProgressIndicator = false;
  }

  ///
  /// METHODS
  ///
}
