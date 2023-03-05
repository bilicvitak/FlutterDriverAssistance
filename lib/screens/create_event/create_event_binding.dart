import 'create_event_controller.dart';
import 'package:get/get.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEventController());
  }
}
