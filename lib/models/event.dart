class Event {
  final String eventType;
  final double latitude;
  final double longitude;
  final DateTime created;
  final DateTime modified;
  final String userId;
  final bool active;

  Event(
      {required this.eventType,
      required this.latitude,
      required this.longitude,
      required this.created,
      required this.modified,
      required this.userId,
      required this.active});
}
