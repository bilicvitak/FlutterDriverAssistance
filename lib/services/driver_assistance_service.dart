import 'package:flutter_driver_assistance/constants/endpoints.dart';
import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/services/dio_service.dart';
import 'package:get/get.dart';

import 'logger_service.dart';

class DriverAssistanceService extends GetxService {
  ///
  /// DEPENDENCIES
  ///

  final dio = Get.find<DioService>();
  final logger = Get.find<LoggerService>();

  ///
  /// METHODS
  ///

  Future<Event?> createEvent(Event event) async {
    const endpoint = DAEndpoints.baseUrl + DAEndpoints.createEvent;

    final response = await dio.request(
        endpoint: endpoint,
        httpMethod: HttpMethod.post,
        parameters: event.toMap(),
        onSuccess: ((responseData) => responseData));

    return (response as String).isEmpty ? event : null;
  }

  Future<List<Event>?> getEvents(double lat, double long) async {
    final endpoint = DAEndpoints.baseUrl + DAEndpoints.getEvents(lat, long);

    final response = await dio.request(
        endpoint: endpoint,
        httpMethod: HttpMethod.get,
        onSuccess: ((responseData) => responseData));

    final events =
        (response as List<dynamic>).map((e) => Event.fromJson(e)).toList();

    return events;
  }

  Future<List<EventType>?> getEventTypes() async {
    const endpoint = DAEndpoints.baseUrl + DAEndpoints.getEventTypes;

    final response = await dio.request(
        endpoint: endpoint,
        httpMethod: HttpMethod.get,
        onSuccess: ((responseData) async => responseData));

    final eventTypes =
        (response as List<dynamic>).map((e) => EventType(e as String)).toList();

    return eventTypes;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    await getEventTypes();
    await getEvents(45, 18);
  }
}
