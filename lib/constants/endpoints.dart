///
/// This is a class where all endpoints are stored
/// You can then reference them in code with `DAEndpoints.someEndpoint`
///

class DAEndpoints {
  /// Replace `localhost` with IPv4 address
  /// static const baseUrl = 'http://192.168.100.4:8080/api/';
  static const baseUrl = 'http://192.168.1.4:8080/api/';

  static const createEvent = 'events/'; // Create new event
  static const getEventTypes = 'events/eventtypes'; // Get possible event types
  static String getEvents(double lat, double long) =>
      'events/latitude/$lat/longitude/$long'; // Get events in specific area
}
