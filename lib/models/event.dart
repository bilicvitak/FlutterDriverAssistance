import 'dart:convert';

class Event {
  final String eventType;
  final double latitude;
  final double longitude;
  final DateTime created;
  final DateTime? modified;
  final String? userId;
  final bool active;

  Event({
    required this.eventType,
    required this.latitude,
    required this.longitude,
    required this.created,
    this.modified,
    this.userId,
    required this.active,
  });

  Event copyWith({
    String? eventType,
    double? latitude,
    double? longitude,
    DateTime? created,
    DateTime? modified,
    String? userId,
    bool? active,
  }) =>
      Event(
        eventType: eventType ?? this.eventType,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        created: created ?? this.created,
        modified: modified ?? this.modified,
        userId: userId,
        active: active ?? this.active,
      );

  Map<String, dynamic> toMap() => {
        'eventType': eventType,
        'latitude': latitude,
        'longitude': longitude,
        'created': created.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'userId': userId,
        'active': active,
      };

  factory Event.fromMap(Map<String, dynamic> map) => Event(
        eventType: map['eventType'] ?? '',
        latitude: map['latitude'] ?? 0,
        longitude: map['longitude'] ?? 0,
        created: map['created'] ?? DateTime.now(),
        modified: map['modified'],
        userId: map['userId'],
        active: map['active'] ?? false,
      );

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() =>
      'Event(eventType: $eventType, latitude: $latitude, longitude: $longitude, created: $created, modified: $modified, userId: $userId, active: $active)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Event &&
        other.eventType == eventType &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.created == created &&
        other.modified == modified &&
        other.userId == userId &&
        other.active == active;
  }

  @override
  int get hashCode =>
      eventType.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      created.hashCode ^
      modified.hashCode ^
      userId.hashCode ^
      active.hashCode;
}
