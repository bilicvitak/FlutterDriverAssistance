import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Class used to localize the app
/// Uses key-value pairs which are stored here
/// and then used in widgets with `'someStringKey'.tr`
///
class Localization extends Translations {
  static Locale? get locale => Get.deviceLocale;

  /// If the device is set to some language which is not in this `Map`,
  /// language will fallbact to [en-US]
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'hr': hr,
      };

  /// English strings
  final en = {
    'appName': 'Flutter Driver Assistance',
    'trafficEvents': 'Traffic events',
    'addEvent': 'Add event',
    'events': 'Events',
    'eventType': 'Event type',
    'location': 'Location',
    'createButton': 'CREATE',
    'latitude': 'Latitude',
    'longitude': 'Longitude',
  };

  /// Croatian strings
  final hr = {
    'appName': 'Flutter Driver Assistance',
    'trafficEvents': 'Stanje u prometu',
    'addEvent': 'Novi događaj',
    'events': 'Stanje u prometu',
    'eventType': 'Tip događaja',
    'location': 'Location',
    'createButton': 'SPREMI',
    'latitude': 'Latitude',
    'longitude': 'Longitude',
  };
}
