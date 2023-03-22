import 'package:flutter_driver_assistance/constants/endpoints.dart';
import 'package:flutter_driver_assistance/models/event.dart';
import 'package:flutter_driver_assistance/models/event_type.dart';
import 'package:flutter_driver_assistance/services/dio_service.dart';
import 'package:flutter_driver_assistance/util/snackbars.dart';
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
        onError: (error) => DASnackbars.showErrorSnackbar(
            message: 'Failed to create an event: $error'),
        onSuccess: ((responseData) async {
          DASnackbars.showSuccessSnackbar(message: 'Event created');
          return responseData;
        }));

    return (response as String).isEmpty ? event : null;
  }

  Future<List<Event>?> getEvents(double lat, double long) async {
    final endpoint = DAEndpoints.baseUrl + DAEndpoints.getEvents(lat, long);

    final response = await dio.request(
        endpoint: endpoint,
        httpMethod: HttpMethod.get,
        onError: (error) => DASnackbars.showErrorSnackbar(
            message: 'Failed to fetch events: $error'),
        onSuccess: ((responseData) async => responseData));

    if (response != null) {
      final events =
          (response as List<dynamic>).map((e) => Event.fromMap(e)).toList();

      return events;
    }

    return null;
  }

  Future<List<EventType>?> getEventTypes() async {
    const endpoint = DAEndpoints.baseUrl + DAEndpoints.getEventTypes;

    final response = await dio.request(
        endpoint: endpoint,
        httpMethod: HttpMethod.get,
        onError: (error) => DASnackbars.showErrorSnackbar(
            message: 'Failed to load event types: $error'),
        onSuccess: ((responseData) async => responseData));

    final eventTypes = (response as List<dynamic>)
        .map((e) => EventType(id: e as String))
        .toList();

    return eventTypes;
  }
}
